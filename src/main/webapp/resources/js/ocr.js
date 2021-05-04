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
	
	ocrResponse(bodyObj);
	
}
