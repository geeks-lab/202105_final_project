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
               <article class="style7">
                  <span class="image"> <img id="myImage" src="/resources/images/pic01.jpg" alt="" />
                  </span> 
                     <a onclick="pause()">
                        <div class="content_teachable">
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
            <a class="button primary fit" onclick="voiceSynth()" style="background-color: #f2849e">상세 정보 듣기</a>
         </div>
      </div>

      <!-- Footer -->
      <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   </div>

   <%@ include file="/WEB-INF/views/include/script.jsp"%>

   <script type="text/javascript">
      const teachURL = "https://teachablemachine.withgoogle.com/models/hiFJDaDW4/";

      let model, webcam, labelContainer, maxPredictions;

      async function init() {
         const modelURL = teachURL + "model.json";
         const metadataURL = teachURL + "metadata.json";

         model = await tmImage.load(modelURL, metadataURL);
         maxPredictions = model.getTotalClasses();

         const flip = false;
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
               document.getElementById('label-container').innerHTML = 
                  '<div id="teachContent">이 제품은 ' + food + '입니다.</div>';
            }
         }

         var myImage = document.getElementById('myImage');
         myImage.src = document.getElementById('canvas').toDataURL(); //멈춘 canvas를 이미지teachURL로 변환
         
         var file = dataURLtoFile(document.getElementById('canvas').toDataURL());
         
         var teachData = new Array(category, food); //티처블 테이블에 저장될 속성을 배열로 전송
         
         formImage(teachData, file); //formImage함수에 변수로 넘겨줌
         
         voiceSynth();
         ocrTest();
      }
      
      async function voiceSynth(){ //음성합성 실행 함수
         let audioTag = document.createElement('audio');
         
         const KAKAO_API_KEY = "KakaoAK d381c5185416bd1f0e1808d306540f57";
         let teachURL = 'https://kakaoi-newtone-openapi.kakao.com/v1/synthesize';
         
         let header = new Headers();
         header.append("Authorization",KAKAO_API_KEY);
         header.append("Content-Type", "application/xml");
         
         var data = document.getElementById('teachContent').innerText;
         
         await fetch(teachURL, {
               "method" : "post", 
               "headers" : header, 
               "body" : '<speak>' + data +' </speak>'
            })
         .then(response => response.body)
         .then(body => {
            const reader = body.getReader();
            
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
         .then(response => response.blob())
         .then(blob => URL.createObjectURL(blob))
         .then(URL => audioTag.src = URL)
         .then(audioTag.play())   
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
      
      function formImage(teachData, file){ //서버에 전송하기 위해 받아온 값을 formdata로 넘겨줌
         var formdata = new FormData();
          formdata.append("file", file);
          formdata.append("teachData", teachData);
          
          $.ajax({
              type : 'post',
              url : 'formImage',
              data : formdata,
              processData : false,   // data 파라미터 강제 string 변환 방지!!
              contentType : false,   // application/x-www-form-teachURLencoded; 방지!!
              success : function (data) {
                 
              }
             //...
          });
      }
   
      async function ocrTest(){ //텍스트인식함수
         let ocrTag = document.createElement('ocr');
         ocrTag.className = 'ocrTag';
         
         let invokeURL = 'https://0065417594944195ac1452a41b197f7b.apigw.ntruss.com/custom/v1/8430/12a8a28869fc3dfac419936519c63abadcf50e925d078c50ea3a3369d356198a/general';
         
         let now = new Date();
           let url = document.getElementById('canvas').toDataURL().split(',');
           let url2 = url[1];
           console.log(url[1]);
           
         let bodyObj = {
                "images": [
                    {
                      "format": "jpg",
                      "name": "medium",
                      "data": url2
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
            document.getElementById('teachContent').insertAdjacentHTML('beforeend', "<br>");
               for (var i = 0; i < data["images"][0]["fields"].length; i++) {
                   document.getElementById('teachContent').insertAdjacentHTML('beforeend', data["images"][0]["fields"][i]["inferText"] + " ");
               }
         })
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