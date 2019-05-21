<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function selectCal(calNo, calTitle, caldate) {
		
		var thisCalNo = calNo;
		var thisCalDate = caldate;
		var thisCalTitle = calTitle;
		var contentid = getParameterByName('contentId');
		var contenttypeid = getParameterByName('contentTypeId');
		
		alert(contentid);
		
		$(".selCal").hide();
		$(".schedule").show();
		
		$(".schedule #formSchedule h4 span").append("'" + thisCalTitle + "'");
		$(".schedule #formSchedule").append("<input type='hidden' id='calNo' name='calNo' value='" + thisCalNo + "'>");
		$(".schedule #formSchedule").append("<input type='hidden' id='contentid' name='contentid' value='" + contentid + "'>");
		$(".schedule #formSchedule").append("<input type='hidden' id='date' name='date' value='" + thisCalDate + "'>");
		$(".schedule #formSchedule").append("<input type='hidden' id='contentTypeId' name='contentTypeId' value='" + contenttypeid + "'>");
		
	}
	
	function btnReSelect() {
		$(".schedule").hide();
		$(".selCal").show();
	};
	
	function btnAddCal() {
		
		
		// ajax로 가즈아
		
		var schedule = $("#schedule").val();
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
        var calNo = $("#calNo").val();
        var contentid = $("#contentid").val();
        var contentTypeId = $("#contentTypeId").val();
        var date = $("#date").val();
		
        $.ajax({
			type: "post"
			, url: "/detail/addSchedule"
			, data: {
				"schedule":schedule,
				"startTime":startTime,
				"endTime":endTime,
				"calNo":calNo,
				"contentid":contentid,
				"contentTypeId":contentTypeId,
				"date":date
				}
			, dataType: "html"
			, success: function(data){
				
				$(".schedule #formSchedule").hide();
				$(".complete").show();
				
			}
			, error: function(e) {
				alert("일정추가에 실패했습니다. 다시 시도해주세요");
				console.log(e);
			}
		});
	}
	
	
	function goCal() {
        var calNo = $("#formSchedule #calNo").val();
        location.href = "/mypage/schedule?calendar_no=" + calNo;
	}
	
	function popupClose() {
	      $(".con").fadeOut();
	      $(".addCalbg").fadeOut();
	}
	
	
	/* 
	
    for (var i=0; i<=23; i++) {
    	for( var j=0; j<=60; j+=15){
    		console.log(i  + " : " + j);
    		
    		if(i<10){
    			i = "0" + i;
    		}
    		if(j<10){
    			j = "0" + j;
    		}
    		
    	}
    } */
   
</script>

<div class="addCalbg">
</div>

<div class="container con" >
	<p style="text-align:right">
	<button id="close" style="border:none; margin-left:400px; background-color:white;">
		<img src="/../../../img/close.png" class="" style="width:30px; height: 30px; cursor:pointer;"/>
	</button>
	</p>
	<div class="contatiner selCal">
		<h4 style="text-align:center; font-weight: 800;">일정을 추가할 캘린더를 선택하세요</h4>
		<br>
		<form id="calendarForm">
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
					
					<c:forEach var="list" items="${calList }" varStatus="i">
						<c:choose>
		                     <c:when test="${empty list or list eq 'null' or list eq ''}">
			                     <span style="font-size:15px; text-align:center;"> 등록된 캘린더가 없습니다. 캘린더를 먼저 생성해주세요! </span>
								 <button type="button" id="addCalendar" class="btn btn-primary" style="float:right"> + 새 캘린더 만들기</button>
		                     </c:when>
		                     <c:otherwise>
		                        <tr>
									<td>${list.calendar_no }</td>
									<td class="calTitle"><a href='javascript:void(0);' onclick="selectCal('${list.calendar_no}', '${list.calendar_title }', '${list.calendar_scheduleDate}')"> ${list.calendar_title} </a> </td> 
									<td class="date"><fmt:formatDate value="${list.calendar_scheduleDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
								</tr>
		                     </c:otherwise>
		                  </c:choose>	
					</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	
	<div class="contatiner schedule form-group" style="display:none;">
		<form id="formSchedule" action="/detail/addSchedule"  method="post" onsubmit="return false;">
			<h4 style="text-align:center; font-weight: 800;"> <span> </span> 에 <br> 추가할 일정정보를 입력해주세요</h4>
			<table>
			
				<tr>
					<c:forEach var="list" items="${commonList }" varStatus="i">
						<td>
							<div class="col-xs-12" style="margin-left:15px; width: 97%; padding: 16px;" >
								<input class="form-control" type="text" id="schedule" name="schedule"  value="${list.title }" >
							</div>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<td>
						<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:15px">
							<select id="startTime" name="startTime" class="form-control">
									<option value="" selected="selected">일정시작시간</option>
									<option value="1000">10:00</option>
									<option value="1100">11:00</option>
									<option value="1200">12:00</option>
							</select>
						</div>
						<div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:2px">
							<select class="form-control" name="endTime" id="endTime">
								<option value="" selected="selected">일정종료시간</option>
								<option value="1000">10:00</option>
								<option value="1100">11:00</option>
								<option value="1200">12:00</option>
							</select>
						</div>
					</td>				
				</tr>
			</table>
			<div style="margin-top:40px; text-align:center;">
				<button onclick='btnAddCal()' id="registSchedule" class="btn btn-primary btn-mm"> 일정등록 </button>
				<button onclick='btnReSelect()' id="ReSelCal" class="btn btn-warning btn-mm"> 다른캘린더 선택 </button>
			</div>
		</form>
	</div>
	
	
	<div class="contatiner complete form-group" style="display:none; text-align:center"">
	    
	    <div style="padding:10px;">
	    	<img src="/../../../img/checked.png" class="" style="width:60px; height: 60px;"/>&nbsp;
		</div>
		<b>
			<p style="font-size:20px; padding:14px;">
				일정을 등록하였습니다.
				바로 캘린더를 확인하실래요?
			</p>
		</b>
		
		<div style="margin-top:15px; text-align:center; padding:10px">
			<button onclick='goCal()' id="goCal" class="btn btn-primary btn-mm"> 캘린더보기 </button>
			<button onclick='popupClose()' id="popupClose" class="btn btn-warning btn-mm"> 핫플계속보기 </button>
		</div>
		
	</div>
	
</div>