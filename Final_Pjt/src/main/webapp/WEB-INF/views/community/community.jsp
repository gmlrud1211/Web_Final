<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 

<!-- <!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container" style="padding: 60px;" >
		<p style="text-align:left; color:#827ffe; font-size:25px"> 일정공유게시판 </p>
		<p style="text-align:left; margin-top:15px; margin-bottom: 40px;"> 마이페이지에서 공개설정한 다른 회원들의 캘린더입니다 :) </p>
		<div class="contatiner selCal">
			<div class="form-group">
				<table class="table table-striped table-hover" id="calTbl"> 
					<thead>
						<tr>
							<th style="width:10%">번호</th>
							<th style="width:10%">회원 아이디</th>
							<th style="width:*">캘린더 제목</th>
							<th style="width:15%">캘린더 진행일</th>
							<th style="width:15%">캘린더 생성일</th>
							<th style="width:10%">추천수</th>
							<th style="width:10%">조회수</th>
						</tr>
					</thead>
					<tbody>
					<!-- 베스트 추천영역 -->
						<c:forEach var="best" items="${bestCalList }" varStatus="i">
							<tr style="background-color:beige;">
								<td>베스트 캘린더</td>
	                        	<td>${best.USER_ID }</td>
								<td><a href="/community/detail?calNo=${best.CALENDAR_NO}"}>${best.CALENDAR_TITLE }</a></td>
								<td><fmt:formatDate value="${best.CALENDAR_SCHEDULEDATE }" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${best.CALENDAR_DATE }" pattern="yyyy-MM-dd" /></td>
								<td style="margin-left:3px">${best.UP_COUNT}</td>
								<td style="margin-left:3px">${best.VIEW_COUNT}</td>
							</tr> 
						</c:forEach> 
						<c:forEach var="list" items="${calendarList }" varStatus="i">
	                        <tr>
	                        	<td>${list.ROWNUM }</td>
	                        	<td>${list.USER_ID }</td>
								<td><a href="/community/detail?calNo=${list.CALENDAR_NO }">${list.CALENDAR_TITLE }</a></td>
								<td><fmt:formatDate value="${list.CALENDAR_SCHEDULEDATE }" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${list.CALENDAR_DATE }" pattern="yyyy-MM-dd" /></td>
								<td style="margin-left:3px">${list.UP_COUNT }</td>
								<td style="margin-left:3px">${list.VIEW_COUNT }</td>
							</tr>
						</c:forEach>
						</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>