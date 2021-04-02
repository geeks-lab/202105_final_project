<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

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
						<span class="image"> <img src="/resources/images/pic02.jpg" alt="" />
						</span> <a href="generic.html">
							<div class="content">
								<img style="width: 20%; opacity: 70%;" src="/resources/images/camera.png" alt="" />
								<h2>&nbsp;다시 찍기</h2>
							</div>
						</a>
					</article>
				</section>
				<p style="text-align: center; margin-top: 2em">* 재촬영을 원하시면 이미지를 눌러주세요.</p>
				<hr>
				<h2>제품명</h2>
				<div>
					<blockquote>Fringilla nisl. Donec accumsan interdum
						nisi, quis tincidunt felis sagittis eget tempus euismod.
						Vestibulum ante ipsum primis in faucibus vestibulum. Blandit
						adipiscing eu felis iaculis volutpat ac adipiscing accumsan
						faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum
						dolor sit amet nullam adipiscing eu felis.
					</blockquote>
				</div>
				<a href="#" class="button primary fit" style="background-color: #f2849e">소리듣기</a>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	
</body>
</html>