<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Instagrarn</title>
	
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
	window.onload=function(){
		var user_idx = document.getElementById("user_idx").value;
		load_alert(user_idx);
	}
	
	function alert_new(){
		switch (document.getElementById("nav_alert_news").style.display) {
		case "block":
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home2.png"
			document.getElementById("heart_icon").src="${ pageContext.request.contextPath }/resources/images/IconHeart.png"
			document.getElementById("nav_alert_news").style.display="none";
			break;
		case "none": case "":
			document.getElementById("home_icon").src="${ pageContext.request.contextPath }/resources/images/Home.png"
			document.getElementById("heart_icon").src="${ pageContext.request.contextPath }/resources/images/IconHeart2.png"
			document.getElementById("nav_alert_news").style.display="block";
			break;
		}
	}
	
	function load_alert(user_idx){
		sendRequest("loadalert", "user_idx="+user_idx, resultLoadAlert, "GET");
	}
	function resultLoadAlert(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			var nav_alert_ul = document.getElementById("nav_alert_ul");
			var data = xhr.responseText;
			var json = eval(data);

			for (var i = 0; i < json.length; i++) {
				var from_use_id = json[i][0];
				var type_alert = json[i][1];
				var one = document.createElement('li');
				one.id = 'alert_view_'+i;
				if(type_alert=="like"){
					one.innerHTML = '<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="profile"><b>'+from_use_id+'</b><br>님이 회원님의 게시물에 좋아요를 눌렀습니다.';
				} else {
					one.innerHTML = '<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="profile"><b>'+from_use_id+'</b><br>님이 회원님의 게시물에 댓글을 남겼습니다.';
				}
				nav_alert_ul.appendChild(one);
			}
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
	<input id="user_idx" type="hidden" value="${user_info_idx}">
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
			<input class="nav_search" type="search" placeholder="검색">
		</div>
		<div class="nav_menu_div">
			<div class="nav_menu">
				<a href="main">
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
	<div id="nav_alert_news" class="nav_alert_news">
		<ul id="nav_alert_ul">
		</ul>
	</div>
	<div class="profile" id="profile" style="display:none;">
		<div class="user_profile">
		<a href="/instagrarn/profile?user_idx=${user_info_idx}" style="color:black;">프로필</a>
		</div>
		<hr>
		<div class="/instagrarn/logout">
		<a href="/instagrarn/" style="color:black;">로그아웃</a>
		</div>
	</div>
	
</div>

</body>
</html>
