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
		
			<div class="bar" >
				<div class="searchwrap">
					<a href="#">
						<div class="photo">
							<img alt="" src="/img/img1.jpg">
						</div>
					
						<div class="textarea">
							<h3>
								벚꽃이 만발했다
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
					</a>
				</div>
			</div>
			   
			   
			<div class="bar" >
				<div class="searchwrap">
					<a href="#">
						<div class="photo">
							<img alt="" src="/img/img1.jpg">
						</div>
					
						<div class="textarea">
							<h3>
								벚꽃이 만발했다
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
					</a>
				</div>
			</div>
		
		
			<div class="bar" >
				<div class="searchwrap">
					<a href="#">
						<div class="photo">
							<img alt="" src="/img/img1.jpg">
						</div>
					
						<div class="textarea">
							<h3>
								벚꽃이 만발했다
							</h3>
							<p class="tag">이번 봄에는 벚꽃이 피었다.</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	
	
	</div>
</div>
	
</body>
</html>