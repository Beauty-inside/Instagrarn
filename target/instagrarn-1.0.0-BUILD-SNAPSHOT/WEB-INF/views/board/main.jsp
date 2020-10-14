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
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/initscroll.js"></script>
<script type="text/javascript">

	var num = 1;
	var path = "${ pageContext.request.contextPath }/resources/images/ex_post_img";
	
	var page_count = 1;
	window.onscroll = function(ev) {
		if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight
				&& (window.innerHeight + window.scrollY) - 40 <= document.body.offsetHeight) {
			//여기서 Ajax로 컨트롤러로 들어가 데이터를 가져와 정보 넣어주기
			load_post_info(page_count);
			function load_post_info(page) {
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
					for (var i = 0; i < json.length; i++) {
						var board_idx = json[i].board_idx;
						var user_idx = json[i].user_idx;
						var img = json[i].img;
						var content = json[i].content;
						var area = json[i].area;
						var like_num = json[i].like_num;
						var one = document.createElement('li');
						var ones = addscroll(img, content, like_num);
						one.innerHTML = ones;
						lists.appendChild(one);
					}
				}
			}
		}
	};

	function like(board_idx){
		alert("여기");
		var btn_like = document.getElementById("btn_like_"+board_idx).src;
		var param = "board_idx=" + board_idx;
		if(btn_like.includes('_click')){
			var url = "clickUnLike";//-1
		} else{
			var url = "clickLike";//+1
		}
		alert(url);
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
</script>

</head>
<body>

	<jsp:include page="../header.jsp" />

	<main class="main">
		<div class="contain">
			<ul id="lists">
				<li class="one_post">
					<c:forEach var="loadlist" items="${loadlist}">
						<div class="article">
							<article class="article2">
								<header class="header_title">
									<div class="post_icon">
										<a href="#"> <img
											src="${ pageContext.request.contextPath }/resources/images/IconME.png"
											alt="myInfo">
										</a>
									</div>
									<div class="post_name">wooseong2</div>
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
											<a href="#"> <img
												src="${ pageContext.request.contextPath }/resources/images/post_button4.png"
												alt="bookmark">
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
											<span>wooseong2</span> ${loadlist.content}
										</div>
										<div class="post_content_more_button">
											<a href="#">더보기</a>
										</div>
									</div>
									<div class="post_comment">
										<div class="post_comment_more_button">
											<a href="#">댓글 n개 모두 보기</a>
										</div>
										<div class="post_comment_headers">
											<span>95wooseong</span> 첫번째 댓글이답!<br> <span>5you_bin</span>
											두번째 댓글인데욤..<br>
										</div>
										<div class="post_comment_date">1일 전</div>
									</div>
								</div>
								<div>
									<div class="post_comment_add">
										<input id="post_comment_add_loc" value="댓글 달기..."> <input
											id="post_comment_add_btn" type="button" value="게시">
									</div>
								</div>
							</article>
						</div>
					</c:forEach>
					<div class="sub_menu">
						<div class="user_info">
							<div class="user_info_profile_img">
								<a href="#"> <img
									src="${ pageContext.request.contextPath }/resources/images/IconME.png"
									alt="myInfo">
								</a>
							</div>
							<div class="user_info_name_id">
								<span class="user_info_id">95wooseong</span> <br>우성
							</div>
						</div>

						<div class="friend_story">
							<div class="friend_story_title">스토리</div>
							<div class="friend_story_contents">회원님이 팔로우하는 사람들의 스토리가 여기에
								표시됩니다.</div>
						</div>

						<div class="friend_recommend">
							<div>
								<div>
									회원님을 위한 추천 <a href="#">모두 보기</a>
								</div>
							</div>

							<div>
								<div>
									아이디<br> 회원님을 팔로우 합니다
								</div>
								<a href="#">팔로우</a>
							</div>

							<div>
								<div>
									아이디<br> 회원님을 팔로우 합니다
								</div>
								<a href="#">팔로우</a>
							</div>

							<div>
								<div>
									아이디<br> 회원님을 팔로우 합니다
								</div>
								<a href="#">팔로우</a>
							</div>

						</div>

						<div class="etc">홈페이지 소개, 도움말, API, 개인정보처리방침, 약관, 위치, 해시태그,
							언어</div>

						<div class="end">저작권그거</div>

					</div>
				</li>
			</ul>

		</div>
	</main>
</body>
</html>