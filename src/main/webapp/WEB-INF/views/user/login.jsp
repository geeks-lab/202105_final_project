<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<title>로그인</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<link rel="stylesheet" href="/resources/assets/css/noscript.css">
<link rel="stylesheet"
	href="/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- section -->
	<section class="contentBox" id="contentBox">
		<div class="titleBox">
			<h1>로그인</h1>
			<hr>
		</div>

		<div class="formBox">
			<div class="form">
				<div class="formId formWrap" id="formId">
					<label class="label" id="font">아이디 </label> <input class="input"
						type="text" name="userId" id="id" size="10"
						placeholder="아이디를 입력하세요." required />
				</div>

				<div class="formPw formWrap" id="formPw">
					<label class="label">비밀번호 </label> <input class="input"
						type="password" name="password" id="pw" placeholder="비밀번호를 입력하세요."
						required />
				</div>

				<div class="submit">
					<button onclick="login()">로그인</button>
				</div>
			</div>
		</div>
	</section>



	<script type="text/javascript">
		
			let login = () => {
				
				const url = '/user/loginimpl';
				let params = {};
				params.userId = id.value;
				params.userPwd = pw.value;
		
				//post방식으로 진행
				//헤더 설정
				let headerObj = new Headers();
				//form태그의 기본 content 타입인 application/x-www-form-urlencoded 로
				//content-type을 맞춰야 서버에서 편하게 getParameter로 사용 할 수 있다.
				//name=value&name=value
				headerObj.append("content-type","application/json");
				
				fetch(url,{
					method:"post",
					headers:headerObj,
					body:JSON.stringify(params)
				})
				.then(response => {
					//200번대 응답코드라면
					if(response.ok){
						return response.text();
					}else{
						throw new AsyncResponseError(response.text());
					}
				})
				.then(text => {
					if(text == 'fail'){
						document.querySelector('.valid_info').innerHTML = '아이디나 비밀번호를 확인하세요.';
					}else if(text == 'success'){
						location.href = "/index";
					}
				}).catch((error)=>{
					error.alertMessage();
				})
			}
	
	</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<%@ include file="/WEB-INF/views/include/script.jsp"%>

</body>
</html>