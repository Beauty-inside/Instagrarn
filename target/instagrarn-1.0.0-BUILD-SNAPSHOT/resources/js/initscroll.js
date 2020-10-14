function addscroll(img, content, like_num){
	console.log('src="resources/post/'+img +'"');
	var addones = '<div class="article">'+
		'<article class="article2">'+
			'<header class="header_title">'+
				'<div class="post_icon">'+
					'<a href="#"> <img src="resources/images/IconME.png" alt="myInfo"></a>'+
				'</div>'+
				'<div class="post_name">wooseong2</div>'+
				'<div class="post_sub_action">...</div>'+
			'</header>'+
			'<div class="post_img">'+
				'<a href="#" onClick="prevImg();"><img class="left_btn" src="resources/images/p_img_left_btn.png" alt="이전">'+
				//'</a><img src="resources/images/dd.PNG" id="imgloc" alt="이미지" width="618" height="616"><a href="#" onClick="nextImg();"><img class="right_btn" src="resources/images/p_img_right_btn.png" alt="다음">'+
				'</a><img src="resources/post/'+img +'" id="imgloc" alt="이미지" width="618" height="616"><a href="#" onClick="nextImg();"><img class="right_btn" src="resources/images/p_img_right_btn.png" alt="다음">'+
				'</a>'+
			'</div>'+
			'<div>'+
				'<section class="post_buttons">'+

					'<div class="post_buttons_left">'+
						'<img id="btn_like" src="${ pageContext.request.contextPath }/resources/images/post_button1.png" alt="like" onclick="like(${loadlist.board_idx});">'+
						'<a href="#"><img src="resources/images/post_button2.png" alt="comment"></a>'+
						'<a href="#"><img src="resources/images/post_button3.png" alt="arrow"></a>'+
					'</div>'+

					'<div class="post_button_right">'+
						'<a href="#"> <img src="resources/images/post_button4.png" alt="bookmark"></a>'+
					'</div>'+

				'</section>'+
				'<section class="post_like"><a href="#">좋아요 '+like_num+'개</a></section>'+
			'</div>'+
			'<div>'+
				'<div class="post_content">'+
					'<div class="post_content_header">'+
						'<span>wooseong2</span> '+content+
					'</div>'+
					'<div class="post_content_more_button">'+
						'<a href="#">더보기</a>'+
					'</div>'+
				'</div>'+
				'<div class="post_comment">'+
					'<div class="post_comment_more_button">'+
						'<a href="#">댓글 n개 모두 보기</a>'+
					'</div>'+
					'<div class="post_comment_headers">'+
						'<span>95wooseong</span> 첫번째 댓글이답!<br> <span>5you_bin</span>'+
						'두번째 댓글인데욤..<br>'+
					'</div>'+
					'<div class="post_comment_date">1일 전</div>'+
				'</div>'+
			'</div>'+
			'<div>'+
				'<div class="post_comment_add">'+
					'<input id="post_comment_add_loc" value="댓글 달기...">'+
					'<input id="post_comment_add_btn" type="button" value="게시">'+
				'</div>'+
			'</div>'+
		'</article>'+
	'</div>'+

	'<div class="sub_menu">'+
		'<div class="user_info">'+
			'<div class="user_info_profile_img">'+
				'<a href="#"><img src="resources/images/IconME.png" alt="myInfo">'+
				'</a>'+
			'</div>'+
			'<div class="user_info_name_id">'+
				'<span class="user_info_id">95wooseong</span> <br>우성'+
			'</div>'+
		'</div>'+

		'<div class="friend_story">'+
			'<div class="friend_story_title">스토리</div>'+
			'<div class="friend_story_contents">회원님이 팔로우하는 사람들의 스토리가 여기에'+
				'표시됩니다.</div>'+
		'</div>'+

		'<div class="friend_recommend">'+
			'<div>'+
				'<div>'+
					'회원님을 위한 추천 <a href="#">모두 보기</a>'+
				'</div>'+
			'</div>'+

			'<div>'+
				'<div>'+
					'아이디<br> 회원님을 팔로우 합니다'+
				'</div>'+
				'<a href="#">팔로우</a>'+
			'</div>'+

			'<div>'+
				'<div>'+
					'아이디<br> 회원님을 팔로우 합니다'+
				'</div>'+
				'<a href="#">팔로우</a>'+
			'</div>'+

			'<div>'+
				'<div>'+
					'아이디<br> 회원님을 팔로우 합니다'+
				'</div>'+
				'<a href="#">팔로우</a>'+
			'</div>'+

		'</div>'+

		'<div class="etc">홈페이지 소개, 도움말, API, 개인정보처리방침, 약관, 위치, 해시태그,'+
			'언어</div>'+

		'<div class="end">저작권그거</div>'+

	'</div>'
		return addones;
}