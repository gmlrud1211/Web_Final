<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btnList").click(
								function() {
									$(location).attr("href",
											"/admin/noticeboard/list");
								});
						$("#btnUpdate")
								.click(
										function() {
											$(location)
													.attr("href",
															"/admin/noticeboard/modify?notice_no=${view.notice_no }");
										});
						$("#btnDelete")
								.click(
										function() {
											$(location)
													.attr("href",
															"/admin/noticeboard/delete?notice_no=${view.notice_no }");
										});

					});
</script>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

td.info {
	border-bottom: 2px dotted grey;
	height: 50px;
}

.bt {
	background-color: #827ffe;
	color: white;
	font-size: 20px;
	border-style: none;
	border-radius: 5px;
}
</style>

<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
</div>

	<div id="menu" style="background-color: #d7d3d447; border-right:#D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

<div class="container" style="width: 60%; float: left;">
<br>
<h3 style="font-size:25px; padding: 30px; ">공지사항 목록</h3>
<br><br><br>

<div class="table" style="margin-left: 125px;">
	<table class="table table-bordered"
		style="border-bottom: 2px solid grey; border-top: 2px solid grey;">
		<tbody>

			<tr>
				<td class="info" style="width: 5%;">제목</td>
				<td class="info" style="width: 50%; margin: 0 auto;">${view.notice_title }</td>
				<td class="info" style="width: 7%;">조회 : ${view.notice_count }</td>
				<td class="info" style="width: 15%; margin-right: 5px;"><fmt:formatDate
						value="${view.notice_date }" pattern="yyyy-MM-dd" /></td>
			</tr>

			<tr>
				<td colspan="4" style="height: 300px;">
					<div>${view.notice_content }</div>
				</td>
			</tr>

		</tbody>
	</table>
	</div>

	<div style="height: 20px; width: 100%; padding: 30px 40%; padding-left: 46%;">

		<div class="text-center"
			style="height: 20px; width: 100%; margin: 0 atuo; ">
			<button class="btn bt" id="btnList">목록</button>
			<button class="btn bt" id="btnUpdate">수정</button>
			<button class="btn bt" id="btnDelete">삭제</button>
		</div>

	</div>

</div>

<div id="rightside" style="height: 100%; width: 20%; float: left;">
</div>















