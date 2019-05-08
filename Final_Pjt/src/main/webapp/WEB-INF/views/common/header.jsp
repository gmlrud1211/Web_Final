<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<style>
	.header {width:100%; max-width:1200px; margin:0 auto; overflow: hidden; height: 55px; line-height:55px;}
	.header h1{float:left; font-size:26px;}
	.header ul{float:right; text-align: right; margin-right:20px;}
	.header ul li{display: inline-block; margin-left:-4px;}
	.header ul li a{}
	.header ul li a button{background: #fff; border:none; font-size:12px; color: #333; line-height: 50px;}
	ul.righttop li a{font-size: 13px; margin: 0 5px auto;}
</style> 

<style type="text/css">
a:link{color:black; text-decoration:none;}
a:visited{color:black; text-decoration:none;}
a:hover{color:blue; text-decoration:underline;}
</style>

<div style="text-align: center;" class=header>
	<h1>LOGO</h1>
	
	<!-- 로그인 안한 상태 -->
	<c:if test="${ not login }">
	<ul>
		<li><a href="/join"><button>회원가입</button></a></li>
		<li><a href="/login"><button>로그인</button></a></li>
	</ul>
		
	</c:if>
		
	<!-- 로그인 한 상태 -->
	<c:if test="${ login }">
		<ul>
			<li><a href="/logout"><button>로그아웃</button></a></li>
			<li>${user_id}님 환영합니다</li>
		</ul>
	</c:if>
	<ul class="righttop">
		<li><a href="#">일정공유 게시판</a></li>
		<li>/</li>
		<li><a href="#">질문하기</a></li>
		<li>/</li>
		<li><a href="#">일정등록하기</a></li>
	</ul>
</div>