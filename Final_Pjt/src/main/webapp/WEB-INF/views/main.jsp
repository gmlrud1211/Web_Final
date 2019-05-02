<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<h4>Main</h4>
	
<hr>
	<div style="text-align: center;">
		<!-- 로그인 안한 상태 -->
		<c:if test="${ not login }">
			<p>로그인을 해주시오ㅠㅡㅠ</p>
			<a href="/join"><button>회원가입</button></a>
			<a href="/login"><button>로그인</button></a>
		</c:if>
			
		<!-- 로그인 한 상태 -->
		<c:if test="${ login }">
			<p>${user_id}님 어서오세요~!</p>
			<a href="/mypage/info"><button>마이페이지로</button></a>
			<a href="/logout"><button>로그아웃</button></a>
		</c:if>
	</div>

</body>
</html>