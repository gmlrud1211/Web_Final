<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../views/common/meta.jsp" />
<jsp:include page="../views/common/header.jsp" />
<style>
* {
	margin: 0;
	padding: 0;
	font-size: 14px
}

ul.bxslider {
	list-style: none;
}

ul.bxslider li {
	
}

ul.bxslider li img {
	width: 100%;
	height: auto;
}

 .searchdiv {width: 500px; height: 50px; margin:0 auto; text-align: center; position: relative;}
 .searchdiv input {width: 100%; 	height: 50px; border: 2px solid #827ffe;  padding-left:20px;}
 .searchdiv button {position: absolute; top: 0px; right: 0px; width:50px; height:50px; background: #827ffe; border:1px solid #827ffe;}

.searchdiv button i {
	font-size: 30px;
}

div.hashtag {
	margin-left: 525px;
}

.notice_wrap {
	width: 100%;
	max-width: 1200px;
	margin: 50px auto;
}

.noticelist {
	width: 100%;
	border-collapse: collapse;
	border-top: 2px solid #827ffe;
}

.noticelist thead {
	
}

.noticelist thead tr {
	
}

.noticelist thead tr td {
	border: 1px solid #e1e1e1;
	text-align: center;
	padding: 10px 0;
}

.noticelist tbody {
	
}

.noticelist tbody tr {
	
}

.noticelist tbody tr td {
	border: 1px solid #e1e1e1;
	text-align: center;
	padding: 10px 0;
}

.searchairplane {
	text-align: center;
}

.searchairplane>div {
	width: 1024px;
	position: relative;
	margin: 50px auto;
}

.keyword1 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword2 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword3 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword4 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword5 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword6 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword7 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword8 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword9 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword10 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword11 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword12 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword13 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword14 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword15 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword16 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword17 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword18 {
	position: absolute;
	top: 0;
	left: 0;
}

.keyword19 {
	position: absolute;
	top: 0;
	left: 0;
}
</style>

  <div class="contents">
		 
		<div class="banner">
			<ul>
			<c:forEach items="${banlist }" var="bannerslist">
			
				<li><img src="/upload/${banlist.file_storedname }" ></li>
				
			</c:forEach>
			</ul>
		</div>
		 
	</div>


<!-- <ul class="bxslider"> -->
<!-- 	<li><img alt="성규 친구" src="/img/img1.jpg"></li> -->
<!-- 	<li><img alt="성규 친구" src="/img/img2.jpg"></li> -->
<!-- 	<li><img alt="성규 친구" src="/img/img3.jpg"></li> -->
<!-- </ul> -->


<div class="searchdiv">
	<form action="/main" method="post">
		<input type="text" name="search" placeholder="검색어 입력">
		<button type="submit"><i class=xi-search></i></button>

	</form>
</div>

<div class="searchairplane">
	<div>
		<img alt="" src="/img/airplane.png"> 
		<a class="keyword1" href="#">전체</a> <a class="keyword2" href="#">벚꽃</a> 
		<a class="keyword3" href="#">봄</a> <a class="keyword4" href="#">벚꽃축제</a>
		<a class="keyword5" href="#">야외공연</a> <a class="keyword6" href="#">봄봄봄</a>
		<a class="keyword7" href="#">내일로</a> <a class="keyword8" href="#">야외음악회</a>
		<a class="keyword9" href="#">전시회</a> <a class="keyword10" href="#">한강공원</a>
		<a class="keyword11" href="#">피크닉</a> <a class="keyword12" href="#">봄</a>
		<a class="keyword13" href="#">여름</a> <a class="keyword14" href="#">밤도깨비야시장</a>
		<a class="keyword15" href="#">6월</a> <a class="keyword16" href="#">7월</a>
		<a class="keyword17" href="#">8월</a> <a class="keyword18" href="#">10월</a>
		<a class="keyword19" href="#">가을</a>
	</div>
</div>

<div class="hashtag">
	<a href="#">#1월</a> 
	<a href="#">#2월</a> 
	<a href="#">#3월</a> 
	<a href="#">#4월</a>
	<a href="#">#5월</a> 
	<a href="#">#6월</a> 
	<a href="#">#7월</a> 
	<a href="#">#8월</a>
	<a href="#">#9월</a> 
	<a href="#">#10월</a> 
	<a href="#">#11월</a> 
	<a href="#">#12월</a>
</div>



<div class="notice_wrap">
	<p style="font-size: 18px; font-weight: bold;">공지사항</p>
	<p>공지사항입니다.</p>
	<table class="noticelist">
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="*">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<td>넘버</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>넘버</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</tbody>


	</table>
</div>

<jsp:include page="../views/common/footer.jsp" />
<jsp:include page="/WEB-INF/views/chat/chatbot.jsp" />
</body>

<script>
	$(document).ready(function() {
		/*메인슬라이더 px*/
		$(".bxslider li img").css({
			height : $(window).height() + "px"
		})
		$(window).resize(function() {
			$(".bxslider li img").css({
				height : $(window).height() + "px"
			})
		})
		/*메인슬라이더 px*/

		$(".bxslider").bxSlider({
			mode : "horizontal",
			slideWidth : 1920,
			slideMargin : 0,
			minSlides : 1,
			maxSlides : 1,
			moveSlides : 1,
			startSlide : 0,
			infiniteLoop : true,
			pager : true,
			adaptiveHeight : true,
			auto : true,
			autoHover : false,
			pause : 3000,
			speed : 500,
			easing : "easeInOutCirc",
			controls : true,
		});

	})
</script>
</html>