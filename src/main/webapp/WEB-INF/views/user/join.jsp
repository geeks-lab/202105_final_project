<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
	<title>회원가입</title>
	<meta name="viewport" content="width=device-width,initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="/resources/assets/css/main.css">
	<link rel="stylesheet" href="/resources/assets/css/noscript.css">
	<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/resources/css/join.css">
</head>

<!DOCTYPE HTML>
<html>
	<!-- Header -->
	<header id="header">
		<div class="inner">

			<!-- Logo -->
				<a href="index.html" class="logo">
					<span class="symbol"><img src="/resources/images/logo.svg" alt="" /></span><span class="title">눈, 보라</span>
				</a>

			<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>

		</div>
	</header>

	<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="generic.html">TESTACCOUNT</a></li>
				<li><a href="generic.html">JIYOUNGTEST222</a></li>
				<li><a href="generic.html">JIHYEONTEST222</a></li>
				<li><a href="generic.html">SOHEETEST222</a></li>
				<li><a href="generic.html">EUNJITEST222</a></li>
				<li><a href="generic.html">SEUNGYEONTEST222</a></li>
				<li><a href="generic.html">ONYOUTEST222</a></li>
				<li><a href="generic.html">Consequat dolor</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
		</nav>
	
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
		
		<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>
   
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

   <%@ include file="/WEB-INF/views/include/script.jsp" %>

   </body>
</html>