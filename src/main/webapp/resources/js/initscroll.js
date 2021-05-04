function addscroll(data){
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
				'</a><img src="resources/post/'+data.img +'" id="imgloc" alt="이미지" width="618" height="616"><a href="#" onClick="nextImg();"><img class="right_btn" src="resources/images/p_img_right_btn.png" alt="다음">'+
				'</a>'+
			'</div>'+
			'<div>'+
				'<section class="post_buttons">'+

					'<div class="post_buttons_left">'+
						'<c:if test="${loadlist.isLike eq true}">'+
							'<img id="btn_like_'+data.board_idx+'" src="resources/images/post_button1_click.png" alt="like" onclick="like('+data.board_idx+');">'+
						'</c:if>'+
						'<c:if test="${loadlist.isLike eq false}">'+
							'<img id="btn_like_'+data.board_idx+'" src="resources/images/post_button1.png" alt="like" onclick="like('+data.board_idx+');">'+
						'</c:if>'+
						'<img src="resources/images/post_button2.png" alt="comment">'+
						'<img src="resources/images/post_button3.png" alt="arrow">'+
					'</div>'+

					'<div class="post_button_right">'+
						'<a href="#"> <img src="resources/images/post_button4.png" alt="bookmark"></a>'+
					'</div>'+

				'</section>'+
				'<section class="post_like"><a href="#">좋아요 '+data.like_num+'개</a></section>'+
			'</div>'+
			'<div>'+
				'<div class="post_content">'+
					'<div class="post_content_header">'+
						'<span>wooseong2</span> '+data.content+
					'</div>'+
				'</div>'+
				'<div class="post_comment">'+
					'<ul id="post_comment_headers_'+data.board_idx+'">'+
						'<c:forEach var="replylist" items="'+data.replylist+'">'+
							'<li><b>${replylist[0]}</b> ${replylist[1]}</li>'+
						'</c:forEach>'+
					'</ul>'+
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
	'</div>'
		return addones;
}