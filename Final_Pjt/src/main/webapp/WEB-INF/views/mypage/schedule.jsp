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
      
    	  
//     	  [
//     	  {no: "1", resourceId: 'schedule', start: "13:30:00.0", end: "14:30:00.0", title: "플레이케이팝"}
//     	  , {no: "2", resourceId: 'schedule', start: "16:00:00.0", end: "17:30:00.0", title: "마노르블랑 수국축제"}
//     	  , {no: "3", resourceId: 'schedule', start: "18:00:00.0", end: "19:30:00.0", title: "저녁-흑돼지"}
//     	  , {no: "5", resourceId: 'schedule', start: "20:00:00.0", end: "23:59:00.0", title: "숙소로"}
//       ]
    	  
    	  
// 	  [
	  
//    	 { id: '2', resourceId: 'schedule', start: "2019-05-20 17:00:00", end: '2019-05-20 18:00:00', title: 'event 2' },
//    	 { id: '1', resourceId: 'schedule', start: "2019-05-20 15:00:00", end: '2019-05-20 16:00:00', title: 'event 1' }
//]

	       
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
	<jsp:include page="../layout/mypage.jsp"/>

		<div class="col-xs-12 col-sm-9">
			<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
				<h3>ScheduleList<h3>
	            <p style="font-size: 16px">나만의 일정을 만들어 보세요~!</p>
	        </div>
	        <div>
		        <div id="calendar" class="fc fc-unthemd" style="max-width:450px;" >
					
				</div>
				<div>
					공개여부 설정<!--  <button></button> -->
				</div>
			</div>
		</div>
	</div>
</div>
</body>
