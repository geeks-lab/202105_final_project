<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>


<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<style type="text/css">

.box_demo {
    position: relative;
    resize: none;
    height: 284px;
    padding: 19px 29px;
    border: 1px solid #30cfb3;
    box-sizing: border-box;
    }
    
.box_demo .inp_tf {
    resize: none;
    height: 250px;
    border: 0 none;
    padding: 10px;
    box-sizing: border-box;
    font-size: 50px;
    line-height: 55px;
    color: #000;
    background: #f9f9f9;
    -ms-overflow-style: -ms-autohiding-scrollbar;
    resize: none;
    outline: none;
    letter-spacing: -0.025em;
  
}


</style>

	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="index.html" class="logo">
									<span class="symbol"><img src="resources/images/logo.svg" alt="" /></span><span class="title">눈, 보라</span>
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
						<h2>Menu</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="generic.html">TESTACCOUNT</a></li>
							<li><a href="generic.html">JIYOUNGTEST222</a></li>
							<li><a href="generic.html">JIHYEONTEST222</a></li>
							<li><a href="generic.html">SOHEETEST222</a></li>
							<li><a href="generic.html">EUNJITEST222</a></li>
							<li><a href="generic.html">SEUNGYEONTEST222</a></li>
							<li><a href="generic.html">ONYOUTEST222</a></li>
							<li><a href="generic.html">Consequat dolor</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
					
						<div class="inner">
						
							<header>
								<h1>목소리 되어주기</h1>
								<p>원하는 말을 적어주세요. 대신 말해드립니다.</p>
							</header>
							<!-- 내용 입력칸 -->
							<div class="box_demo">
                        		<textarea id="txtDemo" class="inp_tf" rows="4" placeholder="원하는 말을 적어주세요. 대신 말해드립니다."></textarea>
                    		</div>
							<br>
							
							<button type="button" class="button primary fit" style="font-size:25px; background-color: #30cfb3;">
                                <span id="playBtn">▶ 음성듣기</span>
                            </button>
                            <br><br>
                            <button  class ="button primary fit" onclick="clearText()" style="font-size:25px; background-color: #f2849e;">내용 지우기</button>



						</div>
					</div>
							
			

			</div>

			
			




	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	
	
			<!-- 텍스트박스 지우는 스크립트 -->	
			<script type="text/javascript">
			function clearText(){
			/* 텍스트박스 지우는 부분 */
			var el = document.getElementsByClassName('inp_tf');
			for(var i=0; i<el.length; i++){
				el[i].value = '';
			}
			}
			
			</script>
			


	</body>
</html>