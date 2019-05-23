<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>

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
	border-collapse: collapse;
	width: 100%;
}

th {
	text-align: center !important;
	border-bottom: 2px solid grey;
	border-top: 2px solid grey;
	height: 40px;
}

th
,
td
:not
 
(
:nth-child(2)
 
)
{
text-align
:
 
center
;


}
td {
	text-align: center;
	height: 40px;
	border-bottom: 1px solid #D8D8D8;
}

#btnBox {
	text-align: right;
}

ul.pagination {
	list-style: none;
	text-align: center
}

ul.pagination li {
	display: inline-block;
}
</style>
</head>

<body>

<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
</div>

	<div id="menu" style="background-color: #d7d3d447; border-right:#D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

	<div id="content"
		style="padding:10px; padding-left:50px;width: 1000px; margin: 0 auto; border-left: 1px solid #D8D8D8; height: 100%; float: left;">

		<h5 style="font-size:25px; padding:20px;">회원관리</h5>
		<br><br>

		<table class="table table-hover table-striped table-condensed">
			<thead>
				<tr>
					<th style="width: 10%">회원번호</th>
					<th style="width: 30%">회원이름</th>
					<th style="width: 20%">가입일</th>
					<th style="width: 10%">상세</th>
					<th style="width: 10%">탈퇴처리</th>

				</tr>
			</thead>

			<tbody>
				<c:forEach items="${userlist }" var="list">
					<tr>
						<td>${list.user_no }</td>
						<td>${list.user_name }</td>
						<td><fmt:formatDate value="${list.user_regdate }"
								pattern="yyyy-MM-dd" /></td>
						<td><a
							onclick="window.open('/admin/user/view?user_no=${list.user_no }','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');"
							style="color: blue;">조회</a></td>
						<td id="delete"><a
							href="/admin/user/delete?user_no=${list.user_no }"
							style="color: red;">삭제</a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

<div style="padding: 20px;">
		<jsp:include page="/WEB-INF/views/layout/userpaging.jsp" />
</div>
		<br>
		<div
			style="height: 20px; width: 100%; padding: 10px 350px; claer: both;">
			<div class='text-center'
				style="height: 20px; width: 100%; margin: 0 atuo;">
				<FORM name='search' method='get' action='/admin/user/list'>

					<SELECT name='search'>
						<!-- 검색 컬럼 -->
						<OPTION id='user_no' value='user_no'>회원번호</OPTION>
						<OPTION id='user_name' value='user_name'>이름</OPTION>
					</SELECT> <input type='text' name='word' placeholder="특수문자는 사용할수 없습니다.">
					<button id="searBtn">검색</button>

				</FORM>
			</div>
			<DIV class='menu_line' style='clear: both;'></DIV>

		</DIV>

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