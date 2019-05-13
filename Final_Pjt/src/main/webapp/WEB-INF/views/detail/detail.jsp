<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../views/common/meta.jsp" />


<!DOCTYPE html>
<html>
<head>
<style type="text/css">	

/* .detailimg {
    width: 100%;
    height: 100%;
    display: block;
    position: relative;

} */

/* .banner .detailimg{
    width: 300px;
    height: 200px;
    max-width: 100%;
    max-height: 100%;
    margin: 0 auto;
    vertical-align: middle;
} */
 


li > strong {
	float: left;
    width: 20%;
    font-size: 15px;
    color: #333;
    line-height: 30px;
}

li > span {
    float: left;
    width: 80%;
    font-size: 15px;
    color: #333;
    line-height: 30px;
}

li{
	list-style:none;
}
   
.DetialInfo .banner {
    width: 50%;
    float: left;
    box-sizing: border-box;
}

.DetialInfo .textInfo {
    width: 50%;
    float: right;
    box-sizing: border-box;
}


</style>
<script type="text/javascript">
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
		mode : "fade",
		slideWidth : 500,
		slideHeight : 300,
		slideMargin : 0,
		minSlides : 1,
		maxSlides : 1,
		moveSlides : 1,
		startSlide : 0,
		infiniteLoop : true,
		pager : true,
		adaptiveHeight : true,
		auto : true,
		autoHover : true,
		pause : 3000,
		speed : 500,
		easing : "easeInOutCirc",
		controls : true,
	});
	
	
}); 
//-->  


</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${infoList }
	<div class="content" style="padding: 150px;">
	
		<div class="infoHeader">
			<c:forEach var="list" items="${commonList }" varStatus="i">
				<h3 style="color:#827ffe;">[${list.telname }] ${list.title }</h3>
			</c:forEach>
			<ul>
			</ul>
		</div>
		<hr>
		<div class="DetialInfo">
			<div class="banner">  
				<ul class="bxslider">
					<c:forEach var="list" items="${imgList }" varStatus="i">
						<li><img src="${list.originimgurl}" class="detailimg"/></li>
					</c:forEach>
				</ul>
			</div>
			<div class="textInfo">
				
				<c:forEach var="list" items="${commonList }" varStatus="i">
					<p style="font-size:20px; color:#827ffe;"> About ${list.title } ?</p>
					<p style="font-size:15px"> ${list.overview } </p>
				</c:forEach>
				<hr>
				<ul style="padding:0px">
				
				<c:forEach var="list" items="${introList }" varStatus="i">
					<li><strong>주관</strong><span>${list.sponsor1 }</span></li>
					<li><strong>장소</strong><span>${list.eventplace }</span></li>
					<li><strong>일시</strong><span>${list.playtime }</span></li>
				</c:forEach>
				<c:forEach var="list" items="${commonList }" varStatus="i">
					<li><strong>홈페이지</strong><span>${list.homepage }</span></li>
					<li><strong>주소</strong><span>${list.addr1 }</span></li>
					<li><strong>연락처 1</strong><span>Tel: ${list.tel }</span></li>
					<li><strong>연락처 2</strong><span>Tel: ${list.tel }</span></li>
				</c:forEach>
				<c:forEach var="infoList" items="${infoLit }" varStatus="i">
					<li><strong>문의처</strong><span>${list.infocenter }</span></li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="btnArea">
			<button type="button" id="Bookmark" class="btn btn-danger btn-mm"> ♡ 찜하기</button>
			<button type="button" id="Bookmark" class="btn btn-danger btn-mm"> ♥ 찜하기</button>
			<button type="button" id="AddCalader" class="btn btn-primary btn-mm"> + 내 일정에 추가</button>
		</div>
	</div>
</body>
</html>