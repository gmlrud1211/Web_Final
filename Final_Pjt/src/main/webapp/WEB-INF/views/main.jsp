<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	
</style>


<script type="text/javascript">

</script>


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
			<a href="/logout"><button>로그아웃</button></a>
		</c:if>
	</div>
	
<!-- 챗봇기능 jsp include -->
<jsp:include page="/WEB-INF/views/chat/chatbot.jsp"/>

</body>
</html>