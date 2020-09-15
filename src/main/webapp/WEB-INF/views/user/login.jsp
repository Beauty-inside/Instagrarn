<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagrarn</title>
	<link rel="icon" type="image/png"  href="${ pageContext.request.contextPath }/resources/images/favi.png"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/login.css">

	<script type="text/javascript">
		function send(){
			var f = document.f;
			f.submit();
		}
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
					<input name="pwd" class="text" style="width:270px;height:37px; background-color: #FAFAFA;" placeholder="비밀번호">
					<input class="signin_btn" type="button" style="width:270px;height:30px; background-color: #B2DFFC;" value="로그인" onclick="send();">
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