<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
	<style type="text/css">
	textarea{
	    border: solid 1px #c9c9c9;
	    min-height: 20em;
	}
	
	textarea:focus{
		border-color: #f2849e;
		box-shadow: inset 0 0 0 0 #f2849e;
	}
	</style>
</head>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>고객의 소리함</h1>
					<p>건의하실 사항을 작성해주세요.</p>
				</header>
				<div class="content">
					<div class="desc_board">
						<form action="${context}/board/upload" method="post"
							enctype="multipart/form-data">
							<div>
								<div class="tit_board">
									<b>제목</b> 
									<input type="text" name="sugTitle" required="required" /> <br> 
									<b>파일</b><br>
									<input class="button icon solid fa-upload" type="file" name="files" id="contract_file" multiple />
								</div>
								<br>
								<div class="content_board">
									<textarea name="sugContent" required="required"></textarea>
								</div>
								<br>
								<div class="btn_section">
									<button class="button primary fit" style="background-color: #9370DB; width: 100%">전송</button>
								</div>
								<br>
								<div class="btn_section">
									<button type="button" class="button primary fit" style="background-color: gray; width: 100%"
										onclick="location.href='/board/list'">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp"%>

</body>
</html>