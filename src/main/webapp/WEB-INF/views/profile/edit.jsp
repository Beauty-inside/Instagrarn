<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page session="false" %>

<html>
<head>
	<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/edit.css">
	
	<script type="text/javascript">
		function edit(i){

			for(var j = 1; j < 10; j++ ){
				var edit = "edit";
				var sub = "edit";
				if(j!=i){
					edit += j;
					sub +=j+"_sub";			
					document.getElementById(edit).style='border-left: 2px solid transparent; font-weight: 400';
					document.getElementById(sub).style.display="none";
				}else{
					edit += j;
					sub +=j+"_sub";
					document.getElementById(edit).style='border-left-color: #262626; border-left-color: rgba(var(--f75,38,38,38),1); font-weight: 600';
					document.getElementById(sub).style.display="block";
				}
			}
		}
	
	</script>
</head>
<body>

<jsp:include page="../header.jsp"/>

<main class="page">
	<div class="main">
		<ul>
			<li><a href='javascript:void(0);' onclick="edit('1');" class="account_edit" id="edit1">프로필 편집</a></li>
			<li><a href='javascript:void(0);' onclick="edit('2');" class="account_edit" id="edit2">비밀번호 변경</a></li>
			<li><a href='javascript:void(0);' onclick="edit('3');" class="account_edit" id="edit3">앱 및 웹사이트</a></li>
			<li><a href='javascript:void(0);' onclick="edit('4');" class="account_edit" id="edit4">이메일 및 SMS</a></li>
			<li><a href='javascript:void(0);' onclick="edit('5');" class="account_edit" id="edit5">푸시 알림</a></li>
			<li><a href='javascript:void(0);' onclick="edit('6');" class="account_edit" id="edit6">연락처 관리</a></li>
			<li><a href='javascript:void(0);' onclick="edit('7');" class="account_edit" id="edit7">공개 범위 및 보안</a></li>
			<li><a href='javascript:void(0);' onclick="edit('8');" class="account_edit" id="edit8">로그인 활동</a></li>
			<li><a href='javascript:void(0);' onclick="edit('9');" class="account_edit" id="edit9">Instagrarn에서 보낸 이메일</a></li>
		</ul>
		<article class="sub -main-" id="edit1_sub">
			<div class="group1">
				<div class="group1_img"><img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo" width="38"></div>
				<div class="group1_text_box">
				<div class="group1_text1">u_zin19</div>
				<button class="group1_text2">프로필 사진 바꾸기</button>
				</div>
			</div>
		</article><article class="sub" id="edit2_sub"></article>
		</article><article class="sub" id="edit3_sub"></article>
		</article><article class="sub" id="edit4_sub"></article>
		</article><article class="sub" id="edit5_sub"></article>
		</article><article class="sub" id="edit6_sub"></article>
		</article><article class="sub" id="edit7_sub"></article>
		</article><article class="sub" id="edit8_sub"></article>
		</article><article class="sub" id="edit9_sub"></article>
	</div>
	
</main>

</body>
</html>
