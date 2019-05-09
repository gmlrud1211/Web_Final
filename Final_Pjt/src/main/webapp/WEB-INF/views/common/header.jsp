<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<style>
   .header {width:100%; max-width:1200px; margin:0 auto; margin-left: 100px; margin-top:9px; overflow: hidden; height: 80px; line-height:55px;}
   .header h1{float:left; font-size:25px;}
   .header ul{float:right; text-align: right; margin-right:20px;}
   .header ul li{display: inline-block; margin-left:-4px;}
   .header ul li a{}
   .header ul li a button{background: #fff; border:none; font-size:12px; color: #333; line-height: 50px;}
   ul.righttop li a{font-size: 15px; margin: 0 5px auto;}
   #img {
       vertical-align: middle;
       border-style: none;
   }
</style> 

<style type="text/css">
a:link{color:black; text-decoration:none;}
a:visited{color:black; text-decoration:none;}
a:hover{color:#827ffe;}
</style>


<div class="header">

   <img alt="logo" src="/img/dance.png" id="img">&nbsp; 
   <span style="color:#403866; font-size:1.4em;"> All That Hot Place ^__^</span>
   
   <!-- 로그인 안한 상태 -->
   <c:if test="${ not login }">
   <ul>
      <li><a href="/join"><button>회원가입&nbsp;&nbsp;&nbsp;&nbsp;</button></a></li>
      <li><a href="/login"><button>로그인</button></a></li>
   </ul>
      
   </c:if>
      
   <!-- 로그인 한 상태 -->
   <c:if test="${ login }">
      <ul>
         <li><a href="mypage/myInfo">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
         <li>${user_id}님 환영합니다&nbsp;&nbsp;&nbsp;&nbsp;</li>
         <li><a href="/logout"><button>로그아웃</button></a></li>
      </ul>
   </c:if>
   <ul class="righttop">
      <li><a href="#">일정공유 게시판</a></li>
      <li>/</li>
      <li><a href="#">질문하기</a></li>
      <li>/</li>
      <li><a href="mypage/calendar">일정등록하기</a></li>
   </ul>
</div>