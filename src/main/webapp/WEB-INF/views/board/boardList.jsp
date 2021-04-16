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
				<%@include file="/WEB-INF/views/include/header.jsp" %>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>고객의 소리함</h1>
								<p>접수된 고객 건의 사항 목록입니다.</p>
							</header>
						    <div class="table-wrapper">
						    	<c:if test="${sessionScope.userInfo.userId ne 'admin' && !empty sessionScope.userInfo.userId}">
						    		<a href="${context}/board/form" class="button primary fit" style="background-color: #9370DB">건의 글 작성</a>
						    	</c:if>
						    	<c:if test="${empty sessionScope.userInfo.userId}">
						    		<div style="text-align: right"><small>* 건의 사항을 작성하려면 로그인 해주세요.</small></div>
						    	</c:if>
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
												<td><a href="${context}/board/detail?sugIdx=${board.sugIdx}&userId=${board.userId}">${board.sugTitle}</a></td>
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
				<%@include file="/WEB-INF/views/include/footer.jsp" %>
			</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>

	</body>
</html>