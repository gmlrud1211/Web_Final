<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../views/common/meta.jsp" />


<style>
 .search_wrap{width: 100%; max-width:1200px; margin: 50px auto; }
 .searchlist {width : 100%; border-collapse: collapse; border-top:2px solid #ff5252}
 .searchlist thead{}
 .searchlist thead tr{}
 .searchlist thead tr td{border:1px solid #e1e1e1; text-align:center; padding:10px 0;}
 .searchlist tbody{}
 .searchlist tbody tr{ }
 .searchlist tbody tr td{border:1px solid #e1e1e1;  text-align:center; padding:10px 0; }
 
 .searchdiv {width: 500px; height: 50px; margin: 0 auto; text-align: center; position: relative;}
 .searchdiv input {width: 100%; 	height: 50px;}
 .searchdiv button {position: absolute; top: 10px; right: 5px;}
 .searchdiv button i {font-size: 30px;}
 
 .tagbox {list-style:none; overflow:hidden;}
 .tagbox li{float:left; margin-right:5px;}
 .tagbox li:after {padding-left:5px; content:"|";}
 .tagbox li:last-child:after {content:"";}
</style>





<body>

<div class="searchdiv">
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

<hr>
	총100건
	
	<div class="search_wrap">
		<table class="searchlist">
				
			
			
		</table>
	</div>

</body>
</html>