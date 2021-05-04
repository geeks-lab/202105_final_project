async function voiceRecog() {
	window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
	
	// 인스턴스 생성
	const recognition = new SpeechRecognition();
	
	// true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
	recognition.interimResults = false;
	// 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
	recognition.lang = "ko-KR";
	// true means continuous, and false means not continuous (single result each time.)
	// true면 음성 인식이 안 끝나고 계속 됩니다.
	recognition.continuous = false;
	// 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.
	// maxAlternatives가 크면 이상한 단어도 문장에 적합하게 알아서 수정합니다.
	recognition.maxAlternatives = 10000;
	
	let speechToText = "";
	let transcript;
		   
	recognition.addEventListener("result", (e) => {
		let interimTranscript = "";
			for (let i = e.resultIndex, len = e.results.length; i < len; i++) {
				transcript = e.results[i][0].transcript;
				//console.log(transcript);
				if (e.results[i].isFinal) {
					speechToText += transcript;
				} else {
					interimTranscript += transcript;
				}
			}
		     
			if(transcript =='1번' || transcript =='식음료' || transcript =='시금료' ||transcript =='식음료 찾기'){
				location.href="/teach/food";
			} else if(transcript =='2번' || transcript =='생필품' || transcript =='생필품 찾기'){
				location.href="/teach/product";
			} else if(transcript =='3번' || transcript =='문서' || transcript =='문서 읽어주기'){
				location.href="/ocr/document";
			} else if(transcript =='4번' || transcript =='목소리' || transcript =='목소리 되어주기'){
				location.href="/instead";
			} else if(transcript =='5번' || transcript =='이용안내'){
				location.href="/info";
			} else if(transcript =='6번' || transcript =='소리함' || transcript =='고객의 소리함'){
				location.href="/board/list";
			} else if(transcript == '로그인'){
				location.href="/user/login";
			} else if(transcript == '회원가입'){
				location.href="/user/join";
			}
		     
	});
		 
	// 음성인식이 끝나면 자동으로 재시작합니다.
	// recognition.addEventListener("end", recognition.start);
	
	// 음성 인식 시작
	recognition.start();
}
