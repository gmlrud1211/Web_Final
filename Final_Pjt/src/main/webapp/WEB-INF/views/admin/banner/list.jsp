<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너관리</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>    
<style>

</style>

<script type="text/javascript">
$(document).ready(function() {
	//배너 등록 이벤트
	$("#btnWrite").click(function() {
		location.href = "/admin/banner/write";
	});
	
	//배너 삭제 이벤트
	$("#delete").click(function() {
		$(location).attr("href", "/admin/banner/delete?banner_no="+banner_no);
	});
});
</script>

<style type="text/css">
table {
 border-collapse : collapse;
 width : 100%;
}
th{
text-align: center !important;
font-size:17px;
}

th, td:not(:nth-child(2)) {
	
	text-align: center;
}
td {
	border-left: 1px solid white;
	border-right: 1px solid white;
	vertical-align: middle !important;
	}

#btnBox {
	text-align: right;
}

ul.pagination{
	list-style: none;
	text-align: center
}

ul.pagination li { 
	display: inline-block;
}

.bt{
background-color : #827ffe;
color : white;
font-size : 20px;
border-style :none;
border-radius: 5px;
}
</style></head>

<body>

<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
</div>

	<div id="menu" style="background-color: #d7d3d447; border-right:#D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

<div id="content" style="height:100%;width:78%;float:left;">

<div id="btnBox" style=" float:right; margin:30px; " >
	<button id="btnWrite" class="btn btn-primary bt" style="color:#ffffff; background:#827ffe;">등록</button>
</div>

<div style="margin:30px; ">
<h2 style="font-size:25px">배너관리</h2>
</div>


<div class="container" style="max-width:1063px; padding:10px;">

<div>
<table class="table table-bordered">
<colgroup>
	<col width="5%">
	<col width="15%">
	<col width="*">
	<col width="10%">
	<col width="10%">
</colgroup>
 <thead>
 <tr align="center"  style="color:white; background:#827ffe; ">
  <th> 순서 </th>
  <th> 배너명</th>
  <th> 미리보기</th>
<!--   <th> 링크</th> -->
  <th> 관리</th>
</tr>
</thead>

<tbody>
<c:forEach items="${banlist }" var="list">
<tr>
<td>${list.banner_no }</td>
<td>${list.banner_name }</td>
<td><a href="/admin/banner/write"><img src="/upload/${list.file_storedName }" style="width:30%; height:30%"></a></td>
<!-- <td id="link"><a href="#">링크</a></td> -->

<td id="modify">
<%-- <a href="/admin/banner/modify?banner_no=${list.banner_no }"style="color:blue; ">수정</a><br><br> --%>
<a href="/admin/banner/delete?banner_no=${list.banner_no } " style="color:red;">삭제</a></td>
</tr>
</c:forEach>
</tbody>
</table>

</div>
</div>

      
<br>




</div>



<div style="clear:both;">
<%-- <jsp:include page="/view/layout/footer.jsp" /> --%>
</div>












<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



















