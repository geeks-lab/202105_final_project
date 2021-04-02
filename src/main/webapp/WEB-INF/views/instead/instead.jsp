<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<style type="text/css">
	
	.box_demo {
	    position: relative;
	    resize: none;
	    height: 270px;
	    padding: 19px 29px;
	    border: 1px solid #30cfb3;
	    box-sizing: border-box;
	    }
	    
	 
	.box_demo .inp_tf {
	    width: 97%;
	    height: 210px;
	    border: 0 none;
	    padding-right: 30px;
	    box-sizing: border-box;
	    font-size: 25px;
	    line-height: 34px;
	    color: #000;
	    /* background: #f9f9f9; */
		/*  -ms-overflow-style: -ms-autohiding-scrollbar; */
	    resize: none;
	    outline: none;
	    letter-spacing: -0.025em;
	}
	
	
	label {
	    float: left;
	    width: 10%;
	    font-size : 1em;
	    /* line-height: 1.5; */
	}
	
	.inp_tf, select, form > div {
	    display: block;
	    margin: 0 auto;
	    font-family: sans-serif;
	    font-size: 16px;
	    padding: 5px;
	}
	
	#rate, #pitch {
	  float: right;
	  width: 81%;
	}
	input[type="range" i] {
	    appearance: auto;
	    color: -internal-light-dark(rgb(16, 16, 16), rgb(255, 255, 255));
	    cursor: default;
	    padding: initial;
	    border: initial;
	    margin: 2px;
	}
	option {
	    font-weight: normal;
	    display: block;
	    white-space: nowrap;
	    min-height: 1.2em;
	    padding: 0px 2px 1px;
	}
	
	</style>
</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<%@ include file="/WEB-INF/views/include/header.jsp" %>
					
				<!-- Main -->
					<div id="main">
					
						<div class="inner">
						
							<header>
								<h1>목소리 되어주기</h1>
								<p>원하는 말을 적어주세요. 대신 말해드립니다.</p>
							</header>
							<!-- 내용 입력칸 -->
							<form>
							<div class="box_demo">
                        		 <textarea id="inp_tfDemo" class="inp_tf" rows="4" placeholder="원하는 말을 적어주세요. 대신 말해드립니다."></textarea>
                        	</div>
							<br>
							
								<!-- 속도, 피치 -->
							    <div>
							      <label for="rate">속도</label><input type="range" min="0.5" max="2" value="1" step="0.1" id="rate">
							      <div class="rate-value" >1</div>
							      <div class="clearfix"></div>
							    </div>
							    <br>
							    <div>
							      <label for="pitch">피치</label><input type="range" min="0" max="2" value="1" step="0.1" id="pitch">
							      <div class="pitch-value">1</div>
							      <div class="clearfix"></div>
							    </div>
							    <br>
							    <!-- 한국어 지원 -->
							    <select><option data-lang="ko-KR" data-name="Microsoft Heami - Korean (Korean)" >마이크로소프트 Heami - 한국어 (한국어) (ko-KR) - 디폴트</option></select>
							   	<br><br>
							   	<!-- 음성듣기 / 내용지우기 버튼 -->
							    <div class="controls">
							      <button class="button primary fit" id="play" type="submit" style="font-size:25px; background-color: #30cfb3;">▶ 음성듣기</button>
							    </div>
							    <br>
							   <button  class ="button primary fit" onclick="clearText()" style="font-size:25px; background-color: #f2849e;">내용 지우기</button>
							 	
							   </form> 
							    <script src="script.js"></script>
							    <!-- ---- -->
							 
                           
						</div>
					</div>
					
			<!-- footer -->				
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>

			</div>
		

	
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	
	<!-- 음성합성 --><!-- 크롬 쓰바르브라ㅡㅏ발바ㅡㄹ -->
	<script type="text/javascript">
	//변수설정
	var synth = window.speechSynthesis;

	var inputForm = document.querySelector('form'); //전체 form
	var inputinp_tf = document.querySelector('.inp_tf'); //텍스트박스
	var voiceSelect = document.querySelector('select'); //한국어
	
	var pitch = document.querySelector('#pitch'); //피치
	var pitchValue = document.querySelector('.pitch-value');
	var rate = document.querySelector('#rate'); //속도
	var rateValue = document.querySelector('.rate-value');
	
	var voices = [];
	
	//선택 요소 채우기
	function populateVoiceList() {
	  voices = synth.getVoices();
	
	  for(i = 0; i < voices.length ; i++) {
	    var option = document.createElement('option');
	    option.textContent = voices[i].name + ' (' + voices[i].lang + ')';
	
	    if(voices[i].default) {
	      option.textContent += ' -- DEFAULT';
	    }
	
	    option.setAttribute('data-lang', voices[i].lang);
	    option.setAttribute('data-name', voices[i].name);
	    voiceSelect.appendChild(option);
	  }
	}
	
	//입력된 텍스트 말하기
	inputForm.onsubmit = function(event) {
	  event.preventDefault();
	
	  var utterThis = new SpeechSynthesisUtterance(inputinp_tf.value);
	  var selectedOption = voiceSelect.selectedOptions[0].getAttribute('data-name');
	  for(i = 0; i < voices.length ; i++) {
	    if(voices[i].name === selectedOption) {
	      utterThis.voice = voices[i];
	    }
	  }
	  utterThis.pitch = pitch.value;
	  utterThis.rate = rate.value;
	  synth.speak(utterThis);
			
	//
	utterThis.onpause = function(event) {
    var char = event.utterance.text.charAt(event.charIndex);
    console.log('Speech paused at character ' + event.charIndex + ' of "' +
    event.utterance.text + '", which is "' + char + '".');
  }
	
	//파이어폭스 OS에 키보드를 숨기기 위한 것
	  inputinp_tf.blur();
	}

	//표시된 피치 및 속도 값 업데이트
	pitch.onchange = function() {
	  pitchValue.textContent = pitch.value;
	}
	
	rate.onchange = function() {
	  rateValue.textContent = rate.value;
	}
	</script>
	

	
	<!-- 텍스트박스 지우는 스크립트 -->	
	<script type="text/javascript">
	function clearText(){
	/* 텍스트박스 지우는 부분 */
	var el = document.getElementsByClassName('inp_tf');
	for(var i=0; i<el.length; i++){
		el[i].value = '';
		}
		}
	</script>
			


	</body>
</html>