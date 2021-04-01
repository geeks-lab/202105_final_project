<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/noscript.css">
<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/css/login.css">
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
	<section class="content">
		<div class="titleBox">
			<h1>로그인</h1>
			<hr>
		</div>
		
		<div class="formBox">
			<div class="form valid_info">
				<form method="post">
					<div class="formId">
						<label class="label">아이디</label>
						<input type="text" name="userId" id="id"/>
					</div>
					
					<div class="formPw">
						<label class="label">비밀번호</label>
						<input type="password" name="password" id="pw"/>
					</div>
					
					<div class="submit">	
						<button type="submit" class="primary" onclick="login()">로그인</button>
					</div>
				</form>
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
	
	let login = () => {
		
		const url = '/member/loginimpl';
		let params = {};
		params.userId = id.value;
		params.password = pw.value;

		//post방식으로 진행
		//헤더 설정
		let headerObj = new Headers();
		//form태그의 기본 content 타입인 application/x-www-form-urlencoded 로
		//content-type을 맞춰야 서버에서 편하게 getParameter로 사용 할 수 있다.
		//name=value&name=value
		headerObj.append("content-type","application/json");
		
		fetch(url,{
			method:"post",
			headers:headerObj,
			body:JSON.stringify(params)
		})
		.then(response => {
			//200번대 응답코드라면
			if(response.ok){
				return response.text();
			}else{
				throw new AsyncResponseError(response.text());
			}
		})
		.then(text => {
			if(text == 'fail'){
				document.querySelector('.valid_info').innerHTML = '아이디나 비밀번호를 확인하세요.';
			}else if(text == 'success'){
				location.href = "/index";
			}
		}).catch((error)=>{
			error.alertMessage();
		})
	}
	
	
	
	</script>

   <%@ include file="/WEB-INF/views/include/script.jsp" %>

   </body>
</html>