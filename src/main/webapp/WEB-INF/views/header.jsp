<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css">
</head>
<body>
	<nav class="nav">
		<div class="nav_div">
		<div class="nav_title_div">
			<div class="nav_title">
				<a href="main">
					<img src="${ pageContext.request.contextPath }/resources/images/title.png" alt="Home">
				</a>
			</div>
		</div>
		<div class="nav_search_div">	
			<input class="nav_search" type="search" value="검색">
		</div>
		<div class="nav_menu_div">
			<div class="nav_menu">
				<a href="home.jsp">
					<img src="${ pageContext.request.contextPath }/resources/images/IconHome.png" alt="Home">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconDM.png" alt="Message">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconNa.png" alt="na">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconHeart.png" alt="heart">
				</a>
				<a href="#">
					<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo">
				</a>
			</div>
		</div>
		</div>
	</nav>
	
</body>
</html>
