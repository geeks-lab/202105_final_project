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

#camera {
	text-align: center;
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
					<h1>문서 읽어주기</h1>
					<p>문서, 텍스트 등을 인식시켜주세요. 문서 내용을 읽어드립니다.</p>
				</header>
				<div id="camera">
					<video id="video" style="width: 80%; height: 100%"></video>
					<canvas id="canvas" style="display: none"></canvas>
					<a class="button primary fit" onclick="snap()" style="background-color: #80adf6; width: 80%">
						<span>문서 촬영</span>
					</a>
				</div>
				<p style="text-align: center; margin-top: 2em">* 재촬영을 원하시면 버튼을 눌러주세요.</p>
				<hr>
				<h2>문서내용</h2>
				<div>
					<blockquote style="min-height: 20vh">
						<div id="label-container"></div>
					</blockquote>
				</div>
				<a class="button primary fit" onclick="speech()" style="background-color: #80adf6">소리듣기</a> 
				<a class="button primary fit" onclick="stop()" style="background-color: #CD5C5C">중지하기</a>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp"%>

	<script type="text/javascript">
		var video=document.getElementById('video');
		var canvas=document.getElementById('canvas');
		var context=canvas.getContext('2d');
  
		navigator.getUserMedia=navigator.getUserMedia||navigator.webkitGetUserMedia||navigator.mozGetUserMedia||
		navigator.oGetUserMedia||navigator.msGetUserMedia;
		
		if(navigator.getUserMedia){
			navigator.getUserMedia({video:true},streamWebCam,throwError);
		}
		
		function streamWebCam(stream){
			video.srcObject=stream;
			video.play();
		}
		
		function throwError(e){
			alert(e.name);
		}
		
		function snap(){
			canvas.width=video.clientWidth;
			canvas.height=video.clientHeight;
			context.drawImage(video,0,0);
			ocrText();
	    }
		
		async function ocrResponse(bodyObj){
			let response = await fetch("/ocr/response", {
				"method": "POST",
				"headers":{'Content-Type': 'application/json'},
				"body":  JSON.stringify(bodyObj)            
			}).then(response => response.json())
	  	 	.then(data => {
	   			document.getElementById('label-container').innerHTML = '<div id="teachContent"></div>';
	    	    for (var i = 0; i < data["images"][0]["fields"].length; i++) {
	     	       document.getElementById('teachContent').insertAdjacentHTML('beforeend', data["images"][0]["fields"][i]["inferText"] + " ");
	     	   }
			})
		}
	</script>
	<script type="text/javascript" src='../../../resources/js/teachable.js'></script>
	<script type="text/javascript" src='../../../resources/js/ocr.js'></script>
	<script type="text/javascript" src='../../../resources/js/speechSynthesis.js'></script>

</body>
</html>