<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="addCalbg"> 
</div>

<div class="container con" >
	<button id="close" style="border:none; background-color:white;">
		<img src="/../../../img/close.png" class="" style="width:30px; height: 30px; cursor:pointer;"/>
	</button>
	<h4 style="text-align:center;">일정을 추가할 캘린더를 선택하세요</h4>
<br>
<form id="calendarForm" action="/mypage/calendar" method="post">
	<div class="form-group">
		<table class="table table-striped table-hover" id="calTbl"> 
			<thead>
				<tr>
					<th style="width:15%">번호</th>
					<th style="width:*">캘린더 제목</th>
					<th style="width:30%">캘린더 진행일</th>
				</tr>
			</thead>
			<tbody>
				<!-- html append area -->
			</tbody>
		</table>
	</div>
</form>

<button type="button" id="addCalendar" class="btn btn-primary" style="float:right"> + 새 캘린더 만들기</button>
</div>