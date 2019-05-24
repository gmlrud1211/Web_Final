<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<script>
$(document).ready(function(){
    
    //모든 서브 메뉴 감추기
    $(".sub").css({display:"none"}); 
    //$(".sub").hide(); //위코드와 동일 

    $(".title").click(function(){
        //일단 서브메뉴 다 가립니다.
        //$(".sub").css({display:"none"});
        
        //열린 서브메뉴에 대해서만 가립니다.
        $(".sub").each(function(){
            console.log($(this).css("display"));
            if($(this).css("display")=="block") {
                //$(".sub").css({display:"none"});
                //$(this).hide();
                $(this).slideUp("fast");
            }
        });
        //현재 요소의 다음 요소를 보이게 합니다.
        //$(this).next("ul").css({display:"block"});
        //$(this).next("ul").show();
        $(this).next("ul").slideDown("fast");

    })
});
</script>

<style>
*{margin:0; paddding:0; font-size:14px;}
body {

	margin: px auto;
	padding: px auto;
	font-family: "맑은 고딕";
	font-size: 1.5em;
}

ul#navi {
	width: 300px;
	/* 	height:80%; */
	text-indent: 10px;
}

ul#navi a {
	width: 300px;
	/* 	height:80%; */
	text-indent: 10px;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group2 {
	margin-bottom: 10px;
}

li.group2 div.title a {
font-size : 20px;
	color: black;
	text-decoration: none;
}

li.group2 div.title a:hover {
	text-decoration: none;
	color: #F67280;
}

li.group2 div.title {
	text-align: center !important;
	font-size: 1.55em;
	height: 55px;
	line-height: 50px;
	color: grey;
	cursor: pointer;
}

ul.sub li {
	text-align: center;
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: grey;
}

ul.sub li:hover {
	background: #F67280;
}

ul.sub {
	display: none;
}
</style>
</head>
<body>
<!-- <ul> -->
<!-- 	<li data-info-normprc="62100" data-info-saleprc="52790" -->
<!-- 		data-info-cpnyn="Y" data-info-cpnaplyrtamtsctcd="20" -->
<!-- 		data-info-cpnrtamtval="15"> -->
		
<!-- 		이미지 및 상품 정보  -->
<!-- 		<a class="pic new" href="javascript:;"align="center">  -->
<!-- 		<img data-original="http://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0011/A00000011106908ko.png?l=ko" -->
<!-- 			alt="[온라인단독] 셀라피 에이리페어 크림 100ml" -->
<!-- 			data-ref-link-url="http://www.oliveyoung.co.kr/store/" -->
<!-- 			class="completed-scroll-lazyload" -->
<!-- 			src="http://image.oliveyoung.co.kr/uploads/images/goods/10/0000/0011/A00000011106908ko.png?l=ko"> -->

<!-- 	     </a> -->
	
<!-- 		<p class="phr">오직 온라인몰에서만 단.독.특.가 찬스~♥</p> -->
<!-- 		<div class="area"> -->
<!-- 			<a class="tit goodsList" href="javascript:;" -->
<!-- 				data-ref-goodsno="A000000111069" data-ref-dispcatno="" -->
<!-- 				data-ref-itemno="001">셀라피</a><a class="txt goodsList" -->
<!-- 				href="javascript:;" data-ref-goodsno="A000000111069" -->
<!-- 				data-ref-dispcatno="" data-ref-itemno="001">[온라인단독] 셀라피 에이리페어 크림 -->
<!-- 				100ml</a> -->
<!-- 			<div class="price"> -->
<!-- 				<div class="tx_org"> -->
<!-- 					<i class="tx_num">69,000</i>원 -->
<!-- 				</div> -->
<!-- 				<span>오늘특가</span>52,790<em>원</em> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
<!-- 		<div class="prd_flag"> -->
<!-- 			<span class="icon_flag sale">세일</span><span class="icon_flag coupon">쿠폰</span> -->
<!-- 		</div> 할인&세일 -->
		
<!-- 		<div class="ico"> -->
<!-- 			<span class="sale">10%<em>할인</em></span> <span class="coupon">15%<em>쿠폰</em></span> -->

<!-- 		</div> -->
<!-- 	</li> -->

<!-- </ul> -->


	<div style="">
	<ul id="navi" style="">
		<li class="group2">
			<div class="title">
				<a href="/admin/dashboard/list" role="button" aria-expanded="false">대시보드</a>
			</div>

		</li>

		<li class="group2">
			<div class="title">
				<a href="/admin/user/list" role="button" aria-expanded="false">회원관리</a>
			</div>

		</li>

		<li class="group2">
			<div class="title">
				<a href="/admin/noticeboard/list" aria-expanded="false">공지사항</a>
			</div>

		</li>
		<li class="group2">
			<div class="title">
				<a href="/admin/banner/list">배너관리</a>
			</div>

		</li>
		<li class="group2">
			<div class="title">
				<a href="/admin/chatbot/list">챗봇관리</a>
			</div>

		</li>
		<li class="group2">
			<div class="title">
				<a href="/admin/chatone/list">1대1 문의관리</a>
			</div>

		</li>
	</ul>
</div>
</body>
</html>