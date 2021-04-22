<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<style type="text/css">
#myImage {
	width: 100%;
	height: 100%
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<%@ include file="/WEB-INF/views/include/header.jsp"%>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>식음료 찾기</h1>
					<p>사진 찍으신 제품이 무엇인지 알려드립니다.</p>
				</header>

				<section class="tiles mytiles">
					<article class="style1">
						<div id="webcam-container"></div>
					</article>
					<article class="style1">
						<span class="image"> <img id="myImage" src="/resources/images/pic01.jpg" alt="" />
						</span> 
							<a onclick="pause()">
								<div class="content">
									<img style="width: 20%; opacity: 70%;" src="/resources/images/camera.png" alt="" />
									<h2>&nbsp;사진 찍기</h2>
								</div>
							</a>
					</article>
				</section>
				<p style="text-align: center; margin-top: 2em">* 재촬영을 원하시면 이미지를 눌러주세요.</p>
				<hr>
				<h2>제품명</h2>
				<div>
					<blockquote>
						<div id="label-container"></div>
					</blockquote>
				</div>
				<a href="#" class="button primary fit" style="background-color: #f2849e">소리듣기</a>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp"%>

	<script type="text/javascript">
		const URL = "https://teachablemachine.withgoogle.com/models/hiFJDaDW4/";

		let model, webcam, labelContainer, maxPredictions;

		async function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";

			model = await tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			const flip = true;
			webcam = new tmImage.Webcam(300, 300, flip); // width, height, flip
			await webcam.setup(); // request access to the webcam
			await webcam.play();
			window.requestAnimationFrame(loop);

			// append elements to the DOM
			document.getElementById("webcam-container").appendChild(webcam.canvas);
			document.querySelector("canvas").setAttribute("id", "canvas");
			document.querySelector("canvas").style.width = "100%";
			document.querySelector("canvas").style.height = "100%";
		}

		init();

		async function pause() { //이미지 클릭 시 사진 찍힘
			const prediction = await model.predict(webcam.canvas);
			var predictionValue = new Array();
			var food;
			var category = "식음료";

			for (let i = 0; i < maxPredictions; i++) {
				predictionValue[i] = prediction[i].probability.toFixed(2);
			}

			const maxValue = Math.max.apply(null, predictionValue);

			for (let i = 0; i < maxPredictions; i++) { //클래스에 따라 결과값 반환
				if (prediction[i].probability.toFixed(2) == maxValue) {
					switch (prediction[i].className) {
					case "food_cocopalm":
						food = "코코팜";
						break;
					case "food_welchs":
						food = "웰치스";
						break;
					case "food_choco":
						food = "초코송이";
						break;
					case "food_chip":
						food = "포카칩";
						break;
					}
					document.getElementById('label-container').innerHTML = "<div>이 제품은 " + food + "입니다.</div>";
				}
			}

			var myImage = document.getElementById('myImage');
			myImage.src = document.getElementById('canvas').toDataURL(); //멈춘 canvas를 이미지url로 변환

			var file = dataURLtoFile(document.getElementById('canvas').toDataURL());
			console.log(file);
			
			var teachData = new Array(category, food); //티처블 테이블에 저장될 속성을 배열로 전송
			console.log(teachData);
			
			formImage(teachData, file); //formImage함수에 변수로 넘겨줌
		}

		function dataURLtoFile(dataurl, filename) { //url을 디코딩해서 file 객체로 만듦
			var arr = dataurl.split(','), 
				mime = arr[0].match(/:(.*?);/)[1], 
				bstr = atob(arr[1]), 
				n = bstr.length, 
				u8arr = new Uint8Array(n);

			while (n--) {
				u8arr[n] = bstr.charCodeAt(n);
			}

			return new File([ u8arr ], filename, {
				type : mime
			});
		}
		
		function formImage(teachData, file){ //서버에 전송하기 위해 받아온 값을 formdata로 넘겨줌
			var formdata = new FormData();
		    formdata.append("file", file);
		    formdata.append("teachData", teachData);
		    
		    $.ajax({
		        type : 'post',
		        url : 'formImage',
		        data : formdata,
		        processData : false,	// data 파라미터 강제 string 변환 방지!!
		        contentType : false,	// application/x-www-form-urlencoded; 방지!!
		        success : function (data) {
		        	
		        }
		    	//...
		    });
		}

		async function loop() {
			webcam.update(); // update the webcam frame
			await predict();
			window.requestAnimationFrame(loop);
		}

		// run the webcam image through the image model
		async function predict() {
			// predict can take in an image, video or canvas html element
			const prediction = await model.predict(webcam.canvas);
			for (let i = 0; i < maxPredictions; i++) {
				const classPrediction = prediction[i].className + ": "
						+ prediction[i].probability.toFixed(2);
			}
		}
	</script>

</body>
</html>