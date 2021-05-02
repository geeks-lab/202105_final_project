let teachURL;
let model, webcam, labelContainer, maxPredictions;

async function init(category) { //티처블 실행 함수 view단에서 category값 받아옴
	if(category == '식음료'){
		teachURL = "https://teachablemachine.withgoogle.com/models/hiFJDaDW4/";
	}else{
		teachURL = "https://teachablemachine.withgoogle.com/models/UbU0mqXrt/";
	}
	
	const modelURL = teachURL + "model.json";
	const metadataURL = teachURL + "metadata.json";

	model = await tmImage.load(modelURL, metadataURL);
	maxPredictions = model.getTotalClasses();

	const flip = false; //ocr에서도 실행하기 위해 좌우대칭 false로 변경
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

//init(); view단에서 실행

async function pause(category) { //이미지 클릭 시 사진 찍히는 함수
	const prediction = await model.predict(webcam.canvas);
	var predictionValue = new Array();
	var food;
	var product;

	for (let i = 0; i < maxPredictions; i++) {
		predictionValue[i] = prediction[i].probability.toFixed(2);
	}

	const maxValue = Math.max.apply(null, predictionValue);
	
	if(category == '식음료'){ //넘어온 category가 식음료일 경우
		for (let i = 0; i < maxPredictions; i++) { //클래스에 따라 결과값 반환
			if (prediction[i].probability.toFixed(2) == maxValue) {
				switch (prediction[i].className) {
				case "food_cocopalm":
					food = "해태 코코팜";
					break;
				case "food_welchs":
					food = "농심 웰치스";
					break;
				case "food_choco":
					food = "오리온 초코송이";
					break;
				case "food_chip":
					food = "오리온 포카칩";
					break;
				}
				document.getElementById('label-container').innerHTML = '<div id="teachContent">이 제품은 ' + food + '입니다.</div>';
			}
		}
	} else { //category가 생필품인 경우
		for (let i = 0; i < maxPredictions; i++) { //클래스에 따라 결과값 반환
			if (prediction[i].probability.toFixed(2) == maxValue) {
				switch (prediction[i].className) {
				case "product_patch":
					product = "홈키파 살충제";
					break;
				case "product_pads":
					product = "좋은느낌 생리대";
					break;
				case "product_toothpaste":
					product = "센소다임 칫솔";
					break;
				}
				document.getElementById('label-container').innerHTML = '<div id="teachContent">이 제품은 ' + product + '입니다.</div>';
			}
		}
	}

	var myImage = document.getElementById('myImage');
	myImage.src = document.getElementById('canvas').toDataURL(); //멈춘 canvas를 이미지teachURL로 변환

	var file = dataURLtoFile(document.getElementById('canvas').toDataURL());
			
	var teachData = new Array(category, food); //티처블 테이블에 저장될 속성을 배열로 전송
			
	formImage(teachData, file); //formImage함수에 변수로 넘겨줌
			
	voiceSynth();//음성합성 실행
}
		
async function voiceSynth(){ //음성합성 실행 함수
	let audioTag = document.createElement('audio');
			
	const KAKAO_API_KEY = "KakaoAK 90a704d11afe1462a34e54e1e115ba7a";
	let teachURL = 'https://kakaoi-newtone-openapi.kakao.com/v1/synthesize';
			
	let header = new Headers();
	header.append("Authorization",KAKAO_API_KEY);
	header.append("Content-Type", "application/xml");
			
	var data = document.getElementById('teachContent').innerText; //innerHTML대신 innerText변경
			
	await fetch(teachURL, { //request
			"method" : "post", 
			"headers" : header, 
			"body" : '<speak><prosody rate="slow">' + data +' </prosody></speak>'
	})
	.then(response => response.body) //response
	.then(body => {				
		const reader = body.getReader();
		//console.log(reader);
				
		return new ReadableStream({
			start(controller) {
				return pump();
			      	
				function pump() {
					return reader.read().then(({ done, value }) => {
					// When no more data needs to be consumed, close the stream
					if (done) {
						controller.close();
					    return;
					}
		
					// Enqueue the next data chunk into our target stream
					controller.enqueue(value);
					return pump();
				    });
				}
			}
		})			  	
	})
	.then(stream => new Response(stream))
	.then(response => response.blob()) //response blob처리	
	.then(blob => URL.createObjectURL(blob))
	.then(URL => audioTag.src = URL)
	.then(audioTag.play()) //오디오 태그 이용하여 받아온 음성 재생
}
		
function dataURLtoFile(dataURL, filename) { //teachURL을 디코딩해서 file 객체로 만듦
	var arr = dataURL.split(','), 
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
		
function formImage(teachData, file){ //이미지 파일을 저장하기 위한 함수
	var formdata = new FormData(); //서버에 전송하기 위해 받아온 값을 formdata로 넘겨주기 위해 저장
	formdata.append("file", file);
	formdata.append("teachData", teachData);
		    
	$.ajax({ //데이터 전송
		type : 'post',
		url : 'formImage',
		data : formdata,
		processData : false,	// data 파라미터 강제 string 변환 방지!!
		contentType : false,	// application/x-www-form-teachURLencoded; 방지!!
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
		const classPrediction = prediction[i].className + ": " + prediction[i].probability.toFixed(2);
	}
}
