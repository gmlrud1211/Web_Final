<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인정보수정</title>
	
		<!-- jQuery 2.2.4 -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
		<link rel="stylesheet" href="/js/bootstrap.js"/>
		<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
		<link rel="stylesheet" href="/css/bootstrap.css"/>
		<link rel="stylesheet" href="/css/bootstrap.min.css"/>
		
		<style>
		   	 /* .help-block 일단 안보이게 설정 */
		     #myForm .help-block{ display: none; }
		      /* glyphicon 일단 안보이게 설정 */
		     #myForm .glyphicon{ display: none;  }
		</style>
	
		<style>
			.myForm123 > div{overflow: hidden !important; max-width:100% !important}
			.myForm123 > div > label{float:left !important; width:40% !important}
			.myForm123 > div > div{float:left !important; width:60% !important}
			.myForm123 > div > div > input{width: 100% !important}
			
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				
				$("#btnChange").click(function(){
					$("#myForm").submit();
					alert("정보가 수정되었습니다");
				});

			});
		</script>

	</head>

	<body>
	
		<div class="container">
		<div style="max-width: 450px; margin: 0 auto;" >
		<h4 style="text-align:center;">개인정보 수정<--이부분 ui 헤더맞춰서 나중에 수정할거임</h4>
		<br><br>
				
		<form class="form-horizontal myForm123" id="myForm" action="/mypage/infoUpdate" method="post">
					
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_id">아이디</label>
				<div class="col-sm-11">
					<input class="form-control" type="text" value="${user.user_id }" readonly="readonly" />
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_name">이름</label>
				<div class="col-sm-11">
					<input class="form-control" type="text" value="${user.user_name }" />
				</div>
			</div>
			
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_email">이메일</label>
				<div class="col-sm-11">
					<input class="form-control" type="text" value="${user.user_email }" />
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_phone">휴대폰</label>
				<div class="col-sm-11">
					<input class="form-control" type="text" value="${user.user_phone }" />
				</div>
			</div>
			
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_birth">생년월일</label>	
				<div class="col-sm-11">
					<input class="form-control" type="text" value="<fmt:formatDate value='${user.user_birth}' pattern='yyyy-MM-dd'/>" readonly="readonly"  />
				</div>
			</div>	
		
			<br><br>
		
			<div class="col-sm-8 col-sm-offset-4" style="text-align:right;">		
				<button class="btn btn-primary">정보 수정 완료</button>
			</div>
		
		</form>
		</div>
	</div>
	
	
	</body>
</html>