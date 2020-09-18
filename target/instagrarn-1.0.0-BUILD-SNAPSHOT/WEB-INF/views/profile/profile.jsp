<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/profile.css">
	
	<script type="text/javascript">

	</script>
</head>
<body>

<jsp:include page="../header.jsp"/>
<main class="page">
	<div class="main">
		<div class="base">
			<div class="profile_img_box">
				<div class="profile_img">
				<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo" width="150">
				</div>
			</div>
			<div class="profile_text_box">
				<div class="profile_first">
					<div class="user_id">
					u_zin19
					</div>
					<div class="profile_edit">
						<div class="profile_edit_box">
							<a class="profile_edit_text" href="/instagrarn/account/edit">프로필 편집</a>
						</div>
					</div>
					<div class="setting">
					<img src="${ pageContext.request.contextPath }/resources/images/setting.png" alt="setting_icon"
						style="width:33px; height:33px; padding-left:8px;">
					</div>
				</div>
				<div class="profile_middle">
					<div class="post">
						<span class="profile_middle_text">게시물<span class="post_num">12</span></span>
						
					</div>
					<div class="follower">
						<span class="profile_middle_text">팔로워<span class="follower_num">12</span></span>
					</div>
					<div class="following">
						<span class="profile_middle_text">팔로워<span class="following_num">12</span></span>						
					</div>
				</div>
				<div class="profile_last">
				YUJIN
				</div>
			</div>
		</div>
	
		<c:forEach var="list" items="${list}">
		<img src="resources/post/${list.img}" width="200"/>
		</c:forEach>
	</div>
</main>
</body>
</html>
