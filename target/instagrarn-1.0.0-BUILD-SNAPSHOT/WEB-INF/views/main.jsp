<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagrarn</title>

	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
	
	<script type="text/javascript">
		var num = 1;
		var path = "${ pageContext.request.contextPath }/resources/images/ex_post_img";
		
		function nextImg() {
			num++;
			if( num > 4 ) {
				num = 1;
			}
			var res = document.getElementById("imgloc");
			res.src = path + num + ".jpg";
		}
		
		function prevImg() {
			num--;
			if( num < 1) {
				num = 4;
			}
			document.getElementById("imgloc").src = path + num + ".jpg";
		}
	</script>

</head>
<body>
	<nav class="nav">
			<div class="nav_title">
				<a href="home.jsp">
					<img src="${ pageContext.request.contextPath }/resources/images/title.png" alt="Home">
				</a>
			</div>
			
			<input class="nav_search"type="search" value="검색">
			
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
	</nav>
	
	
	<main class="main">
		<div class="contain">
			<div class="article">
				<article class="article2">
					<header class="header_title">
						<div class="post_icon">
							<a href="#">
								<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo">
							</a>
						</div>
						<div class="post_name">wooseong2</div>
						<div class="post_sub_action">...</div>
					</header>
					<div class="post_img">
						<a href="#" onClick="prevImg();">
							<img class="left_btn" src="${ pageContext.request.contextPath }/resources/images/p_img_left_btn.png" alt="이전">
						</a>
					
						<img src="${ pageContext.request.contextPath }/resources/images/ex_post_img1.jpg" id="imgloc" alt="이미지"
							width="618" height="616">
							
						<a href="#" onClick="nextImg();">
							<img class="right_btn" src="${ pageContext.request.contextPath }/resources/images/p_img_right_btn.png" alt="다음">
						</a>
					</div>
					<div>
						<section class="post_buttons">
						
							<div class="post_buttons_left">
								<a href="#">
									<img src="${ pageContext.request.contextPath }/resources/images/post_button1.png" alt="like">
								</a>
								<a href="#">
									<img src="${ pageContext.request.contextPath }/resources/images/post_button2.png" alt="comment">
								</a>
								<a href="#">
									<img src="${ pageContext.request.contextPath }/resources/images/post_button3.png" alt="arrow">
								</a>
							</div>
							
							<div class="post_button_right">
								<a href="#">
									<img src="${ pageContext.request.contextPath }/resources/images/post_button4.png" alt="bookmark">
								</a>							
							</div>
							
						</section>
						<section class="post_like"><a href="#">좋아요 n개</a></section>
					</div>
					<div>
						<div class="post_content">
							<div class="post_content_header">
								<span>wooseong2</span> 게시글 내용
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
								<span>95wooseong</span> 첫번째 댓글이답!<br>
								<span>5you_bin</span> 두번째 댓글인데욤..<br>
							</div>
							<div class="post_comment_date">
								1일 전
							</div>
						</div>
					</div>
					<div>
						<div class="post_comment_add">
							<input id="post_comment_add_loc" value="댓글 달기...">
							<input id="post_comment_add_btn" type="button" value="게시">
						</div>
					</div>
				</article>
			</div>
			
			<div class="sub_menu">
				<div class="user_info">
					<div class="user_info_profile_img">
						<a href="#">
							<img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="myInfo">
						</a>
					</div>
					<div class="user_info_name_id">
						<span class="user_info_id">95wooseong</span>
						<br>우성					
					</div>
				</div>
				
				<div class="friend_story">
					<div class="friend_story_title">
						스토리
					</div>
					<div class="friend_story_contents">
						회원님이 팔로우하는 사람들의 스토리가 여기에 표시됩니다.
					</div>
				</div>
				
				<div class="friend_recommend">
					<div>
						<div>
							회원님을 위한 추천
							<a href="#" >모두 보기</a>
						</div>
					</div>
					
					<div>
						<div>
							아이디<br>
							회원님을 팔로우 합니다
						</div>
						<a href="#" >팔로우</a>
					</div>
					
					<div>
						<div>
							아이디<br>
							회원님을 팔로우 합니다
						</div>
						<a href="#" >팔로우</a>
					</div>
					
					<div>
						<div>
							아이디<br>
							회원님을 팔로우 합니다
						</div>
						<a href="#" >팔로우</a>
					</div>
					
				</div>
				
				<div class="etc">
					홈페이지 소개, 도움말, API, 개인정보처리방침, 약관, 위치, 해시태그, 언어
				</div>
				
				<div class="end">
					저작권그거
				</div>
				
			</div>
		</div>
	</main>
</body>
</html>