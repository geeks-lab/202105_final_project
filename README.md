
#  눈, 보라

## 1. 프로젝트 기술 스택

#### Languages : Java 1.8, HTML5, CSS3, Java Script, Servlet
#### Framework, Tools : Spring, JQuary, MyBatis, Bootstrap, Tomcat8.5
#### ERD : 
<img width="410" alt="image" src="https://user-images.githubusercontent.com/78070249/220853551-91d91e9c-74cc-4c6a-be79-e2c0fae3bc7b.png"><br/>
#### DBMS : Oracle SqlDeveloper

## 2. 프로젝트 설명 
#### 이 애플리케이션은 어떤 서비스를 제공하나?
눈이 불편한 유저를 위해 머신러닝, 문자인식, 음성인식 API를 사용하여 상품의 정보를 제공하는 기능과 말하기가 불편한 유저를 대신해 텍스트를 음성으로 바꿔 대신 말해주는 기능을 제공하는 서비스입니다.<br/>
메인페이지<br/>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/78070249/220861598-71c9fa96-41de-4a25-8ddc-3e4caa42fc2f.png"><br/>
상품 정보 제공 페이지<br/>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/78070249/220861679-eb3eb70b-9d87-44d5-a3d7-767c2f364673.png"><br/>
목소리 되어주기 페이지<br/>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/78070249/220861722-7da45a82-efeb-44e7-bd54-2b502731de24.png"><br/>

#### 어떤 기술을 사용했고, 왜 그것을 선택했나?
이미지 인식 기능을 빠르게 구현하기 위해 Google이 제공하는 Teachable machine API를 선택하였고 모델을 학습시켰습니다. 그러나 모든 제품을 학습시킬 수는 없었기에 Naver의 문자 인식 API인 CLOVA OCR을 붙여 부족한 기능을 보완하였습니다. 이렇게 인식된 텍스트 데이터를 음성으로 읽어주는 기능은 MDN에서 제공하는 Web Speech API를 선택하여 간단하게 구현하였습니다.

## 3. 당면했던 문제점들과 오류, 그리고 해결 방법

* 문제점 :  눈이 불편한 사람들이 아이러니하게 눈으로 메뉴의 글씨를 읽고 버튼을 눌러야 메뉴 이동이 가능한 불편함. 
	* 해결 방법 : 이를 극복하기 위하여 유저가 메인페이지에서 이동하고 싶은 메뉴를 말하면 음성을 인식하여 해당 페이지로 갈 수 있게 하여 문제를 해결했습니다. 해당 기술은 Web Speech API의 SpeechRecognitionResult 인터페이스를 사용하여 구현하였습니다.

* 문제점 : canvas에 있는 이미지  dataURL을 넘기면 나는 오류
	* 해결방법 :  data:[<mediatype>][;base64],<data> 이러한 방식으로 넘어오는 URL을 배열 형식으로 받고 URL을 split() 메서드를 이용해 ‘,’를 구분자로 사용하여 ‘,’앞의 필요없는 데이터를 걸러냄으로써 해결하였습니다.

## 4. 자료
#### ppt 발표 자료 https://docs.google.com/presentation/d/1a_FgOR7O_6Ea_AUTiRlTuYNTHdUAnzBjqcPWMNSnAD8/edit#slide=id.gd6e537fd70_2_227
