<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>    


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		$(location).attr("href", "/admin/noticeboard/list");
	});
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/admin/noticeboard/modify?notice_no=${view.notice_no }");
	});
	$("#btnDelete").click(function() {
		$(location).attr("href", "/admin/noticeboard/delete?notice_no=${view.notice_no }");
	});
	
});
</script>


<div class="container">

<h3>공지사항 상세보기</h3>
<hr>

<div>
<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td>${view.notice_no }</td>
<td class="info">제목</td><td colspan="2">${view.notice_title }</td>
</tr>

<tr><td class="info">본문</td><td>${view.notice_content }</td></tr>
<tr><td class="info">조회수</td><td>${view.notice_count }</td></tr>

<tr><td class="info">작성일</td><td colspan="4">${view.notice_date }</td></tr>

</table>
</div>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

 
</div>

















