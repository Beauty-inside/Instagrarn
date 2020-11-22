<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagrarn</title>
<link rel="icon" type="image/png" href="${ pageContext.request.contextPath }/resources/images/favi.png" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/initscroll.js?ver=1"></script>

<script type="text/javascript">

	var num = 1;
	var path = "${ pageContext.request.contextPath }/resources/images/ex_post_img";
	var page_count = 1;

	window.onscroll = function(ev) {
		if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight
				&& (window.innerHeight + window.scrollY) - 40 <= document.body.offsetHeight) {
			//여기서 Ajax로 컨트롤러로 들어가 데이터를 가져와 정보 넣어주기
			load_post_info(page_count);
		}
	};
	//포스터로드
	function load_post_info(page) {
		console.log("여기");
		var url = "loadpost";
		var param = "page=" + page;
		sendRequest(url, param, resultFn, "GET");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var lists = document.getElementById("lists");
			var data = xhr.responseText;
			var json = eval(data);
			page_count++;
			console.log("여기2");
			for (var i = 0; i < json.length; i++) {
				var board_idx = json[i].board_idx;
				var user_idx = json[i].user_idx;
				var img = json[i].img;
				var content = json[i].content;
				var area = json[i].area;
				var like_num = json[i].like_num;
				console.log(data);
				var replylist = json[i].replys;
				var data = {'img':img, 'content':content, 'like_num':like_num, 'board_idx':board_idx, 'replylist':replylist};
				console.log(data.replylist[0]);
				var one = document.createElement('li');
				var ones = addscroll(data);
				one.innerHTML = ones;
				lists.appendChild(one);
			}
		}
	}
	
	//댓글 달기 Ajax
	function add_reply(board_idx){
		var reply_content = document.getElementById("post_comment_add_loc").value;
		var url = "add_reply"
		var param = "board_idx="+board_idx+"&reply="+reply_content;
		sendRequest(url, param, resultClickAddreply, "GET");
	}
	function resultClickAddreply(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var replyUl = document.getElementById("post_comment_headers_"+data);
			var oneReply = document.createElement('li');
			var user_id = document.getElementById("user_id").value;
			var record_content = document.getElementById("post_comment_add_loc").value;
			
			oneReply.innerHTML = "<b>"+user_id+"</b> "+record_content;
			replyUl.appendChild(oneReply);
		}
	}

	//좋아요 버튼 Ajax
	function like(board_idx){
		var btn_like = document.getElementById("btn_like_"+board_idx).src;
		var param = "board_idx=" + board_idx;
		if(btn_like.includes('_click')){
			var url = "clickUnLike";//-1
		} else{
			var url = "clickLike";//+1
		}
		sendRequest(url, param, resultClickLike, "GET");
	}
	function resultClickLike(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var btn_like = document.getElementById("btn_like_"+data).src;
			var likeView = document.getElementById("likeView");
			var num = likeView.innerHTML.replace("좋아요 ","").replace("개","");
			if(btn_like.includes('_click')){
				addLikeNumber = Number(num)-1;
				document.getElementById("btn_like_"+data).src = "${ pageContext.request.contextPath }/resources/images/post_button1.png";
			}else{
				addLikeNumber = Number(num)+1;
				document.getElementById("btn_like_"+data).src = "${ pageContext.request.contextPath }/resources/images/post_button1_click.png";
			}
			likeView.innerHTML = "좋아요 "+addLikeNumber+"개";
		}
	}
	
	function nextImg() {
		num++;
		if (num > 4) {
			num = 1;
		}
		var res = document.getElementById("imgloc");
		res.src = path + num + ".jpg";
	}

	function prevImg() {
		num--;
		if (num < 1) {
			num = 4;
		}
		document.getElementById("imgloc").src = path + num + ".jpg";
	}
	
	//---------------------------------------------
	function click_follow(follow_id){
		var url = "follow";
		var param = "follow_id=" + follow_id;
		sendRequest(url, param, resultFollow, "GET");
	}
	
	function resultFollow(){
		if(xhr.readyState == 4 && xhr.status == 200){
			/* 팔로우 버튼 클릭 시 화면 어떻게 할지 새로고침 또는 팔로우 한 사람 지우기 구현 */
		}
	}
	
	function click_follow_send(follow_id){
		var f = document.f;
		f.follow_idx.value = ""+follow_id;
		f.submit();
	}
	//---------------------------------------------
</script>

</head>
<body>

	<jsp:include page="../header.jsp" />


	<input id="user_id" type="hidden" value="${user_info_id}">
	<main class="main">
		<div class="contain">
			<ul id="lists">
				<li class="one_post">
					<c:forEach var="loadlist" items="${loadlist}"><%-- <c:forEach var="userlist" items="${userlist}"> --%>
						<div class="article">
							<article class="article2">
								<header class="header_title">
									<div class="post_icon">
										<a href="/instagrarn/profile?user_idx=${loadlist.user_idx }"> <img
											src="${ pageContext.request.contextPath }/resources/images/IconME.png"
											alt="myInfo">
										</a>
									</div>
									<div class="post_name">${loadlist.id }</div>
									<div class="post_sub_action">...</div>
								</header>
								<div class="post_img">
									<a href="#" onClick="prevImg();"> <img class="left_btn"
										src="${ pageContext.request.contextPath }/resources/images/p_img_left_btn.png"
										alt="이전">
									</a> 
									<img
										src="resources/post/${loadlist.img}"
										id="imgloc" alt="이미지" width="618" height="616">
									<a href="#" onClick="nextImg();"> <img class="right_btn"
										src="${ pageContext.request.contextPath }/resources/images/p_img_right_btn.png"
										alt="다음">
									</a>
								</div>
								<div>
									<section class="post_buttons">
	
										<div class="post_buttons_left">
										<c:if test="${loadlist.isLike eq true}">
											<img id="btn_like_${loadlist.board_idx}" src="${ pageContext.request.contextPath }/resources/images/post_button1_click.png" alt="like" onclick="like(${loadlist.board_idx});">
										</c:if>
										<c:if test="${loadlist.isLike eq false}">
											<img id="btn_like_${loadlist.board_idx}" src="${ pageContext.request.contextPath }/resources/images/post_button1.png" alt="like" onclick="like(${loadlist.board_idx});">
										</c:if>
											<img src="${ pageContext.request.contextPath }/resources/images/post_button2.png" alt="comment">
											<img src="${ pageContext.request.contextPath }/resources/images/post_button3.png" alt="arrow">
										</div>
	
										<div class="post_button_right">
											<a href="#">
												<img src="${ pageContext.request.contextPath }/resources/images/post_button4.png" alt="bookmark">
											</a>
										</div>
	
									</section>
									<section class="post_like">
										<a href="#" id="likeView">좋아요 ${loadlist.like_num}개</a>
									</section>
								</div>
								<div>
									<div class="post_content">
										<div class="post_content_header">
											<span>${userlist.id }</span> ${loadlist.content}
										</div>
										<!-- <div class="post_content_more_button">
											<a href="#">더보기</a>
										</div> -->
									</div>
									<div class="post_comment">
										<!-- <div class="post_comment_more_button">
											<a href="#">댓글 n개 모두 보기</a>
										</div> -->
										<ul id="post_comment_headers_${loadlist.board_idx}">
											<c:forEach var="replylist" items="${loadlist.replys}">
												<li><b>${replylist[0]}</b> ${replylist[1]}</li>
											</c:forEach>
										</ul>
										<div class="post_comment_date">1일 전</div>
									</div>
								</div>
								<div>
									<div class="post_comment_add">
										<input id="post_comment_add_loc" placeholder="댓글 달기...">
										<input id="post_comment_add_btn" type="button" value="게시" onclick="add_reply(${loadlist.board_idx});">
									</div>
								</div>
							</article>
						</div>
					</c:forEach><%-- </c:forEach> --%>
					<div class="sub_menu">
						<div class="user_info">
							<div class="user_info_profile_img">
								<a href="#"> <img
									src="${ pageContext.request.contextPath }/resources/images/IconME.png"
									alt="myInfo">
								</a>
							</div>
							<div class="user_info_name_id">
								<span class="user_info_id">${user_info_id}</span> <br>${user_info_fullname}
							</div>
						</div>

						<div class="friend_story">
							<div class="friend_story_title">스토리</div>
							<div class="friend_story_contents">회원님이 팔로우하는 사람들의 스토리가 여기에
								표시됩니다.</div>
						</div>
						
						<form action="follow" method="post" name="f">
							<input type="hidden" name="follow_idx" id="follow_idx" value="">
						</form>
						
						<ul class="friend_recommend">
							<div class="friend_recommend_title">
								회원님을 위한 추천 <a class="more_view_recommend" href="/instagrarn/seeallfollow">모두 보기</a>
							</div>
							
							<c:forEach var="ones" items="${recommendlist}">
								<li>
									<span class="recommend_id">${ones.id}</span><br> 회원님을 팔로우 합니다<!-- /instagrarn/follow?follow_id=${ones.idx} -->
									<a class="recommend_follow" href="javascript:void(0);" onclick="click_follow_send(${ones.idx});">팔로우</a>
								</li>
							</c:forEach>
						</ul>

						<div class="etc">홈페이지 소개, 도움말, API, 개인정보처리방침, 약관, 위치, 해시태그,
							언어</div>

						<div class="end">© 2020 INSTAGRAM FROM FACEBOOK</div>

					</div>
				</li>
			</ul>

		</div>
	</main>
</body>
</html>