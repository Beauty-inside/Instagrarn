<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Instagrarn</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/profile.css">
	
	<script type="text/javascript">
	function post(){
		alert("ㅋㅋ");
		e.preventDefault();

		$('#file').click();

		return;
	}
	
	</script>
</head>
<body>

<jsp:include page="../header.jsp"/>

<main class="page">
	<div class="main">
		<div class="post_img">
			<div class="post_img_text">
				<input type="file" name="file" id="file" style="display:none"/>
				<img src="${ pageContext.request.contextPath }/resources/images/plus.png" style="width:60px;height:60px;margin-bottom:28px" alt="Home"
				onclick="onclick=document.all.file.click()">
				<div class="text1">사진 파일을 끌어다 놓으세요</div>
				<div class="text2">동영상은 길이가 1~60분 사이의 가로 또는 세로 방향이어야 하며, 3.6GB 미만의 MP4 파일만 지원됩니다.</div>
			</div>
		</div>
		
		<div class="post_text">
		신규 사진 추가<br>
		
		
		상세정보<br>
		
		<textarea placeholder="문구입력.." rows="5" cols="40"></textarea><br>
		위치추가<br>
		<input placeholder="위치" style="width:300px;height:40px;"><br>
		<input type="button" value="게시">
		<input type="button" value="임시저장">
		</div>
	</div>
</main>
</body>
</html>
