<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/assets/css/noscript.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/mypage.css" />


</head>


<html>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->
				<%@include file="/WEB-INF/views/include/header.jsp" %>
				
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h3>불편한 당신의 눈을 대신해드립니다</h3>
							</header>
						
								<div style="font-size: 30px; font-family: Source Sans Pro, Helvetica, sans-serif; text-align: left;">${sessionScope.userInfo.userName} 님, 환영합니다!</div>
								<hr>
								<br>
								<br>
						        <div class="jumbotron">
						        	<h3>아이디 : ${sessionScope.userInfo.userId}</h3><br>
						        	<h3>이름 : ${sessionScope.userInfo.userName}</h3><br><br>
						        </div>
							<button class="button primary fit" onclick="location.href='/board/list'" style="background-color:#9370DB; width:100%">고객의 소리함 바로가기</button>
						</div>
					</div>
				<!-- Footer -->
					<%@include file="/WEB-INF/views/include/footer.jsp" %>
			</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>

	</body>
</html>
