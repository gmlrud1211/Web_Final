<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
			var boardno = $(this).children("td").eq(0).text();
			$(location).attr("href", "/noticeboard/view?notice_no=" + notice_no);
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
	height: 40px;
	border-bottom: 2px solid grey;
	border-top: 2px solid grey;
}

th, td:not (:nth-child(2) ) {
	text-align: center;
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


<div id="content"
	style="width: 1000px; margin-right: auto; 
	
        margin-left: auto; height: 100%;">
    
    <p style="text-align:left; color:#827ffe; font-size:25px"> 공지사항 </p>
		<p style="text-align:left; margin-top:15px; margin-bottom: 40px;"> 공지사항입니다 :) </p>

	<table class="table table-hover table-striped table-condensed">
		<thead>
			<tr style="border-top: 2px solid grey;">
				<th style="width: 10%; border-top: 2px solid grey;">번호</th>
				<th style="width: 25%; border-top: 2px solid grey;">제목</th>
				<th style="width: 10%; border-top: 2px solid grey;">조회수</th>
				<th style="width: 10%; border-top: 2px solid grey;">작성일</th>
			</tr>
		</thead>

		<tbody>
		  <c:set var="pageCnt" value="${pageCnt }"/>
		    <%
		    String p = pageContext.getAttribute("pageCnt").toString();
		    int pa = Integer.parseInt(p);
		    %>
			<c:forEach items="${nboardlist }" var="list">
				<tr>
					<td><%=pa-- %></td>
					<td><a href="/noticeboard/view?notice_no=${list.notice_no }">${list.notice_title }</a></td>
					<td>${list.notice_count }</td>
					<td><fmt:formatDate value="${list.notice_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div style="margin: 20px;">
		<jsp:include page="/WEB-INF/views/layout/usernoticeboardpaging.jsp" />
	</div>



	<div style="height: 20px;  padding: 10px 350px; claer: both;">
		<div class='text-center'
			style="height: 20px; width: 100%;width: 300px;  margin: 0 atuo;">
			<FORM method='get' action='/noticeboard/list'>
				<SELECT name='search'>
					<!-- 검색 컬럼 -->
					<OPTION id="notice_title" value='notice_title'>제목</OPTION>
					<OPTION id="notice_content" value='notice_content'>본문 내용</OPTION>

				</SELECT> <input type='text' name='word' style="border:1px solid grey;"placeholder="특수문자는 사용할수 없습니다.">
				<button class="search" id="searchBtn ">검색</button>

			</FORM>
		</DIV>
	</div>
</div>




