<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../views/common/meta.jsp" />


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
			<form action="/main/search" method="get">
				<input type="text" name="search" placeholder="검색어 입력">
				<button type="submit">
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
		
		<div class="bar_wrap">
		
		
<%-- 		            <!-- 기본 시작 -->
            <c:if test="${basic }">
               <c:forEach items="${boardList }" var="list">
                  <tr>
                     <td style="text-align: center;">${list.report_no }</td>
                     <td style="text-align: center;"><c:if
                           test="${list.report_div.equals('Y') }">처리완료</c:if> <c:if
                           test="${list.report_div.equals('N') }">처리중</c:if></td>
                     <td><a href="/ban/banView?report_no=${list.report_no }">${list.report_title }</a></td>
                     <td style="text-align: center;"><fmt:formatDate
                           value="${list.report_date }" pattern="yyyy-MM-dd" /></td>
                     <td style="text-align: center;">${list.report_conn }</td>
                  </tr>
               </c:forEach>
               <!-- 게시물 없을 때 -->
               <c:if test="${nolist eq 0 }">
                  <tr>
                     <td colspan="6" style="text-align: center;">등록된 게시물이 없습니다.</td>
                  </tr>
               </c:if>
            </c:if>
 --%>            
            <c:forEach items="${searchList }" var="list">
			<div class="bar" >
				<div class="searchwrap">
						<div class="photo">
							<a href="#"><img alt="" src="/img/img1.jpg"></a>
						</div>
					
						<div class="textarea">
							<h3>
								<a href="#">${list.title}</a>
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
				</div>
			</div>
			</c:forEach>   
			   
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

   <!-- 페이징 리스트  시작 -->
   <div class="paging_wrap">
      <!-- 기본 시작 -->

      <c:if test="${basic==true }">
         <c:if test="${nolist ne 0 }">


            <ul>
               <%-- 이전 페이지 --%>
               <c:if test="${paging.curPage eq 1 }">
               </c:if>
               <c:if test="${paging.curPage ne 1 }">
               <li><a
                     href="/board/bansearch?curPage=${paging.curPage-1}&search=${search}&word=${word}"><i
                        class="xi-arrow-left"></i></a></li>
               </c:if>
               <%-- 페이징 리스트 --%>
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
               <%-- 다음 페이지 --%>
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
   </div>
	
</body>
</html>