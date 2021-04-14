<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
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
		<h2>메뉴</h2>
		<ul>
			<li><a href="/index">메인 페이지</a></li>
			<c:choose>
				<c:when test="${not empty sessionScope.userInfo.userId}">
					<li><a href="/user/mypage">마이페이지</a></li>	
					<li><a href="/user/logout">로그아웃</a></li>	
				</c:when>
				<c:otherwise>
			   		<li><a href="/user/login">로그인</a></li>
					<li><a href="/user/join">회원가입</a></li>
				</c:otherwise>
	        </c:choose>
			<li><a href="/teach/food">식음료 찾기</a></li>
			<li><a href="/teach/product">생필품 찾기</a></li>
			<li><a href="/instead">목소리 되어주기</a></li>
			<li><a href="/info">이용안내</a></li>
			<li><a href="/board/list">고객의 소리함</a></li>
		</ul>
	</nav>

</body>
</html>