<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../views/common/meta.jsp" />


<script>
$(document).ready(function(){
	$("#btnSearch").click(function() {
		 var word = $("#word").val();
        
        $.ajax({
           type: "post"
           , url: "/mainsearch"
           , data: {"word":word,}
           , dataType: "List"
           , success: function(placeList){
              
              console.log('ajax success!');
              console.log("placeList : " + placeList);
              
              
              $(placeList).each(function(i){
                 $("#resultPlace").append("<br><br>");
                 
                 var place = JSON.parse(this);
                 //console.log(place.title);
                 /* http://api.visitkorea.or.kr/static/images/common/noImage.gif */
                 
                 if( (place.firstimage) == undefined){
                    // 이미지를 표시할 수 없습니다  --> 이미지로 대체
                    place.firstimage = "http://api.visitkorea.or.kr/static/images/common/noImage.gif";
                 } else if (place.title == undefined || place.title == null) {
                    place.title = "";
                 } else if (place.contentid == undefined || place.contentid == null ) {
                    place.title = "";
                 } else if (place.addr1 == undefined || place.addr1 == null ) {
                    place.addr1 = "";
                 } else if (place.addr2 == undefined || place.addr2 == null ) {
                    place.addr2 = "";
                 }

                 var innerHtml = "";
                 
                 innerHtml += "<ul class='list_thumType flnon'>"; 
                 innerHtml +=    "<li>";
                 innerHtml += "   <div>";
                 innerHtml += "      <div class='div1'>";
                 innerHtml += "         <img src='" + place.firstimage + "' alt='대표이미지' style='width:300px; height:200px'>";
                 innerHtml += "         <hr>";
                 innerHtml += "      </div>";
                 innerHtml += "   </div>";
                 innerHtml += "   <div class='area_txt'>";
                 innerHtml += "      <div class='" + place.contentid + "'>";
                 innerHtml += "         <a href='" + place.contentid +  "'>" + place.title + "</a>";
                 innerHtml += "      </div>";
                 innerHtml += "      <div class='addr'>";
                 innerHtml += "         <p> " + place.addr1 + place.addr2 + " </p>";
                 innerHtml += "      </div>";
                 innerHtml += "   </div>";
                 innerHtml += "</li>";
                 innerHtml += "</ul>";
                 
                 $("#resultPlace").append(innerHtml);
              });
              
           }
           , error: function(e) {
              console.log('error!');
              console.log(e);
           }
        });
     });
})
</script>
<style>
/*  .searchcontext{display:inline; min-width:600px; border-top:1px;} */
 .searchwrap{height: 100%; width: 100%;	margin:0px auto; overflow: hidden; padding:10px 0; box-sizing: border-box;}
 .photo{float:left;  width:30%; height: 100%}
 .photo img{width:100%; height: 100%}
 .textarea{float:left; width:67%; margin-left:3%; font-size:25px;}
 .textarea h3{font-size:18px; font-weight: bold;}
 .textarea p{font-size:14px;}

 .wrap{width:600px; margin:0 auto;}
 .searchdiv {width: 100%; height: 50px; margin:0 auto; text-align: center; position: relative;}
 .searchdiv input {width: 100%; 	height: 50px; border: 2px solid #827ffe;  padding-left:20px;}
 .searchdiv button {position: absolute; top: 0px; right: 0px; width:50px; height:50px; background: #827ffe; border:1px solid #827ffe;}
 .searchdiv button i {font-size: 30px;}
 
 .tagbox {list-style:none; overflow:hidden; padding:0; margin:20px 0;}
 .tagbox li{float:left; margin-right:10px;}
 .tagbox li a{font-size:20px; color:#aaa; font-weight: bold;transition:all,.5s; }
 .tagbox li a:hover{color:#827ffe; transition:all,.5s}
 .tagbox li:after {padding-left:10px; content:"|"; font-size:20px; vertical-align: top}
 .tagbox li:last-child:after {content:"";}
 
 .total_check{position: relative; width: 600px; padding: 15px 0 13px; font-weight: 700; border-top: 1px solid #999;}
 .bar_wrap{border-top:2px solid #827ffe}
 .bar {border-bottom: 1px solid #827ffe;    width: 100%;  height: 200px; margin: 0 auto;}

.totalsearch{font-size:24px; margin:10px 0;}
.totalsearch span{font-size:28px; font-weight: bold; color:#827ffe;}
</style>

<style type="text/css">
a:link{color:black; text-decoration:none;}
a:visited{color:black; text-decoration:none;}
a:hover{color:#827ffe;}
</style>


<body>  
<div class="wrap">
	<div class="sub_wrap">
		<div class="searchdiv" style="margin-top: 56px;">
			<form action="/mainsearch" method="post">
				<input type="text" name="word" id="word" placeholder="검색어 입력">
				<button type="button" id="btnSearch">
					<i class=xi-search></i>
				</button>
	
			</form>
		</div>
	
	
		<ul class="tagbox">
			<li><a href="#">전체</a></li>
			<li><a href="#">추천</a></li>
			<li><a href="#">코스</a></li>
			<li><a href="#">여행지</a></li>
			<li><a href="#">축제</a></li>
			<li><a href="#">이미지/동영상</a></li>
			<li><a href="#">기타</a></li>
		</ul>
		
		<p class="totalsearch">총 <span>3</span> 건</p>
		<div id="resultPlace">
         </div>
		<div class="bar_wrap">
		
			
			   
			<div class="bar" >
				<div class="searchwrap">
						<div class="photo">
							<a href="#"><img alt="" src="/img/img1.jpg"></a>
						</div>
					
						<div class="textarea">
							<h3>
								<a href="#">벚꽃이 만발했다</a>
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
					
				</div>
			</div>
		
		
			<div class="bar" >
				<div class="searchwrap">
						<div class="photo">
							<a href="#"><img alt="" src="/img/img1.jpg"></a>
						</div>
					
						<div class="textarea">
							<h3>
								<a href="#">벚꽃이 만발했다</a>
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
				</div>
			</div>
		</div>
	
	
	</div>
</div>

<%--    <!-- 페이징 리스트  시작 -->
   <div class="paging_wrap">
      <!-- 기본 시작 -->

      <c:if test="${basic==true }">
         <c:if test="${nolist ne 0 }">


            <ul>
               이전 페이지
               <c:if test="${paging.curPage eq 1 }">
               </c:if>
               <c:if test="${paging.curPage ne 1 }">
               <li><a
                     href="/board/bansearch?curPage=${paging.curPage-1}&search=${search}&word=${word}"><i
                        class="xi-arrow-left"></i></a></li>
               </c:if>
               페이징 리스트
               <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
                  var="i">
                  <c:if test="${paging.curPage eq i}">
                     <li class="on"><a
                        href="/board/bansearch?curPage=${i }&search=${search}&word=${word}">${i }</a></li>
                  </c:if>
                  <c:if test="${paging.curPage ne i}">
                     <li><a
                        href="/board/bansearch?curPage=${i }&search=${search}&word=${word}">${i }</a></li>
                  </c:if>
               </c:forEach>
               다음 페이지
               <c:if test="${paging.curPage eq paging.totalPage }">
               </c:if>
               <c:if test="${paging.curPage ne paging.totalPage }">
                  <li><a
                     href="/board/bansearch?curPage=${paging.curPage+1}&search=${search}&word=${word}"><i
                        class="xi-arrow-right"></i></a></li>
               </c:if>
            </ul>
         </c:if>
      </c:if>
      <c:if test="${nolist eq 0 }">
      </c:if>
      <!-- 기본 끝 -->
   </div> --%>
	
</body>
</html>