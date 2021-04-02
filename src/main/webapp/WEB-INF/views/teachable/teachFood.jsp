<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
	<body class="is-preload">
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Header -->
			<%@ include file="/WEB-INF/views/include/header.jsp" %>
				
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<header>
						<h1>식음료 찾기</h1>
						<p>사진 찍으신 제품이 무엇인지 알려드립니다.</p>
					</header>
					<section class="tiles mytiles">
						<article class="style1">
							<span class="image"> <img src="resources/images/pic01.jpg"
								alt="" />
							</span> <a href="generic.html">
								<h2>1. 식음료 찾기</h2>
								<div class="content">
									<p>
										음료수, 과자, 라면 등의 식품을 인식시켜주세요. <br>어떤 제품인지 말해드리고, 원하신다면 <br>상품에
										있는 글자를 알려드릴 수도 있습니다.
									</p>
								</div>
							</a>
						</article>
						<article class="style2">
							<span class="image"> <img src="resources/images/pic02.jpg"
								alt="" />
							</span> <a href="generic.html">
								<h2>2. 생필품 찾기</h2>
								<div class="content">
									<p>
										칫솔, 생리용품 등의 생필품을 인식시켜주세요. <br>어떤 제품인지 말해드리고, 원하신다면 <br>상품에
										있는 글자를 알려드릴 수도 있습니다.
									</p>
								</div>
							</a>
						</article>
						<article class="style3">
							<span class="image"> <img src="resources/images/pic03.jpg"
								alt="" />
							</span> <a href="generic.html">
								<h2>3. 목소리 되어주기</h2>
								<div class="content">
									<p>원하는 말을 적어주세요. 대신 말해드립니다.</p>
								</div>
							</a>
						</article>
						<article class="style4">
							<span class="image"> <img src="resources/images/pic04.jpg"
								alt="" />
							</span> <a href="generic.html">
								<h2>4. 이용 안내</h2>
								<div class="content">
									<p>어떻게 이용해야 하는지 상세히 알려드립니다.</p>
								</div>
							</a>
						</article>
						<article class="style5">
							<span class="image"> <img src="resources/images/pic05.jpg"
								alt="" />
							</span> <a href="generic.html">
								<h2>5. 고객의 소리함</h2>
								<div class="content">
									<p>불편한 사항 및 개선이 필요한 부분이 있다면 귀기울여 듣겠습니다.</p>
								</div>
							</a>
						</article>
					</section>
				</div>
			</div>

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>

	</body>
</html>