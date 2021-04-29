<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 음성인식 버튼 -->
<div class="words" style="position: fixed; bottom: 10px; right: 10px;">
    <img src="/resources/images/micro.png" onclick="voiceRecog()">
</div>

<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<section class="footersection">
				<h2>Follow</h2>
				<ul class="icons">
					<li><a href="#" class="icon brands style2 fa-instagram">&nbsp;&nbsp;<span>Instagram</span></a></li>
					<li><a href="#" class="icon brands style2 fa-github">&nbsp;&nbsp;<span>GitHub</span></a></li>
					<li><a href="#" class="icon solid style2 fa-phone">&nbsp;&nbsp;<span>Phone</span></a></li>
					<li><a href="#" class="icon solid style2 fa-envelope">&nbsp;&nbsp;<span>Email</span></a></li>
				</ul>
			</section>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>
	
	<script type="text/javascript" src='../../../resources/js/voiceRecog.js'></script>
</body>
</html>