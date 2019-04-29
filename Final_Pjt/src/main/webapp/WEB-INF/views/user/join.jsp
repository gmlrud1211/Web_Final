<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="/js/bootstrap.js">
<link rel="stylesheet" href="/js/bootstrap.min.js">
<link rel="stylesheet" href="/js/login.js">
<link rel="stylesheet" href="/css/main.css">

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-t-90">
			
			<form action="/join" method="post">
				<span class="login100-form-title p-b-51">JOIN</span>
				<br>
					
				<div class="wrap-input100 validate-input m-b-16">
					<input type = "text" name = "user_id" id="user_id" size="10" placeholder="아이디 입력" />
				</div>

				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100"  type="text" id ="user_pw" name="user_pw" placeholder="패스워드 입력" />
				</div>	
				
				<div class="wrap-input100 validate-input m-b-16" >				
					<label for="user_name">이름 : </label>
					<input class="input100"  type="text" id ="user_name" name="user_name" placeholder="이름 입력" />
				</div>	
				
				<div class="wrap-input100 validate-input m-b-16">
					<label for="user_email">이메일 : </label>
					<input class="input100"  type="text" id ="user_email" name="user_email" placeholder="이메일 입력" />
				</div>	
				
				<div class="wrap-input100 validate-input m-b-16">
					<label for="user_phone">휴대폰 : </label>
					<input class="input100"  type="text" id ="user_phone" name="user_phone" placeholder="휴대폰번호 입력" />
				</div>	
				
				<div class="wrap-input100 validate-input m-b-16">
					<label for="user_birth">생년월일 : </label>
					<input class="input100"  type="text" id ="user_birth" name="user_birth" placeholder="생년월일 입력" />
				</div>	
				
		
				<div class="container-login100-form-btn m-t-17">		
					<button class="login100-form-btn">JOIN</button>
				</div>
			</form>
			</div>
		</div>
	</div>

</body>
</html>