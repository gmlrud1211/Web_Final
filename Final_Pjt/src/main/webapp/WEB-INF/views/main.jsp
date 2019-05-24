<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.titleeeee{width:200px; height:50px; text-align:center; line-height:50px; font-size:14px; color:#f00; }

.mapimg1{position: absolute; top: 68px; left: 117px; cursor: pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;}
.mapimg2{position:absolute; top:120px; left:147px;; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg3{position:absolute; top:68px; left:237px; cursor:pointer;  text-indent:-9999px  ; width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg4{position:absolute; top:166px; left:143px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg5{position:absolute; top:163px; left:199px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg6{position:absolute; top:204px; left:89px; cursor:pointer;  text-indent:-9999px  ; width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg7{position:absolute; top:220px; left:173px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg8{position:absolute; top:205px; left:273px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg9{position:absolute; top:339px; left:214px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg10{position:absolute; top:274px; left:257px; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg11{position:absolute; top:310px; left:331px; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg12{position:absolute; top:354px; left:290px; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg13{position:absolute; top:291px; left:126px; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg14{position:absolute; top:408px; left:68px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg15{position:absolute; top:359px; left:105px; cursor:pointer;  text-indent:-9999px;   width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg16{position:absolute; top:468px; left:91px; cursor:pointer;  text-indent:-9999px ;  width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg17{position:absolute; top:95px; left:72px; cursor:pointer;  text-indent:-9999px  ; width: 46px;    height: 46px;      border-radius: 50%;    text-align: center;  line-height: 28px;} 
.mapimg1_text{position: absolute; top:12px; left:41px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg2_text{position: absolute; top:70px; left:77px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg3_text{position: absolute; top:12px; left:167px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg4_text{position: absolute; top:116px; left:73px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg5_text{position: absolute; top:113px; left:120px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg6_text{position: absolute; top:154px; left:29px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg7_text{position: absolute; top:170px; left:100px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg8_text{position: absolute; top:155px; left:203px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg9_text{position: absolute; top:290px; left:163px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg10_text{position: absolute; top:204px; left:160px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg11_text{position: absolute; top:260px; left:260px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg12_text{position: absolute; top:304px; left:220px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg13_text{position: absolute; top:241px; left:56px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg14_text{position: absolute; top:358px; left:0px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg15_text{position: absolute; top:309px; left:35px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg16_text{position: absolute; top:418px; left:20px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}
.mapimg17_text{position: absolute; top:45px; left:2px; width:200px; height:50px; line-height:50px; text-align:center; font-size:12px; border:1px solid #ff5252; color:#ff5252; padding:0 20px; background: #fff; display:none;}

</style>
	
	<ul class="bxslider">
		<c:forEach items="${banlist }" var="banlist">
			
			<li><img src="/upload/${banlist.file_storedName }" ></li>
				
		</c:forEach>
	</ul>
	
<div class="searchdiv">
	<form action="/searchPlace" method="POST">
		<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
		<input type="hidden" name="searchtype" value="keyword">
		<button type="submit" id="btnSearch"><i class=xi-search></i></button>

	</form>
</div>

<div style="overflow: hidden;">
	<div class="searchairplane">
<!-- 	<div class="searchairplane" style="float:left; width:50%;"> -->
		<jsp:include page="../views/index.jsp" />
	</div>
	
	
	
	
	
	<!-- 지도를 표시할 div 입니다 -->
	<p style="font-size:22px; font-weight:bold; text-align:center;">지역별 관광지 현황</p>
	<div>
<!-- 	<div  style="float:left; margin-top:80px; margin-left:251px;"> -->
		<div id="map" style="position: relative; width:403px; margin:0 auto;">
			<img alt="" src="../img/map.png">
			<span class="mapimg1 mapimg">서울</span>
			<span class="mapimg1_text mapimg_text">서울 관광지 : 448 건</span>
			<span class="mapimg2 mapimg">경기</span>
			<span class="mapimg2_text mapimg_text">경기 관광지 : 147 건</span>
			<span class="mapimg3 mapimg">강원</span>
			<span class="mapimg3_text mapimg_text">강원 관광지 : 61 건</span>
			<span class="mapimg4 mapimg">세종</span>
			<span class="mapimg4_text mapimg_text">세종 관광지 : 42 건</span>
			<span class="mapimg5 mapimg">충북</span>
			<span class="mapimg5_text mapimg_text">충북 관광지 : 22건</span>
			<span class="mapimg6 mapimg">충남</span>
			<span class="mapimg6_text mapimg_text">충남 관광지 : 22 건</span>
			<span class="mapimg7 mapimg">대전</span>
			<span class="mapimg7_text mapimg_text">대전 관광지 : 103 건</span>
			<span class="mapimg8 mapimg">경북</span>
			<span class="mapimg8_text mapimg_text">경북 관광지 : 34 건</span>
			<span class="mapimg9 mapimg">경남</span>
			<span class="mapimg9_text mapimg_text">경남 관광지 : 27 건</span>
			<span class="mapimg10 mapimg">대구</span>
			<span class="mapimg10_text mapimg_text">대구 관광지 : 167 건</span>
			<span class="mapimg11 mapimg">울산</span>
			<span class="mapimg11_text mapimg_text">울산 관광지 : 105 건</span>
			<span class="mapimg12 mapimg">부산</span>
			<span class="mapimg12_text mapimg_text">부산 관광지 : 268 건</span>
			<span class="mapimg13 mapimg">전북</span>
			<span class="mapimg13_text mapimg_text">전북 관광지 : 26 건</span>
			<span class="mapimg14 mapimg">전남</span>
			<span class="mapimg14_text mapimg_text">전남 관광지 : 20 건</span>
			<span class="mapimg15 mapimg">광주</span>
			<span class="mapimg15_text mapimg_text">광주 관광지 : 105 건</span>
			<span class="mapimg16 mapimg">제주</span>
			<span class="mapimg16_text mapimg_text">제주 관광지 : 318 건</span>
			<span class="mapimg17 mapimg">인천</span>
			<span class="mapimg17_text mapimg_text">인천 관광지 : 125 건</span>
		</div>
	</div>

</div>



<div class="notice_wrap">
	<p style="font-size: 18px; font-weight: bold;">공지사항</p>
	<p>공지사항입니다.</p>
	<table class="noticelist">
		<colgroup>
			<col width="10%">
			<col width="25%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
		  <c:set var="pageCnt" value="${pageCnt }"/>
		    <%
			    String p = pageContext.getAttribute("pageCnt").toString(); 
			    int pa = Integer.parseInt(p); 
	   		 %>
			<c:forEach items="${mainnboardlist }" var="list">
				<tr>
					<td><%=pa-- %></td>
					
					<td><a href="/noticeboard/view?notice_no=${list.notice_no }">${list.notice_title }</a></td>
					<td>${list.notice_count }</td>
					<td><fmt:formatDate value="${list.notice_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin: 20px;">
		<jsp:include page="/WEB-INF/views/layout/mainnoticeboardpaging.jsp" />
	</div>
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
			slideWidth : 1950,
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
	
/* 		function movePage(page){
		areaPage = page;
		
		$("#btnSearch").click();
	};
	 */
	
	
</script>
<script>
	$(document).ready(function(){
		$(".mapimg").mouseleave(function(){
			$(".mapimg_text").hide();
		})
		
		
		$(".mapimg1").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg1_text").fadeIn();
		})
		
		$(".mapimg2").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg2_text").fadeIn();
		})
		
		$(".mapimg3").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg3_text").fadeIn();
		})
		
		$(".mapimg4").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg4_text").fadeIn();
		})
		
		$(".mapimg5").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg5_text").fadeIn();
		})
		
		$(".mapimg6").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg6_text").fadeIn();
		})
		
		$(".mapimg7").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg7_text").fadeIn();
		})
		
		$(".mapimg8").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg8_text").fadeIn();
		})
		
		$(".mapimg9").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg9_text").fadeIn();
		})
		
		$(".mapimg10").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg10_text").fadeIn();
		})
		
		$(".mapimg11").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg11_text").fadeIn();
		})
		
		$(".mapimg12").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg12_text").fadeIn();
		})
		
		$(".mapimg13").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg13_text").fadeIn();
		})
		
		$(".mapimg14").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg14_text").fadeIn();
		})
		
		$(".mapimg15").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg15_text").fadeIn();
		})
		
		$(".mapimg16").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg16_text").fadeIn();
		})
		
		$(".mapimg17").mouseover(function(){
			$(".mapimg_text").hide();
			$(".mapimg17_text").fadeIn();
		})
	})
</script>
</html>