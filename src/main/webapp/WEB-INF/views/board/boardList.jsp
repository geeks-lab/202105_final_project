<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/head.jsp" %>

<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<style type="text/css">
		.content {
			display: flex;
			justify-content: center;
		}
		
		.paging {
			width: 60%;
			display: flex;
			text-align: center;
			justify-content: space-around;
		}
		
		.paging a{
			font-size: 1em;
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

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>고객의 소리함</h1>
								<p>접수된 고객 건의 사항 목록입니다.</p>
							</header>
						    <div class="table-wrapper">
						    	<a href="${context}/board/form" class="button primary fit" style="background-color: #9370DB">건의 글 작성</a>
						    	<br><br>
								<table style="text-align: center">
									<thead>
							           <tr>
							               <th style="width: 10%; text-align: center">글번호</th>
							               <th style="width: 50%; text-align: center">제목</th>
							               <th style="width: 20%; text-align: center">작성자</th>
							               <th style="width: 20%; text-align: center">등록일</th>
							           </tr>
									</thead>
									<tbody>
										<c:forEach items="${boardList}" var="board">
											<tr>
												<td>${board.sugIdx}</td>
												<td><a href="${context}/board/detail?sugIdx=${board.sugIdx}">${board.sugTitle}</a></td>
												<td>${board.userId}</td>
												<td>${board.sugRegDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- section pagination -->
							<div class="content">
								<div class="paging">
									<a href="${context}/${paging.type}/list" class="nav first"><b>《</b></a>
									<a href="${context}/${paging.type}/list?page=${paging.prev}"><b>〈</b></a>
							       
									<c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
										<a href="${context}/${paging.type}/list?page=${page}"><span><b>${page}</b></span></a>
									</c:forEach> 
							        
									<a href="${context}/${paging.type}/list?page=${paging.next}"><b>〉</b></a>
									<a href="${context}/${paging.type}/list?page=${paging.lastPage}"><b>》</b></a>
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