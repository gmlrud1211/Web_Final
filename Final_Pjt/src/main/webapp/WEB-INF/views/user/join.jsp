<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
		<div style="text-align:center;">
			<h2>join</h2>	
			<hr>
			<form action="/join" method="post">
				<div class="form-group">
					<label for="user_id" >아이디  </label>
					<input type = "text" name = "user_id" id="user_id" size="10" placeholder="아이디 입력" />
				</div>

				<div class="form-group">
					<label for="user_pw">패스워드 : </label>
					<input type="text" id ="user_pw" name="user_pw" placeholder="패스워드 입력" />
				</div>	
				
				<div class="form-group">
					<label for="user_name">이름 : </label>
					<input type="text" id ="user_name" name="user_name" placeholder="이름 입력" />
				</div>	
				
				<div class="form-group">
					<label for="user_email">이메일 : </label>
					<input type="text" id ="user_email" name="user_email" placeholder="이메일 입력" />
				</div>	
				
				<div class="form-group">
					<label for="user_phone">휴대폰 : </label>
					<input type="text" id ="user_phone" name="user_phone" placeholder="휴대폰번호 입력" />
				</div>	
				
				<div class="form-group">
					<label for="user_birth">생년월일 : </label>
					<input type="text" id ="user_birth" name="user_birth" placeholder="생년월일 입력" />
				</div>	
				
				
				
				<div>		
					<input type="submit" value="JOIN"/>
				</div>
			</form>
		
		</div>

</body>
</html>