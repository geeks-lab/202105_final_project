<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/assets/css/noscript.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
	.mypage{
		font-size: 80px;
		font-family: fantasy !important;
		text-align: center;
		margin-bottom: 5%;
		background-color: #69ffb4;
		color: #FFFFFF;
		
	}
	
	.fas fa-users{
		margin: 10%;
	}
	
	.welcome{
		font-size: 50px;
		text-align: center;
		font-family: 'KoPub Batang', serif;
		margin-bottom: 10%;
		background-color: yellow;
		color: indigo;

	}
	
	.id{
		font-size: 60px;
		margin-left: 10%;
		margin-right: 10%;
		margin-bottom: 10%;
		font-family: 'KoPub Batang', serif;
		background-color: #FF2400;
		color: #007FFF;
	}
	
	.id:hover{
		transform:scale(1.5,1.5);
	}
	
	.pw{
		font-size: 60px;
		margin-left: 10%;
		margin-right: 10%;
		margin-bottom: 10%;
		font-family: 'KoPub Batang', serif;
		background-color: #7FFF00;
		color: #7F00FF;
	}
	
	.pw:hover{
		transform:scale(1.5,1.5);
	}
	
	.name{
		font-size: 60px;
		margin-left: 10%;
		margin-right: 10%;
		margin-bottom: 10%;
		font-family: 'KoPub Batang', serif;
		background-color: #F59700;
		color: #000080;
	}
	
	.name:hover{
		transform:scale(1.5,1.5);
	}
	
	.claim{
		margin-left: 33%;
		width: 50%;
	}
	
</style>

<html>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="index.html" class="logo">
									<span class="symbol"><img src="/resources/images/logo.svg" alt="" /></span><span class="title">Phantom</span>
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

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<div class="mypage"><a href="localhost:9090/user/mypage"> Mypage</a></div>
								<div class="welcome"> ${sessionScope.userInfo.name} 님, 환영합니다.</div>
							</header>
										
								<div class="id">아이디 : ${sessionScope.userInfo.userId}</div>
								
								<div class="pw">비밀번호 : ${sessionScope.userInfo.password}</div>
								
								<div class="name">이름 : ${sessionScope.userInfo.name}</div>
			
		
								<a href="generic.html">
									<div class="claim"><h1>고객소리함 작성하기</h1></div>
								</a>
						
						</div>
					</div>

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
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>

	</body>
</html>