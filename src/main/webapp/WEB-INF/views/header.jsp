<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
	
	<script type="text/javascript">
	function alert_new(){
		switch (document.getElementById("nav_alert_news").style.display) {
		case "block":
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home2.png"
			document.getElementById("heart_icon").src="${ pageContext.request.contextPath }/resources/images/IconHeart.png"
			document.getElementById("nav_alert_news").style.display="none";
			break;
		case "none": 
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home.png"
			document.getElementById("heart_icon").src="${ pageContext.request.contextPath }/resources/images/IconHeart2.png"
			document.getElementById("nav_alert_news").style.display="block";
			break;
		}
	}
	
	function profile(){
		var profile = document.getElementById("profile");
		switch(profile.style.display){
		case "none" : 
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home.png";
			profile.style.display = "block";
			break;
		case "block" :
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home2.png";
			profile.style.display = "none";
			break;
		}
	}
	</script>
</head>
<body>
<div class="all" style="top:0; right:0; left:0;">
	<nav class="nav">
		<div class="nav_div">
		<div class="nav_title_div">
			<div class="nav_title">
				<a href="main">
					<img src="${ pageContext.request.contextPath }/resources/images/logo3.png" alt="Home">
				</a>
			</div>
		</div>
		<div class="nav_search_div">	
			<input class="nav_search" type="search" value="검색">
		</div>
		<div class="nav_menu_div">
			<div class="nav_menu">
				<a href="home.jsp">
					<img src="${ pageContext.request.contextPath }/resources/images/Home2.png" alt="Home"  id="home_icon">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconDM.png" alt="Message">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconNa.png" alt="na">
				</a>
				<img id="heart_icon" src="${ pageContext.request.contextPath }/resources/images/IconHeart.png" alt="heart" onclick="alert_new();">
				<a href="#" onclick="profile(this.form);">
					<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo">
				</a>
			</div>
		</div>
		</div>
	</nav>
	<div id="nav_alert_news" class="nav_alert_news" style="display:none;">
			하이
	</div>
	<div class="profile" id="profile" style="display:none;">
		<div class="user_profile">
		<a href="/instagrarn/profile" style="color:black;">프로필</a>
		</div>
	</div>
	
</div>

</body>
</html>
