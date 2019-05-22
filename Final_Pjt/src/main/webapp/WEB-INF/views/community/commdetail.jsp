<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="UTF-8">
<title>일정관리</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
<link rel="stylesheet" href="/js/bootstrap.js"/>
<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
<link rel="stylesheet" href="/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>

<!-- fullcalendar 관련 -->

<link rel="stylesheet" href="/css/scheduler/core/main.css"/>
<link rel="stylesheet" href="/css/scheduler/timegrid/main.css"/>
<link rel="stylesheet" href="/css/scheduler/daygrid/main.css"/>
<script src="/js/scheduler/core/main.js"></script>
<script src="/js/scheduler/interaction/main.js"></script>
<script src="/js/scheduler/daygrid/main.js"></script>
<script src="/js/scheduler/timegrid/main.js"></script>
<script src="/js/scheduler/resource-common/main.js"></script>
<script src="/js/scheduler/resource-daygrid/main.js"></script>
<script src="/js/scheduler/resource-timegrid/main.js"></script>


<script type="text/javascript">

$(document).ready(function() {
	
	var login = ${login}
	if(login == false) {
		$(".container").empty();
		var loninConfirm = confirm("로그인 후 이용해주세요");
		if(loninConfirm){
			location.href = "/login";
		} else {
			location.href = "/community";
		}
	}
	var recommend = ${isRecommend };
	
	if(recommend == true){
		$("#likeafter").show();
		$("#likebefore").hide();
	} else {
		$("#likebefore").show();
		$("#likeafter").hide();
	}

	
	
	/* 추천 */
	$("#likebefore").click(function() {

		var cal_no = ${calendar.calendar_no}
	    var user_id = "<%=(String)session.getAttribute("user_id")%>"
		
		$.ajax({
			type: "post"
			, url: "/community/recommend"
			, data: {
				"cal_no":cal_no,
				"user_id":user_id
				}
			, dataType: "text"
			, success: function(data){
				
				$("#likeafter").show();
				$("#likebefore").hide();
				
				$("#recommendCnt").empty();
				$("#recommendCnt").append(data);
				
			}
			, error: function(e) {
				alert("관심있는곳 설정에 실패했습니다. 다시 시도해주세요");
				console.log(e);
			}
		});
	});
	
	
	/* 추천 삭제  */
	$("#likeafter").click(function() {

		var cal_no = ${calendar.calendar_no}
	    var user_id = "<%=(String)session.getAttribute("user_id")%>"
	    
		$.ajax({
			type: "post"
			, url: "/community/recommendCancel"
			, data: {
				"cal_no":cal_no, 
				"user_id":user_id
				}
			, dataType: "text"
			, success: function(data){
				
				// 추천 값 변경
				$("#likeafter").hide();
				$("#likebefore").show();
				
				$("#recommendCnt").empty();
				$("#recommendCnt").append(data);
			}
			, error: function(e) {
				alert("추천 취소에 실패했습니다. 다시 시도해주세요");
				console.log(e);
			}
		});

	});
	

	$(".commentCount").append( $(".comment_row").length );	
	
	/* 댓글 등록 */
	$("#commentsubmit").click(function() {
		
		if($("#content").val() == ""){
			alert("댓글내용을 입력해주세요");
			return;
		} else {
			$("form").submit();
		}
	});
	
	$(".deleteComment").click(function() {

		var cal_no = ${calendar.calendar_no}
		var comment_no = $(this).attr('id');

		location.href = "/community/commentDelete?cal_no=" + cal_no + "&comment_no=" + comment_no;
		
	});
	
});
	
</script>
<script>

		
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var sch = ${s_list};
    
    console.log(sch);
    console.log(Object.keys(sch).length);
    
    for(var i=0; i<Object.keys(sch).length; i++){
    	sch[i];
    	console.log(sch[i]);
    }
    console.log("============");

    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
      defaultView: 'resourceTimeGridDay',
      defaultDate: '2019-05-20',
      editable: true,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
 
      views: {
        resourceTimeGridTwoDay: {
          type: 'resourceTimeGrid',
         
        }
      },
      
      resources:[
    	        {id: 'schedule', title: '하루일정', eventColer: '#827ffe'},
      ],
      
      events:sch
      
    	  
	       
    });
    
	console.log(sch)
    calendar.render();

	});

</script>
<style>
	.fc-time-grid-container{height:700px !important}
</style>

<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
<hr style="color:#ccc;">
	<div class="row row-offcanvas row-offcanvas-left" style="width: 1600px;">
	
		<div class="col-xs-12 col-sm-9">
			<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
				<h3 style="color: #827ffe;"> ${calendar.calendar_title } </h3>
				<div>
					<p style="margin-top: 25px;">
		            	<span style="font-size: 16px;">작성자 :  ${calendar.user_id }</span>
		            </p>
		            <p style="margin-top:10px; margin-bottom:0px;">
			            <span style="font-size: 16px">일정 진행일 :  ${calendar.calendar_scheduleDate }</span> 
			            <span style="font-size: 16px">캘린더 생성일 :  ${calendar.calendar_date }</span>
			            <span style="font-size: 16px; margin-left: 515px;">조회수 :  ${calendar.view_count }&nbsp;&nbsp;&nbsp;</span>
			            <span style="font-size: 16px;">추천수 :  <span id="recommendCnt">${calendar.up_count }</span></span>
			            <span>
			            	<button id="likebefore" style="border:none; display:none; background-color:white;">
			            	   <img src="/../../../img/recommend_before.png" style="width:30px; height: 30px; cursor:pointer; margin-bottom:10px;"/>&nbsp;
			            	</button>
			            	<button id="likeafter" style="border:none; display:none; background-color:white;">
			            	   <img src="/../../../img/recommend_after.png" style="width:30px; height: 30px; cursor:pointer; margin-bottom:10px;"/>&nbsp;
			            	</button>
			            </span>
		            </p>
		        </div>
	        </div>
	        <div>
		        <div id="calendar" class="fc fc-unthemd" style="float:left; width:45%" >
					
				</div>
				<div class="row row-offcanvas row-offcanvas-sidebar" style="float:right; width:55%">
				    <span style="margin-bottom:10px; font-size:16px;">총 댓글 수 <span class="commentCount"> </span></span>
					<table 	class="table table-striped table-hover" style="font-size:14px"> 
						<thead>
							<tr>
								<th style="width: 8%">번호</th>
								<th style="width: 16%">작성자 아이디</th>
								<th style="width: 35%">댓글내용</th>
								<th style="width: 18%">작성일시</th>
								<th style="width: 10%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${commentList }" varStatus="i">
								<tr class="comment_row">
									<td><c:out value="${i.count}" /> </td>
									<td>${list.user_id }</td>
									<td>${list.comment_content }</td>
									<td><fmt:formatDate value="${list.comment_date }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
									<td>
										<c:if test="${user_id eq list.user_id}">
											<button type="button" id="${list.comment_no }" class="btn btn-danger btn-sm deleteComment">삭제</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="/community/comment" method="post" style="margin-left: 30px;">
						<table class="container" style="margin-top:20px">
							<tr style="text-align:center;">
								<td colspan="3"><textarea id="content" class="content" name="content" style="width:515px; font-size:13px;"></textarea></td>
								<td colspan="4">
								<input type="hidden" name="cal_no" value="${calendar.calendar_no }" />
								<input type="hidden" id="user_id" name="user_id" value="${user_id }" />
								<button type="button" id="commentsubmit" class="btn btn-warning btn-mm" style="margin-left: 5px;">
								등록</button></td>	
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
