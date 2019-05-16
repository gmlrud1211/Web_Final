<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


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

<div id="leftside" style="height: 100%; width: 20%; float: left;"></div>

<div class="container" style="width: 60%; float: left;">

	<h3>공지사항 상세보기</h3>

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

	<div style="height: 20px; width: 100%; padding: 30px 40%;">

		<div class="text-center"
			style="height: 20px; width: 100%; margin: 0 atuo;">
			<button class="btn bt" id="btnList">목록</button>
			<button class="btn bt" id="btnUpdate">수정</button>
			<button class="btn bt" id="btnDelete">삭제</button>
		</div>

	</div>

</div>

<div id="rightside" style="height: 100%; width: 20%; float: left;">
</div>















