<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../views/common/meta.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>

<style type="text/css">   

body { font-family: 'Noto Sans Kannada', sans-serif; }


.detailimg {
    width: 500px;
    height: 450px;
    max-width: 100%;
    max-height: 450px;
    margin: 0 auto;
    vertical-align: middle;
}


li > strong {
   float: left;
    width: 20%;
    font-size: 13px;
    color: #333;
    line-height: 30px;
}

li > span {
    float: left;
    width: 80%;
    font-size: 13px;
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

.addCalbg {
   position : fixed;
   top: 0px;
   left : 0px;
   width : 100%;
   height : 100%;
   display : block;
   background : RGBA(0,0,0,0.5);
   display : none;
}
.con {
   position :absolute;
   top : 50%;
   left : 50%;
   width : auto;
   height : auto;
   background : #FFF;
   transform : translateX(-50%) translateY(-50%);
   z-index : 10000;
   display : none;
   padding: 20px;
       
}

</style>

<script type="text/javascript">

$(document).ready(function() {
   
   /* 이미지슬라이더 px */
   $(".bxslider li img").css({
      height : $(window).height() + "px"
   });
   
   $(window).resize(function() {
      $(".bxslider li img").css({
         height : $(window).height() + "px"
      });
   });
   
   /* 이미지슬라이더 px*/
   $(".bxslider").bxSlider({
      mode : "fade",
      slideWidth : 500,
      slideHeight : 450,
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

	var bookmark = ${isBookmark };
	
	if(bookmark == true){
		$("#likeafter").show();
		$("#likebefore").hide();
	} else {
		$("#likebefore").show();
		$("#likeafter").hide();
	}

   
   function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
   
   
	/* 즐겨찾기 추가 */
	$("#likebefore").click(function() {
		
		var isLogin = "${login}";
		if (isLogin != "true") {
			var loninConfirm = confirm("로그인 후 이용해주세요");
			if(loninConfirm){
				location.href = "/login";
			} else {
				return;
			}
		} else {
			
			var title = "${commonList[0].title}";
			var contentid = getParameterByName('contentId');
			var contenttypeid = getParameterByName('contentTypeId');
		    var userid = "<%=(String)session.getAttribute("user_id")%>"
		    var image = $('.detailimg').attr("src");
			var type = "bookmark";
			
			console.log(contentid);
			console.log(userid);
			console.log(image);
			console.log(type);
			
			
			$.ajax({
				type: "post"
				, url: "/detail/bookmark"
				, data: {
					"title":title,
					"contentid":contentid,
					"userid":userid,
					"image":image,
					"type":type,
					"contenttypeid":contenttypeid
					}
				, dataType: "text"
				, success: function(data){

					alert("즐겨찾기에 추가되었습니다!\n마이페이지에서 확인하세요.");
					
					$("#likeafter").show();
					$("#likebefore").hide();
				}
				, error: function(e) {
					alert("관심있는곳 설정에 실패했습니다. 다시 시도해주세요");
					console.log(e);
				}
			});
		}
	});
	
	/* 즐겨찾기 삭제  */
	$("#likeafter").click(function() {

		var contentid = getParameterByName('contentId');
	    var user_id = "<%=(String)session.getAttribute("user_id")%>"
	    
	    var isLogin = "${login}";
		if (isLogin != "true") {
			var loninConfirm = confirm("로그인 후 이용해주세요");
			if(loninConfirm){
				location.href = "/login";
			} else {
				return;
			}
		} else {
			
			$.ajax({
				type: "post"
				, url: "/detail/bookmarkCancel"
				, data: {
					"contentid":contentid, 
					"user_id":user_id
					}
				, dataType: "text"
				, success: function(data){
					alert("즐겨찾기 삭제되었습니다!");
	
					$("#likeafter").hide();
					$("#likebefore").show();
				}
				, error: function(e) {
					alert("관심있는 곳 취소에 실패했습니다. 다시 시도해주세요");
					console.log(e);
				}
			});
		}
	});
	
	

	/* 캘린더 추가 */
	$("#addCalBtn").click(function () {
	
		var isLogin = "${login}";
		if (isLogin != "true") {
			var loninConfirm = confirm("로그인 후 이용해주세요");
			if(loninConfirm){
				location.href = "/login";
			} else {
				return;
			}
		} else {
		
		var user_id = "<%=(String)session.getAttribute("user_id")%>"
		
		   $.ajax({
			    type: "post"
			    , url: "/detail/getCalendar"
			    , data: {
			       "user_id":user_id
			    }
			    , dataType: "html"
				, success: function(html){
					console.log(html);
// 					$("#calTbl tbody").append(html);
					$("#addCalendar").html(html);
		        	 
		       /*   var innerHTML = "<tr>";
		             innerHTML += "<td>" + result[i].calendar_no  + "</td>";
		             innerHTML += "<td class='calTitle' id='cal-"+result[i].calendar_no+"' name='" + result[i].calendar_no + "'>" + result[i].calendar_title + "</a></td>";
		             innerHTML += "<td>" + (result[i].calendar_scheduleDate).substr(0,10) +"</td>";   
		             innerHTML += "</tr>"
		            $("#calTbl tbody").append(innerHTML); */
		            
		         
		         $(".con").fadeIn();
		         $(".addCalbg").fadeIn();
		               
				}
		      , error: function(e) { 
		         console.log(e);
		      }
		   });
		
		   
		   $("#addSchedule").click(function(){
		      $("#calendarForm").submit();
		      $(".con").fadeOut();
		      $(".addCalbg").fadeOut();
		      alert("일정이 등록되었습니다!");
		   });
		}
	});
	
	$(".calTitle").click(function () {
		
		alert("calTitle!");
		var calendarNo = $(this).name();
		
	});
	  
	/* 댓글 수 append */
	$(".commentCount").append( $(".comment_row").length );

	
	/* 댓글 등록 */
	$("#commentsubmit").click(function() {
		
		var isLogin = "${login}";
		if (isLogin != "true") {
			var loninConfirm = confirm("로그인 후 이용해주세요");
			if(loninConfirm){
				location.href = "/login";
			} else {
				return;
			}
		} else {
			if($("#content").val() == ""){
				alert("댓글내용을 입력해주세요");
				return;
			} else {
				$("form").submit();
			}
		}
	});
	
	
	$(".deleteComment").click(function() {

		var contentid = getParameterByName('contentId');
		var contenttypeid = getParameterByName('contentTypeId');
		var comment_no = $(this).attr('id');

		location.href = "/detail/commentDelete?contentid=" + contentid + "&contentTypeId=" + contenttypeid +  
						"&comment_no=" + comment_no;
		
	});
	
});
</script>

</head>
<body style="margin-bottom: 300px;">
	<jsp:include page="../common/header.jsp" />
	<div class="content" style="padding: 150px; margin-bottom:200px;">
		<div class="infoHeader">
			<c:forEach var="list" items="${commonList }" varStatus="i">
           		<span id="title" style="color:#827ffe; font-size:27px;">${list.title }</span>
            	<span style="text-align:right; margin-left: 690px;">
					<button id="likebefore" style="display:none; border:none; background-color:white;">
	            	   <img src="/../../../img/like_nonclick.png"style="width:30px; height: 30px; cursor:pointer;"/>&nbsp;
	            	</button>
                	<button id="likeafter" style="display:none; border:none; background-color:white;">
	               		<img src="/../../../img/like_click.png" class="" style="width:30px; height: 30px; cursor:pointer;"/>&nbsp;
	               	</button>
	               	<button id="addCalBtn" style="border:none; background-color:white;">
	               		<img src="/../../../img/add_event.png" class="" style="width:30px; height: 30px; cursor:pointer;"/>&nbsp;	
	               </button>&nbsp;
	               <a href="#commentArea"><img src="/../../../img/comment.png" class="" style="width:30px; height: 30px; cursor:pointer;"/>
	               <span class="commentCount" style="font-weight: 1000; color: #827ffe;"></span><span style="font-weight: 1000; color: #827ffe;">개의 댓글</span></a>
	               
				</span>
				</c:forEach>
			<ul>
			</ul>
		</div>
      <hr>
      <div class="DetialInfo">
         <div class="banner">  
            <ul class="bxslider">
               <c:forEach var="list" items="${imgList }" varStatus="i">
                  <li><img src="${list.originimgurl}" class="detailimg" style="width:500px; height: 450px !important;"/></li>
               </c:forEach>
            </ul>
             
           <c:forEach var="list" items="${commonList }" varStatus="i">
	            <!-- 지도영역 -->
	            	<div id="map" style="width:500px;height:400px;z-index:0;" onclick="callMap('${list.mapx}', '${list.mapy}', '${list.mlevel}' )"></div>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a7635c2d5aad5bc6d20fc52f944f2ef"></script>
				
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(${list.mapy}, ${list.mapx}),
						level: 6
					};
			
					var map = new daum.maps.Map(container, options);
	
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(${list.mapy}, ${list.mapx});
	
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});
	
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
				</script>
			</c:forEach>
			            
            
         </div>
         
         <div class="textInfo">
            
            <c:forEach var="list" items="${commonList }" varStatus="i">
               <p style="font-size:20px; color:#827ffe;"> About ${list.title }</p>
               <p style="font-size:15px;line-height:30px;"> ${list.overview } </p>
            </c:forEach>
            <hr>
            <ul style="padding:0px">
            
	            <!-- 장소타입이 관광지인 경우 -->
	            <c:if test="${contentTypeId eq '12' }">
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${tourIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.infocenter or list.infocenter eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocenter }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	                  <c:choose>
	                     <c:when test="${empty list.parking or list.parking eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parking }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restdate or list.restdate eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>휴무일</strong><span>${list.restdate }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.useseason or list.useseason eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>이용시기</strong><span>${list.useseason }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usetime or list.usetime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>이용시간</strong><span>${list.usetime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkbabycarriage or list.chkbabycarriage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>유모차대여</strong><span>${list.chkbabycarriage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkpet or list.chkpet eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>애완동물 동반</strong><span>${list.chkpet }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.expagerange or list.expagerange eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>체험가능연령</strong><span>${list.expagerange }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	
	
	            <!-- 장소타입이 문화시설인 경우 -->
	            <c:if test="${contentTypeId eq '14' }">
	            
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${cultureIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.chkbabycarriageculture or list.chkbabycarriageculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>유모차대여</strong><span>${list.chkbabycarriageculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkpetculture or list.chkpetculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>애완동물동반</strong><span>${list.chkpetculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.discountinfo or list.discountinfo eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>할인정보</strong><span>${list.discountinfo }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocenterculture or list.infocenterculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocenterculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	                  <c:choose>
	                     <c:when test="${empty list.parkingculture or list.parkingculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkingculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkingfee or list.parkingfee eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차요금</strong><span>${list.parkingfee }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restdateculture or list.restdateculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>휴무일</strong><span>${list.restdateculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usefee or list.usefee eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>이용요금</strong><span>${list.usefee }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usetimeculture or list.usetimeculture eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>운영시간</strong><span>${list.usetimeculture }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scale or list.scale eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>규모</strong><span>${list.scale }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.spendtime or list.spendtime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>소요시간</strong><span>${list.spendtime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkcreditcard or list.chkcreditcard eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>카드가능여부</strong><span>${list.chkcreditcard }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	            
	            <!-- 장소타입이 축제/공연/전시인 경우 -->
	            <c:if test="${contentTypeId eq '15' }">
	            
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${festivalIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.agelimit or list.agelimit eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>관람 가능연령</strong><span>${list.agelimit }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.bookingplace or list.bookingplace eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>예매처</strong><span>${list.bookingplace }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.discountinfofestival or list.discountinfofestival eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>할인정보</strong><span>${list.discountinfofestival }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.eventstartdate or list.eventstartdate eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>행사시작일</strong><span>${list.eventstartdate }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	                  <c:choose>
	                     <c:when test="${empty list.eventenddate or list.eventenddate eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>행사종료일</strong><span>${list.eventenddate }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.eventhomepage or list.eventhomepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.eventhomepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.festivalgrade or list.festivalgrade eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>축제등급</strong><span>${list.festivalgrade }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.placeinfo or list.placeinfo eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>위치안내</strong><span>${list.placeinfo }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.playtime or list.playtime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>공연시간</strong><span>${list.playtime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.program or list.program eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>프로그램</strong><span>${list.program }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.spendtimefestival or list.spendtimefestival eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>관람소요시간</strong><span>${list.spendtimefestival }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.sponsor1 or list.sponsor1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주최자정보</strong><span>${list.sponsor1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.sponsor1tel or list.sponsor1tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주최자연락처</strong><span>${list.sponsor1tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.sponsor2 or list.sponsor2 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주관사정보</strong><span>${list.sponsor2 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.sponsor2tel or list.sponsor2tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주관사연락처</strong><span>${list.sponsor2tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.subevent or list.subevent eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>부대행사</strong><span>${list.subevent }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usetimefestival or list.usetimefestival eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>이용요금</strong><span>${list.usetimefestival }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	            
	            <!-- 장소타입이 여행코스인 경우 -->
	            <c:if test="${contentTypeId eq '25' }">
	            
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${courseIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.distance or list.distance eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>코스 총 거리</strong><span>${list.distance }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocentertourcourse or list.infocentertourcourse eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocentertourcourse }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.schedule or list.schedule eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>코스일정</strong><span>${list.schedule }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.taketime or list.taketime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>코스 총 소요시간</strong><span>${list.taketime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	                  <c:choose>
	                     <c:when test="${empty list.theme or list.theme eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>코스테마</strong><span>${list.theme }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	            
	            <!-- 장소타입이 레포츠인 경우 -->
	            <c:if test="${contentTypeId eq '28' }">
	            
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${reportIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.accomcountleports or list.accomcountleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>수용인원</strong><span>${list.accomcountleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkbabycarriageleports or list.chkbabycarriageleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>유모차대여</strong><span>${list.chkbabycarriageleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkcreditcardleports or list.chkcreditcardleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>신용카드가능</strong><span>${list.chkcreditcardleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkpetleports or list.chkpetleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>애완동물동반</strong><span>${list.chkpetleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	                  <c:choose>
	                     <c:when test="${empty list.expagerangeleports or list.expagerangeleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>체험가능연령</strong><span>${list.expagerangeleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocenterleports or list.infocenterleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocenterleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.openperiod or list.openperiod eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>개장기간</strong><span>${list.openperiod }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkingfeeleports or list.parkingfeeleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차요금</strong><span>${list.parkingfeeleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkingleports or list.parkingleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkingleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.reservation or list.reservation eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>예약안내</strong><span>${list.reservation }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restdateleports or list.restdateleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>쉬는날</strong><span>${list.restdateleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scaleleports or list.scaleleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>규모</strong><span>${list.scaleleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usefeeleports or list.usefeeleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>입장료</strong><span>${list.usefeeleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.usetimeleports or list.usetimeleports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>이용시간</strong><span>${list.usetimeleports }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  
	               </c:forEach>
	            </c:if>
	            
	            
	            <!-- 장소타입이 숙박인 경우 -->
	            <c:if test="${contentTypeId eq '32' }">
	            
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${hotelIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.checkintime or list.checkintime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>체크인</strong><span>${list.checkintime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.checkouttime or list.checkouttime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>체크아웃</strong><span>${list.checkouttime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkcooking or list.chkcooking eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>객실 내 취사여부</strong><span>${list.chkcooking }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocenterlodging or list.infocenterlodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocenterlodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkinglodging or list.parkinglodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkinglodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkinglodging or list.parkinglodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkinglodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkinglodging or list.parkinglodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkinglodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.pickup or list.pickup eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>픽업</strong><span>${list.pickup }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.roomcount or list.roomcount eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>객실수</strong><span>${list.roomcount }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.reservationlodging or list.reservationlodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>예약안내</strong><span>${list.reservationlodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.reservationurl or list.reservationurl eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>예약안내 홈페이지</strong><span>${list.reservationurl }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.roomtype or list.roomtype eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>객실유형</strong><span>${list.roomtype }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scalelodging or list.scalelodging eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>규모</strong><span>${list.scalelodging }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.subfacility or list.subfacility eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>부대시설</strong><span>${list.subfacility }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.barbecue or list.barbecue eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>바베큐장 여부</strong><span>${list.barbecue eq 1 ? '가능' : '불가' }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.bicycle or list.bicycle eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>자전거 대여 여부</strong><span>${list.bicycle eq 1 ? '가능' : '불가'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.campfire or list.campfire eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>캠프파이어 여부</strong><span>${list.campfire eq 1 ? '가능' : '불가'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.fitness or list.fitness eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>휘트니스 센터 여부</strong><span>${list.fitness eq 1 ? '있음' : '없음'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.karaoke or list.karaoke eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>노래방여부</strong><span>${list.karaoke eq 1 ? '있음' : '없음'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.seminar or list.seminar eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>세미나실 여부</strong><span>${list.seminar eq 1 ? '있음' : '없음'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.sports or list.sports eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>스포츠시설 여부</strong><span>${list.sports eq 1 ? '있음' : '없음'  }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	            
	            <!-- 장소타입이 쇼핑인 경우 -->
	            <c:if test="${contentTypeId eq '38' }">
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${shoppingIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.chkbabycarriageshopping or list.chkbabycarriageshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>유모차대여</strong><span>${list.chkbabycarriageshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkcreditcard or list.chkcreditcard eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>신용카드여부</strong><span>${list.chkcreditcard }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.chkpetshopping or list.chkpetshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>애완동물동반</strong><span>${list.chkpetshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.culturecenter or list.culturecenter eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문화센터 바로가기</strong><span>${list.culturecenter }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.fairday or list.fairday eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>장서는날</strong><span>${list.fairday }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocentershopping or list.infocentershopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocentershopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.opendateshopping or list.opendateshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>개장일</strong><span>${list.opendateshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.opentime or list.opentime eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>영업시간</strong><span>${list.opentime }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkingshopping or list.parkingshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkingshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restdateshopping or list.restdateshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>휴무일</strong><span>${list.restdateshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restroom or list.restroom eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>화장실설명</strong><span>${list.restroom }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.saleitem or list.saleitem eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>판매품목</strong><span>${list.saleitem }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.saleitemcost or list.saleitemcost eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>판매품목 별 가격</strong><span>${list.saleitemcost }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scaleshopping or list.scaleshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>규모</strong><span>${list.scaleshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scaleshopping or list.opendateshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>개장일</strong><span>${list.opendateshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.opendateshopping or list.opendateshopping eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>개장일</strong><span>${list.opendateshopping }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.shopguide or list.shopguide eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>매장안내</strong><span>${list.shopguide }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
	            
	            <!-- 장소타입이 음식점인 경우 -->
	            <c:if test="${contentTypeId eq '39' }">
	               <c:forEach var="list" items="${commonList }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.homepage or list.homepage eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>홈페이지</strong><span>${list.homepage }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주소</strong><span>${list.addr1 }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.tel or list.tel eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>연락처</strong><span>${list.tel }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	               
	               <c:forEach var="list" items="${restaurantIntro }" varStatus="i">
	                  <c:choose>
	                     <c:when test="${empty list.chkcreditcardfood or list.chkcreditcardfood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>신용카드여부</strong><span>${list.chkcreditcardfood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.discountinfofood or list.discountinfofood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>할인정보</strong><span>${list.discountinfofood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.firstmenu or list.firstmenu eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>대표메뉴</strong><span>${list.firstmenu }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.infocenterfood or list.infocenterfood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>문의 및 안내</strong><span>${list.infocenterfood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.kidsfacility or list.kidsfacility eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>어린이놀이방</strong><span>${list.kidsfacility }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.opendatefood or list.opendatefood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>개업일</strong><span>${list.opendatefood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.opentimefood or list.opentimefood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>영업시간</strong><span>${list.opentimefood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.packing or list.packing eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>포장가능</strong><span>${list.packing }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.parkingfood or list.parkingfood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>주차시설</strong><span>${list.parkingfood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.reservationfood or list.reservationfood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>예약안내</strong><span>${list.reservationfood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.restdatefood or list.restdatefood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>휴무일</strong><span>${list.restdatefood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.scalefood or list.scalefood eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>규모</strong><span>${list.scalefood }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.seat or list.seat eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>좌석 수</strong><span>${list.seat }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.smoking or list.smoking eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>금연/흡연 여부</strong><span>${list.smoking }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	                  <c:choose>
	                     <c:when test="${empty list.treatmenu or list.treatmenu eq 'null'}"></c:when>
	                     <c:otherwise>
	                        <li><strong>취급메뉴</strong><span>${list.treatmenu }</span></li>
	                     </c:otherwise>
	                  </c:choose>
	               </c:forEach>
	            </c:if>
				</ul>
 			</div>
 			<div id="addCalendar">
			<jsp:include page="../../views/detail/addCalendar.jsp" />
			</div>
		</div>
	</div>
   
	<div class="comment" id="commentArea" style="margin-top: 800px; padding: 150px">
	<c:forEach var="list" items="${commonList }" varStatus="i">
		<p style="font-size:23px;"> <b><span style="color:#827ffe;"> ${list.title } </span> </b>에 대한 의견을 남겨주세요!</p>
	</c:forEach>
    <h4 style="margin-top:30px;">총 댓글 수 <span class="commentCount"> </span> </h4>
	<table 	class="table table-striped table-hover"> 
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 20%">작성자 아이디</th>
				<th style="width: 45%">댓글내용</th>
				<th style="width: 15%">작성일시</th>
				<th style="width: 10%"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${commentList }" varStatus="i">
				<tr class="comment_row">
					<td><c:out value="${i.count}" /> </td>
					<td>${list.user_id }</td>
					<td>${list.comment_content }</td>
					<td><fmt:formatDate value="${list.comment_date }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
					<td>
						<c:if test="${user_id eq list.user_id}">
							<button type="button" id="${list.comment_no }" class="btn btn-danger btn-sm deleteComment">댓글삭제</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
							
	<form action="/detail/comment" method="post">
		<table class="container" style="margin-top:50px">
			<tr style="text-align:center;">
				<c:forEach var="list" items="${commonList }" varStatus="i">
					<input type="hidden" name="contentid" value="${list.contentid }">
				</c:forEach>
				<input type="hidden" name="contentTypeId" value="${contentTypeId }">
				<input type="hidden" name="user_id" value="${user_id }" />
				<td colspan="3"><textarea id="content" class="content" name="content" style="width:900px"></textarea></td>
				<td colspan="4">
				<button type="button" id="commentsubmit" class="btn btn-warning btn-mm" style="margin-right: 50px;">
				댓글등록</button></td>	
			</tr>
		</table>
		</form>
	</div>
   
   <div style="padding: 100px">
		<jsp:include page="../../views/common/footer.jsp" />
	</div>
</body>
</html>