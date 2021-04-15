<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
	<link rel="stylesheet" href="/resources/css/info.css" />
</head>
	<body class="is-preload">
		<!-- Header -->
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
		<!-- Main -->
		<div class="wrapper info_inner">
			
			<div class="content_wrapper">
			<h1>서비스 이용방법</h1>
				<div class="individual individual_wrapper_01">
				<h2>
					이미지 인식을 통한 제품 알아보기
				</h2>
				<ul class="head">
	              <li class="li_01"><span class="num">01</span>제품 찾기 선택<span class="arr"></span></li>
	              <li class="li_02"><span class="num">02</span>카메라 촬영<span class="arr"></span></li>
	              <li class="li_03"><span class="num">03</span>음성으로 결과 확인<span class="arr"></span></li>
	              <li class="li_04"><span class="num">04</span>상세내용 버튼 선택<span class="arr"></span></li>
	              <li class="li_05"><span class="num">05</span>상세내용 결과 확인</li>
	            </ul>
				</div>
				<div class="individual individual_wrapper_02">
				<h2>
					목소리 되어주기 기능 이용하기
				</h2>
				<ul class="head">
	              <li class="li_01"><span class="num">01</span>목소리 되어주기 선택<span class="arr"></span></li>
	              <li class="li_02"><span class="num">02</span>내용 기입<span class="arr"></span></li>
	              <li class="li_03"><span class="num">03</span>음성듣기 버튼 선택<span class="arr"></span></li>
	              <li class="li_04"><span class="num">04</span>AI음성 결과 확인</li>
	            </ul>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>

		<%@ include file="/WEB-INF/views/include/script.jsp" %>
	</body>
</html>