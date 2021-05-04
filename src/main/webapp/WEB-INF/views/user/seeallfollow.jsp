<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagrarn</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/seeallfollow.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<div class="follow_list">
			<span class="title">추천</span>
			<ul>
				<c:forEach var="listone" items="${followlist}">
					<li>
						<div class="list_box">
							<div>
								<span>${listone.id}</span>
								<span>${listone.fullname}</span>
							</div>
							<button class="follow_button">팔로우</button>
						</div>
						
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>