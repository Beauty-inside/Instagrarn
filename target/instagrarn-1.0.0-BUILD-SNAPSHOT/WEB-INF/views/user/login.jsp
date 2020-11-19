<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/login.css">

	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
	
	 window.onload=function first() {
			var url = "cookie_check";
			sendRequest(url, null, resultFn, "get");
		}
		function resultFn() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
			
				if(data == ""){

				}else{
					document.f.style.display = 'none';
					document.f2.style.display = 'block';
					document.getElementById("login_btn").value = data + "님으로 계속";
					document.getElementById("login_no").innerHTML = data;
				}
			}
		}
	
		function send(){
			var f = document.f;
			f.submit();
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
		<img src="${ pageContext.request.contextPath }/resources/images/login_phone.png" alt="loginpage" width="370" height="580">
		<div class="user_container">
			<div class="login_container">
				<img src="${ pageContext.request.contextPath }/resources/images/insta_title.png" alt="Home" height="60">
				<form action="login" method="post" name="f">
					<input name="phone" class="text" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="전화번호, 사용자 이름 또는 이메일">
					<input type="password" id="test" name="pwd" class="text" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="비밀번호">
					<input class="signin_btn" id="btn-submit" type="button" style="width:270px;height:30px; background-color: #B2DFFC;" value="로그인" onclick="send();">
					<div class="login_part_box">
						<div class="login_part_line"></div>
						<div class="login_part_or">또는</div>
						<div class="login_part_line"></div>
					</div>
					<div class="facebook_login_title">
						Facebook으로 로그인
					</div>
					<a class="lose_pw" href="#">비밀번호를 잊으셨나요?</a>
				</form>
				<form name="f2" style="display:none;">
					<div class="user_img_div"><img src="${ pageContext.request.contextPath }/resources/images/IconME.png" alt="Home" height="100" class="user_img"></div>
					<div><input type="button" class="login_btn" id="login_btn" value="님으로 계속"></div>
					<div class="anotherId" onclick="document.f.style.display='block'; document.f2.style.display='none'">계정변경</div>
				</form>
			</div>			
		</div>
		
		<div class="user_container2">
			<div class="sign_up_container">
				계정이 없으신가요? <a href="/instagrarn/signuppage">가입하기</a>
			</div>
		</div>
		
		<div class="user_container3">
			앱을 다운로드하세요.
		</div>
		
	</div>
	
	
	<div>
	
	</div>
</body>
</html>