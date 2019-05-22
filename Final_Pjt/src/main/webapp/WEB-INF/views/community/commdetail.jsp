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
	alert("추천을했나요??" + recommend);
	
	if(recommend == true){
		alert('true');
		$("#likeafter").show();
		$("#likebefore").hide();
	} else {
		alert('else');
		$("#likebefore").show();
		$("#likeafter").hide();
	}

	
	
	/* 즐겨찾기 추가 */
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
				
				console.log("data");
				console.log(data);

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
	
	
	/* 즐겨찾기 삭제  */
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
		
	<div class="row row-offcanvas row-offcanvas-right">
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
			            <span style="font-size: 16px; margin-left: 200px;">조회수 :  ${calendar.view_count }&nbsp;&nbsp;&nbsp;</span>
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
		        <div id="calendar" class="fc fc-unthemd" style="max-width:450px;" >
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
