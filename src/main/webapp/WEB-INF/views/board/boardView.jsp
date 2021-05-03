<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/head.jsp" %>

<head>
	<link rel="stylesheet" href="/resources/css/board.css" />
	<style type="text/css">
		.list{
			display: flex;
			justify-content: space-between;
		}
		
		tr>td>span{
			font-weight: bold;
			text-align: center;
		}
		
		pre{
          overflow: auto;
          white-space: pre-wrap;
          font-family: 'Font Awesome 5 Free';
      	}
	</style>
</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<%@ include file="/WEB-INF/views/include/header.jsp" %>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>고객의 소리함</h1>
								<p>작성자&nbsp;&nbsp;<b>${board.userId}님</b> 의 건의 내역입니다.</p>
							</header>
							<div class="table-wrapper">
								<table>
									<tbody>
										<tr>
											<td class="list">
												<span>번호<br>${board.sugIdx}</span>
												<span>제목<br>${board.sugTitle}</span>
												<span>등록일<br>${board.sugRegDate}</span>
												<span>작성자<br>${board.userId}</span>
											</td>
										</tr>
										<tr style="height: 40vh">
											<td>
												<pre>${board.sugContent}</pre>
											</td>
										</tr>
										<tr>
											<td>
												<ol>
										      	<c:forEach var="file" items="${files}">
										      		<li	onclick="downloadFile('${file.fOriginName}','${file.fReName}','${file.fSavePath}')">  
										      	 		<a>${file.fOriginName}</a> 
										      	 	</li>	     
										      	</c:forEach>
										      	</ol>
									      	</td>
										</tr>
									</tbody>
								</table>
							</div>
							<span>
									<button class="button primary fit" style="background-color: #9370DB" onclick="submitData('list')"><span>목록</span></button>
									<br><br>
									<button class="button primary fit" onclick="deleteBoard('${board.sugIdx}')"><span>삭제</span></button>
							</span>
						</div>
						<script type="text/javascript">
						   function submitData(url){
						      location.href = url;
						   } 
						   
						   function downloadFile(ofname,rfname,savePath){
							  let params = {'fOriginName':ofname,
									  		'fReName':rfname,
									  		'fSavePath':savePath};
							  
						      location.href = '${context}' + "/board/download?" + urlEncodedForm(params);
						   }
							
						   function deleteBoard(sugIdx){
							   location.href = '${context}' + "/board/delete?sugIdx=" + sugIdx;
						   }
						</script>
					</div>
					
					<!-- Footer -->
					<%@ include file="/WEB-INF/views/include/footer.jsp" %>
					
				</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>

</body>
</html>