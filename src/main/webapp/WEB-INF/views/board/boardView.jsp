<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="${context}/resources/css/board.css" />
<body>
<div class="content">   
    <h2 class="tit">*게시판</h2>
    <div class="desc_board">
      <div class="info" >
          <span>번호 : ${board.sugIdx}</span>
          <span>제목 : ${board.sugTitle}</span>
          <span>등록일 : ${board.sugRegDate}</span>
          <span>작성자 : ${board.userId}</span>
      </div>
      <div class="info file_info">
      	<ol>
      	<c:forEach var="file" items="${files}">
      		<li	onclick="downloadFile('${file.fOriginName}','${file.fReName}','${file.fSavePath}')">  
      	 		<a>${file.originFileName}</a> 
      	 	</li>	     
      	</c:forEach>
      	</ol>
      </div>
      <div class="article_content">
      	<pre>${board.sugContent}</pre>
      </div>
      <div class="btn_section">
          <button onclick="submitData('list')"><span>목록</span></button>
          <button><span>삭제</span></button>
          <button><span>수정</span></button>
      </div>
   </div>
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

</script>










</body>
</html>