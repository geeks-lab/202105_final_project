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
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width,initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="/resources/assets/css/main.css">
	<link rel="stylesheet" href="/resources/assets/css/noscript.css">
	<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/resources/css/join.css">
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<!-- section -->
		<section class="contentBox">
			<div class="titleBox">
				<h1>회원가입</h1>
				<hr>
			</div>
			<div class="formBox">
				<div class="form">
					<form:form modelAttribute="user" action="${context}/user/joinimpl" method="post" id="frm_join">
						<div class="formId formWrap">
							<label class="label">아이디 </label>
							<input class="input" type="text" name="userId" id="id" size="10" placeholder="아이디를 입력하세요." required/>
						</div>
						
						<div class="idCheck formWrap">
							<button type="button" onclick="idCheck()">중복확인</button>
						</div>

						<div class="formPw formWrap">
							<label class="label">비밀번호 </label>
							<input class="input" type="password" name="password" id="pw" placeholder="비밀번호를 입력하세요." required/>
						</div>
						
						<div class="formPwCheck formWrap">
							<label class="label">비밀번호 확인 </label>
							<input class="input" type="password" name="password" id="pw" placeholder="비밀번호를 입력하세요." required/>
						</div>
						
						<div class="formName formWrap">
							<label class="label">이름 </label>
							<input class="input" type="text" name="name" placeholder="이름을 입력하세요." required/>
						</div>
			
						<div class="submit">
							<button type="submit" class="primary">가입하기</button>
						</div>
					</form:form>
				</div>
			</div>
		</section>
   
   <!-- js -->
		<script type="text/javascript">
			let idCheckFlg = false;
			let idCheck = () => {
			 //사용자가 입력한 아이디
			 //요소의 아이디속성이 있을 경우 해당 엘리먼트를 가져다가 사용할 수 있다.
			 let userId = id.value;
			 if(userId){
			 
			  fetch("/member/idcheck?userId=" + userId,{
			   method:"get"
			  })
			  .then(response => response.text())
			  .then(text =>{
			   if(text == 'success'){
				   idCheckFlg = true;
				   id_check.innerHTML = '사용 가능한 아이디 입니다.';
			   }else{
				   idCheckFlg = false;
				   id_check.innerHTML = '사용 불가능한 아이디 입니다.';
				   id.value="";
			   }
			  })
			  
			 }else{
			  alert("아이디를 입력하지 않으셨습니다.");
			 }
			}
			
			document.querySelector('#frm_join').addEventListener('submit',(e)=>{
			 let password = pw.value;
			 let regExp = /^(?!.*[ㄱ-힣])(?=.*\W)(?=.*\d)(?=.*[a-zA-Z])(?=.{8,})/;
			 
			 if(!idCheckFlg){
			  e.preventDefault();
			  alert("아이디 중복검사를 하지 않으셨습니다.");
			  id.focus()
			 }
			 
			 if(!(regExp.test(password))){
			  //form의 데이터 전송을 막음
			  e.preventDefault();
			  pw_confirm.innerHTML = '비밀번호는 숫자,영문자,특수문자 조합의 8글자 이상인 문자열입니다.';
			  pw.value='';
			 }
			});
   
	   </script>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	
<%@ include file="/WEB-INF/views/include/script.jsp" %>
</body>
</html>