<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기 · Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/signup.css">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		function send(){
			var f = document.f;
			f.submit();
		}
		
		function id_check() {
			var f = document.f;
			var phone = f.phone.value.trim();
			var id = f.id.value.trim();
			var num_check = /^[0-9]*$/;
			var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;				
			
			if(!email_check.test(phone) && (phone.length != 11 && !num_check.test(phone))) {
				alert("휴대폰 번호 또는 이메일을 입력해주세요");
				return;
			}
			var url = "id_check.do";
			var param = "phone=" + encodeURIComponent(phone) + "&id=" + encodeURIComponent(id);
			sendRequest(url, param, resultFn, "post");
		}
		
		function resultFn() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == 'no'){
					alert("중복된 이메일 또는 아이디가 있습니다.");
					return;
				}
				if(data == 'duple id'){
					alert("중복된 아이디가 있습니다.");
					return;
				}
				var f = document.f;
				f.submit();
			}
			
		}
	</script>
	
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script>
		$(function() {
		    $("#test").on("keyup", function() {
		        var flag = true;
		        flag = $(this).val().length > 0 ? false : true;
		        $("#btn-submit").attr("disabled", flag);
		        if (flag == true){
		        	document.getElementById("btn-submit").style.backgroundColor = '#B2DFFC';
		        } else {
		        	document.getElementById("btn-submit").style.backgroundColor = '#0095f6';
		        }
		        	
		    });
		});
	</script>
	
</head>
<body>
	<div class="container">
		<div class="user_container">
			<div class="login_container">
				<img src="${ pageContext.request.contextPath }/resources/images/insta_title.png" alt="Home" height="60">
				<span class = "comment_induction">친구들의 사진과 동영상을 보려면<br>가입하세요.</span>
				<div class="facebook_login_title">
					Facebook으로 로그인
				</div>
				<div class="login_part_box">
					<div class="login_part_line"></div>
					<div class="login_part_or">또는</div>
					<div class="login_part_line"></div>
				</div>
				<form action="signup" method="post" name="f">
					<input class="text" id="phone" name="phone" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="휴대폰 번호 또는 이메일 주소">
					<input class="text" name="fullname" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="성명">
					<input class="text" id="id" name="id" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="사용자 이름">
					<input class="text" id="test" name="pwd" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="비밀번호">
					<input class="signin_btn" id="btn-submit" type="button" disabled style="width:270px;height:30px; background-color: #B2DFFC;" value="가입" onclick="id_check();">
				</form>
				<div class="info_warn">가입하면 Instagram의 약관, 데이터 정책 및 쿠키 정책에 동의하게 됩니다.</div>
			</div>
		</div>
		
		<div class="user_container4">
			<div class="sign_up_container">
				계정이 있으신가요? <a href="/instagrarn/loginpage">로그인</a>
			</div>
		</div>
		
		<div class="user_container5">앱을 다운로드하세요.</div>
	</div>
	
	<div>
	
	</div>
</body>
</html>