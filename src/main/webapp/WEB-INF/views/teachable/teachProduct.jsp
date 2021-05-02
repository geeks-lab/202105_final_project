<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<style type="text/css">
#myImage {
	width: 100%;
	height: 100%
	
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
					<h1>생필품 찾기</h1>
					<p>사진 찍으신 제품이 무엇인지 알려드립니다.</p>
				</header>

				<section class="tiles mytiles">
					<article class="style2">
						<div id="webcam-container"></div>
					</article>
					<article class="style2">
						<span class="image"> <img id="myImage" src="/resources/images/pic02.jpg" alt="" />
						</span> 
							<a onclick="pause('생필품') && ocrText()">
								<div class="content">
									<img style="width: 20%; opacity: 70%;" src="/resources/images/camera.png" alt="" />
									<h2>&nbsp;사진 찍기</h2>
								</div>
							</a>
					</article>
				</section>
				<p style="text-align: center; margin-top: 2em">* 재촬영을 원하시면 이미지를 눌러주세요.</p>
				<hr>
				<h2>제품명</h2>
				<div>
					<blockquote>
						<div id="label-container"></div>
					</blockquote>
				</div>
				<a class="button primary fit" onclick="voiceSynth()" style="background-color: #f2849e">소리듣기</a>
			</div>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	
	<script type="text/javascript" src='../../../resources/js/teachable.js'></script>
	<script type="text/javascript">
		init('생필품');
	</script>
	
	<script type="text/javascript" src='../../../resources/js/ocr.js'></script>
	
</body>
</html>