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
	textarea{
	    border: solid 1px #c9c9c9;
	    min-height: 20em;
	}
	
	textarea:focus{
		border-color: #f2849e;
	}
	</style>
</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->
					<header id="header">
						<div class="inner">
							<!-- Logo -->
								<a href="/index" class="logo">
									<span class="symbol"><img src="/resources/images/eyesLogo.png" alt="" /></span><span class="title">눈, 보라</span>
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
								<h1>고객의 소리함</h1>
								<p>건의하실 사항을 작성해주세요.</p>
							</header>
							<div class="content">
								<div class="desc_board">
									<form action="${context}/board/upload" method="post" enctype="multipart/form-data">
										<div>
											<div class="tit_board">
												<b>제목</b> <input type="text" name="sugTitle" required="required"/>
												<br>
												<b>파일</b><br>
												<input class="button icon solid fa-upload" type="file" name="files" id="contract_file" multiple/>
											</div>
											<br>
											<div class="content_board">
												<textarea name="sugContent" required="required"></textarea>
											</div>
											<br>			
											<div class="btn_section">
												<button class="button primary fit" style="background-color:#9370DB; width:100%">전송</button>
											</div>
											<br>
											<div class="btn_section">
												<button type="button" class="button primary fit" style="background-color:gray; width:100%" onclick="location.href='/board/list'">취소</button>
											</div>
										</div>
									</form>
									
								</div>
							</div>
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