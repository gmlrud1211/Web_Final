<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>calendar List</title>

		<!-- jQuery 2.2.4 -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
		<link rel="stylesheet" href="/js/bootstrap.js"/>
		<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
		<link rel="stylesheet" href="/css/bootstrap.css"/>
		<link rel="stylesheet" href="/css/bootstrap.min.css"/>
		
		<script type="text/javascript">
		
			$(document).ready(function() {
				$("#btnAdd").click(function(){
					$(".con").fadeIn();
					$(".addCalbg").fadeIn();
				});
				
				$("#calclose").click(function(){
					$(".con").fadeOut();
					$(".addCalbg").fadeOut();
				});
				
				$("#calAdd").click(function(){
					$("#calendarForm").submit();
					$(".con").fadeOut();
					$(".addCalbg").fadeOut();
					alert("캘린더가 등록되었습니다~!");
				});
			});
			
		</script>
		
		<style>
		.addCalbg {
			position : fixed;
			top: 0px;
			left : 0px;
			width : 100%;
			height : 100%;
			display : block;
			background : RGBA(0,0,0,0.5);
			display : none;
		}
		.con {
			position :absolute;
			top : 50%;
			left : 50%;
			width : 500px;
			height : 390px;
			background : #FFF;
			transform : translateX(-50%) translateY(-50%); 
			z-index : 999;
			display : none;
		}
		</style>
		
		
	</head>

	<body>
		<div class="container">
			<h3>calendarList</h3>
			
			<form id="calendarForm">
				<table class="table table-striped table-hover"> 
					<thead>
						<tr>
							<th style="width: 10%">번호</th>
							<th style="width: 45%">캘린더 제목</th>
							<th style="width: 20%">캘린더 진행일</th>
							<th style="width: 15%">공개여부</th>
							<th style="width: 10%">삭제</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${calendarList }" var="cal">
						<tr>
							<td>${cal.calendar_no }</td>
							<td><!-- <a href="#"> -->${cal.calendar_title }</td>
							<td><fmt:formatDate value="${cal.calendar_scheduleDate }" pattern="yyyy-MM-dd"/></td>
							<td>${cal.calendar_yesno }</td>
							<td><a href="/mypage/calRemove?calendar_no=${cal.calendar_no }">삭제</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			
			</form>
		
			<div class="text-center">
				<button id="btnAdd" class="btn btn-primary" style="float:right">캘린더 등록</button>
			</div>
			
		</div>
		
		<!-- 캘린더 등록하는 form 띄우는 창 -->
		<div class="addCalbg"> 
		</div>
		<div class="container con" >
			<br>
			<h5 style="text-align:center;">캘린더를 만들어보세요~!_!~</h5>
			<br>
			<form id="calendarForm" action="/mypage/calendar" method="post">
				<div class="form-group">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="calendar_title">캘린더 제목</label>
					<div class="col-sm-13">
						<input class="form-control" type="text" id ="calendar_title" name="calendar_title" placeholder="캘린더 제목을 입력해주세요"/>
					</div>
				</div>	
				<div class="form-group">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="calendar_scheduleDate">캘린더 진행날짜</label>
					<div class="col-sm-13">
						<input class="form-control" type="date" id ="calendar_scheduleDate" name="calendar_scheduleDate"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 col-sm-offset-1 control-label" for="calendar_yesno">캘린더 공개여부</label>
					<input type ="radio" name="calendar_yesno" value="YES" checked="checked">YES &nbsp;
      				<input type ="radio" name="calendar_yesno" value="NO">NO
				</div>
				
				
				<div class="text-center">
					<button id="calAdd" class="btn btn-success" style="float:right">등록</button> &nbsp;&nbsp;
					<button type="button" id="calclose" class="btn btn-danger" style="float:right">취소</button>
				</div>
			
			</form>
		</div>
				
	</body>
</html>