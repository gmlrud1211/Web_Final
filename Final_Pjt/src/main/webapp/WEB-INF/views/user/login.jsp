<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

		<div style="text-align:center;">
			<h2>login</h2>	
			<hr>
			<form action="/login" method="post">
				<div class="form-group">
					<label for="user_id" >아이디  </label>
					<input type = "text" name = "user_id" id="user_id" size="10" placeholder="아이디 입력" />
				</div>

				<div class="form-group">
					<label for="pw">패스워드 : </label>
					<input type="password" id ="user_pw" name="user_pw" placeholder="패스워드입력" />
				</div>	
				
				<div>		
					<input type="submit" value="login"/>
				</div>
			</form>
		
		</div>

</body>
</html>