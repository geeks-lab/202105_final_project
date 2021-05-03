async function ocrText(){ //텍스트인식함수
	let now = new Date();
	let urlArr = document.getElementById('canvas').toDataURL().split(',');
	let url = urlArr[1];
	//console.log(urlArr[1]);
           
	let bodyObj = {
		"images": [
					{
						"format": "jpg",
						"name": "medium",
						"data": url
					}
                  ],
		"lang": "ko",
        "requestId": "string",
        "resultType": "string",
        "timestamp": now.getTime(),
        "version": "V1"      
	};
	
	let response = await fetch("/teach/ocr", {
		"method": "POST",
		"headers":{'Content-Type': 'application/json'},
		"body":  JSON.stringify(bodyObj)            
	}).then(response => response.json())
    	.then(data => {
			document.getElementById('teachContent').insertAdjacentHTML('beforeend', "<br>"); //티처블 결과와 줄바꿈 처리
            for (var i = 0; i < data["images"][0]["fields"].length; i++) { //결과 출력 insertAdjacentHTML활용하여 티처블 결과에 추가로 삽입
                document.getElementById('teachContent').insertAdjacentHTML('beforeend', data["images"][0]["fields"][i]["inferText"] + " ");
          	}
      	})
}
