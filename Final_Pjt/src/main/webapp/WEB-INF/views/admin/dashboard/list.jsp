<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<style>
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
			var u_no = $(this).children("td").eq(0).text();

			$(location).attr("href", "/admin/user/view?u_no=" + user_no);
		});

		//글쓰기 버튼 이벤트
		$("#btnWrite").click(function() {
			location.href = "/admin/user/write";
		});

		//회원 삭제 이벤트
		$("#delete").click(function() {
			$(location).attr("href", "/admin/user/delete?u_no=" + user_no);
		});

	});
</script>


<style type="text/css">
table {
 width : 100%;
}
th {
	text-align: center !important;
}

th, td:not (:nth-child(2)) {
	text-align: center;
}

td {
text-align : center;
	border-left: 1px solid white;
	border-right: 1px solid white;
}


td.info  {

background-color : grey; 
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


div.dtitle{
border : 1px solid black;
height : 200px;
margin : 10px;
}



.aaaaaaa{ 
 overflow: hidden;
 

}
.aaaaaaa li{float:left; width:50%;}

</style>
</head>

<body>

	<div id="menu" style="height: 100%; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

	<div id="content" style="padding:10px; width:900px; margin: 0 auto; border-left: 1px solid #D8D8D8; height:100%; float:left; ">

		<h3>대시보드</h3>
		<hr>
      
      <ul id="navi" class="aaaaaaa" style="width: 90%; height: 100%; margin : 0 auto;">
		<li class="group">
			<div class="dtitle">
				일정 비공개 : ${calno}
			</div>

		</li>
		<li class="group">
			<div class="dtitle">
			   일정 공개: 	${calyes }
			</div>

		</li>
		<li class="group">
			<div class="dtitle">
				<img alt="새 가입자" src="/img/newuser.jpg" width="150px" height="150px">
				
				<div class="ico">
			<span class="sale">새로운 가입자 : ${newuser }</span>

		      </div>
			</div>

		</li>
		<li class="group">
			<div class="dtitle">
				총 방문자수 : ${sessionScope.totalCount}
			</div>

		</li>
		<li class="group">
			<div class="dtitle">
				오늘 방문자 수 : ${sessionScope.todayCount}
			</div>

		</li>
	</ul>           
	</div>

	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>