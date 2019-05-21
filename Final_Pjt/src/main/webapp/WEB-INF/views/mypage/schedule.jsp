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
<script src="/js/scheduler/core/ko.js"></script>
<script src="/js/scheduler/interaction/main.js"></script>
<script src="/js/scheduler/daygrid/main.js"></script>
<script src="/js/scheduler/timegrid/main.js"></script>
<script src="/js/scheduler/resource-common/main.js"></script>
<script src="/js/scheduler/resource-daygrid/main.js"></script>
<script src="/js/scheduler/resource-timegrid/main.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var sch = ${s_list};
    
    console.log(sch);
    
    for(var i=0; i<Object.keys(sch).length; i++){
    	sch[i];
    	console.log(sch[i]);
    }
    console.log("============");
       
	console.log(sch[0].start);    

   
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'resourceDayGrid', 'resourceTimeGrid' ],
      defaultView: 'resourceTimeGridDay',
      defaultDate: sch[0].start,
      lang : 'ko',
      editable: true,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
 
      views: {
        resourceTimeGridTwoDay: {
          type: 'resourceTimeGrid',
         
        }
      },
      
      resources:[
    	        {id: 'schedule', title: '하루일정', eventColor: '#827ffe', eventTextColor : 'white' },
      ],
      
      events:sch,
//     	  [
//     	  {no: "1", resourceId: 'schedule', start: "13:30:00.0", end: "14:30:00.0", title: "플레이케이팝"}
//     	  , {no: "2", resourceId: 'schedule', start: "16:00:00.0", end: "17:30:00.0", title: "마노르블랑 수국축제"}
//     	  , {no: "3", resourceId: 'schedule', start: "18:00:00.0", end: "19:30:00.0", title: "저녁-흑돼지"}
//     	  , {no: "5", resourceId: 'schedule', start: "20:00:00.0", end: "23:59:00.0", title: "숙소로"}
//       ]
    
      //일정 삭제시 이벤트
      eventClick : function(calEvent){
    	console.log(calEvent.event._def.extendedProps.no);
    	if(!confirm("일정["+calEvent.event.title+"]를 정말로 삭제하시겠습니까?"))
    		{	return false;	}
    	
    	$.ajax({
    		type : 'post',
    		url : "/mypage/schedule/delete",
    		data : {schedule_no : calEvent.event._def.extendedProps.no},
    		cache : false,
    		async : false,
    		dataType: "json",
    		success : function(result){
        		if(result.result == 1 ){
        			alert("삭제되었습니다.");
        		}
    			location.reload();
    		}
    	})
   	 },
   	 
   	 //일정 시간수정 이벤트
   	 eventResize : function(calEvent){
   		console.log(calEvent);
   		
   		var no = calEvent.event._def.extendedProps.no;
   		var start = (new Date(calEvent.event.start).format("yyyy-MM-dd hh:mm:ss"));
   		var end = (new Date(calEvent.event.end).format("yyyy-MM-dd hh:mm:ss"));
   		
   		console.log(start);
   		console.log(end);

   		
   		$.ajax({
   			type: "post",
   			url : "/mypage/schedule/update",
   			data : {schedule_no: no ,schedule_startTime: start, schedule_endTime : end },
   			dataType : "json",
   			success : function(data){
				location.reload();
   			}
   		})
   		
   	 }
   	 
    });
    
    //캘린더 그려줌
    calendar.render();
  });


	//날짜 변환함수
	Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 24) ? h : 24).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	
</script>



<script type="text/javascript">
	//공개여부 설정
	$(document).ready(function() {
		
		//공개여부따라서 공개/비공개 설정 버튼 다르게 띄움
		var isOpen = ${isOpen};

		if(isOpen == 1) {
			$("#btnOpen").hide();
			$("#btnNotOpen").show();
			
		} else {
			$("#btnOpen").show();
			$("#btnNotOpen").hide();
		}
	
			
		var calendar_no = ${calendar_no};

		//공개로 설정 버튼 클릭시 
		$("#btnOpen").click(function() {
			
			var type = "YES";

			$.ajax({
				type : "post",
				url : "/mypage/calendarChange",
				data : {"calendar_no":calendar_no, "type":type},
				dataType : "json",
				success : function(data){
					$("#btnOpen").hide();
					$("#btnNotOpen").show();
					alert("공개로 변경 되었습니다.");
					location.reload();
				},
				error : function(e){
					console.log(e);
				}
					
			});
			
		})
		
		//비공개로 설정 버튼 클릭시 
		$("#btnNotOpen").click(function() {
			
			var type = "NO";

			$.ajax({
				type : "post",
				url : "/mypage/calendarChange",
				data : {"calendar_no":calendar_no, "type":type},
				dataType : "json",
				success : function(data){
					$("#btnOpen").show();
					$("#btnNotOpen").hide();
					alert("비공개로 변경 되었습니다.");
					location.reload();
				},
				error : function(e){
					console.log(e);
				}
					
			});
			
		})
		
	});

</script>

<style>
	.fc-time-grid-container{height:700px !important}
</style>

<script type="text/javascript">
		
	$(document).ready(function() {
		//캘린더 등록
		$("#btnAdd").click(function() {
			$(".con").fadeIn();
			$(".addCalbg").fadeIn();
		});

		$("#calclose").click(function() {
			$(".con").fadeOut();
			$(".addCalbg").fadeOut();
		});

		$("#calAdd").click(function() {
			$("#calendarForm").submit();
			$(".con").fadeOut();
			$(".addCalbg").fadeOut();
			alert("캘린더가 등록되었습니다~!");
		});

		//캘린더 수정
		$("#btnUpdate").click(function() {
			$(".upCon").fadeIn();
			$(".upCalbg").fadeIn();
		});

	});
</script>

<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="container">
	<hr style="color:#ccc;">
			
		<div class="row row-offcanvas row-offcanvas-right">
		<jsp:include page="../layout/mypage.jsp"/>
	
			<div class="col-xs-12 col-sm-9">
				<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
					<h3>MyPage-ScheduleList<h3>
		            <p style="font-size: 16px">나만의 일정을 만들어 보세요~!</p>
		        </div>
		        
		        <div style="padding-left:5%;">
					<div style="max-width:800px;">
						<b>캘린더 제목</b> : ${calendar_title } &nbsp;&nbsp;&nbsp;&nbsp;
						<b>캘린더 날짜</b> : <fmt:formatDate value="${calendar_date }" pattern="yyyy-MM-dd"/>  &nbsp;&nbsp;&nbsp;&nbsp;
						<b>공개 설정</b> : 
						<button type="button" id="btnNotOpen" class="btn btn-sm" style="background-color:#827ffe; color: white;">비공개로 변경</button>
						<button type="button" id="btnOpen" class="btn btn-sm" style="background-color:#827ffe; color: white;">공개로 변경</button>
						<br><br><br>
						<img src="/img/exclamation2.png"/> 삭제를 원하시면 일정을 한번 클릭해주세요<br><br>
						<img src="/img/exclamation2.png"/> 시간 수정을 원하시면 위아래로 이동하거나 칸을 조절해보세요<br>
					</div>
					<br>
			        <div id="calendar" class="fc fc-unthemd" style="max-width:630px;" >
						<!-- 캘린더 영역 -->
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
