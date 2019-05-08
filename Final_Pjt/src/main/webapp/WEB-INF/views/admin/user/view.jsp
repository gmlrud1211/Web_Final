<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <jsp:include page="/view/layout/header.jsp" /> --%>
<style>
nav{display: none}
</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		$(location).attr("href", "/users/userslist");
	});
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/board/update?nb_no=${nboardView.nb_no }");
	});
	$("#btnDelete").click(function() {
		$(location).attr("href", "/board/delete?nb_no=${nboardView.nb_no }");
	});
	
	$("#btnBack").click(function() {
		$(this).close();
	});
});
</script>


<div class="container">
<h3>회원 정보</h3>
<hr>

<div>
 
<table class="table table-bordered">
<tr><td class="info">회원번호</td><td>${usersview.user_no }</td></tr>
 
<tr><td class="info">아이디</td><td>${userview.user_id}</td></tr>
<tr><td class="info">패스워드</td><td>${userview.user_pw }</td></tr>
<tr><td class="info">이름</td><td>${userview.user_name }</td></tr>
<tr><td class="info">전화번호</td><td>${userview.user_phone }</td></tr>
<tr><td class="info">이메일</td><td>${userview.user_email }</td></tr>
<tr><td class="info">생년월일</td><td>${userview.user_birth}</td></tr>
<tr><td class="info">가입일</td><td>${userview.user_regdate }</td></tr>
</table>

	<button id="btnBack" onclick="window.close()" style="margin-left: 42%;" > 닫기 </button>

</div>
</div>


















