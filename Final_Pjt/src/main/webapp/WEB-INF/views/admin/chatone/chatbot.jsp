<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <!-- jQuery 2.2.4 --> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->

<!-- <!-- 부트스트랩 3.3.2 --> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<style type="text/css">

#resultChatBot1.ul.li{
	background:#F5ECCE;
}

#resultChatBot2.ul.li{
	background:#E0F8E0;
}

.content1{
	background:#F7F2E0;
}

.content2{
	background:#E0F8E0;
}

</style>


<script type="text/javascript">

$(document).ready(function(){
	
	var floatPosition = parseInt($("#floatChat").css('top'));
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop()
		var newPosition = scrollTop + floatPosition + "px";
		
// 		$("#floatChat").css('top',newPosition);
		
		$("#floatChat").stop().animate({
			"top" : newPosition
		}, 500);
		
	}).scroll();
});


/* 챗봇창 띄우기 */
$(document).ready(function(){
	
// 	$("#floatChat").mouseenter(function(){
// 		$("#floatChat").append(
// 				"<ul class=\"nav nav-pills\">"
// 				+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
// 				+"챗봇 클릭!"
// 				+"</li>"
// 				+"</ul>"
// 		);
// 	}).mouseleave(function(){
// 		$("#floatChat.ul").empty();
// 	})
	
	
	/* 메시지 전송,답변 */
	$("#btnChatBotSend1").click(function(){
		
		$.ajax({
			type: "post"
			, url: "/chatAjax"
			, data: $("#chatBot1").serialize()
			, dataType: "json"
			, success: function( data ){
				
				console.log("채팅글 전송 성공!")
				console.log(data);
				console.log(data.login);
				console.log(data.content1);
				console.log(data.userid);
				console.log(data.reply);
				console.log(data.reply.length);
				console.log(scrollMessage());
				
				var html = "";
				var beforeChat = $("#resultChatBot1").html();
				
				if(true){
					
					html =
						beforeChat
						+"<ul class=\"nav nav-pills\">"
						+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px; max-width:530px;\">"
						+"<div style=\"text-align:right; margin:5px; width:auto;\">"
						+data.userid+" : "
						+data.content1
						+"</div>"
						+"</li>"
						+"</ul>"
						+"<ul class=\"nav nav-pills\">"
						+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
						+"<div style=\"text-align:left; margin:10px; width:auto;\">";
						
						if(data.reply=="올바른 메시지를 보내주세요!"){
							
							html += data.reply;
							
						} else if(data.reply=="조회된 결과가 없습니다."){
							
							html += data.reply;
							
						} else{
							
							html += "<div style=\"margin:10px;\">["
								+data.content1
								+"]&nbsp;에 대한 답변입니다.<br>"
								+"</div>";
							
							for(i=0;i<data.reply.length;i++){
								
								html += 
									"<ul class=\"nav nav-pills\">"
									+"<li onclick=\"clickS"+data.reply[i].sChat_no+"()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
									+data.reply[i].sChat_no+".&nbsp"+data.reply[i].sChat_name
									+"</li>"
									+"</ul>"
									+"<br>"
							}
						}
						+"</div>"
						+"</li>"
						+"</ul>";	
//							+"<div id=\"chatBottom2\"></div>"
						
					
					$("#resultChatBot1").html(html)
					
					scrollMessage();
					
				} else{
					$("#resultChatBot1").html(
							"<div style=\"text-align:right; \">"
							+"로그인이 필요합니다.<br>"
							+"</div><br>"
					)
				}
				
				//""안에 ""넣으려면 \"로 쓰던가, 겉에 '쓰고 안에 " 쓰면 된다
				
// 				for(i=0; i<data.length; i++){
					
// 					$("#resultChatBot1").html(
// 						"<h3>"+data.content1+"</h3>"
// 						+beforeChat
// 					);
// 				}
				
				//전송버튼 클릭 시 제일 하단 메시지로 이동(스크롤기능없이 바로이동)
// 				location.href="#chatBottom";
				//기본으로 789값 받고 그뒤로 왔다갔다해서 그냥 안함
// 				var scrollPosition = $("#chatBottom").offset().top;
				//scrollMessagePosition값을 큰 수로 지정해놓으면 id가 scrollMessagetest인 div의 scrollMessagePosition y축까지 계속 스크롤됨
				scrollMessage();
				
				//전송버튼 클릭 시 남아있는 input태그 글 삭제
// 				$("#content1").remove();
			}
			, error: function(e){
				console.log("실패");
				console.log(e);
			}
			
		})
		
		
		//메시지 전송 시 input태그 입력값 초기화
		$("#content1").val("");
		
	});
	
	/* 엔터키 */
	$("#btnChatBotSend1").keypress(function(event){
		if(event.which==13){
			$("#btnChatBotSend1").click();
		}
	});
	
	/* 채팅기록 전체삭제 */
	$("#refresh1").click(function(){
		
		$("#resultChatBot1").empty().animate(0,500);
		$("#resultChatBot1").append("<div class=\"text-center \"style=\"margin:0 auto;\"><h1>삭제완료</h1></div>");
		setTimeout(function(){$("#resultChatBot1").empty();},1000);
	});
	
// 	$("#modalChatBot").modal({backdrop: 'static'});
	
	/* 챗봇버튼1 */
	$("#btnChatBot1").click(function(){
		$("#modalChatBot").modal('show');
		$("#modal1on1Chat").modal('hide');
	})
	
	/* 1대1채팅 버튼1 */
	$("#btn1on1Chat1").click(function(){
		$("#modalChatBot").modal('hide');
		$("#modal1on1Chat").modal('show');
	})
	
	/* 챗봇버튼2 */
	$("#btnChatBot2").click(function(){
		$("#modalChatBot").modal('show');
		$("#modal1on1Chat").modal('hide');
	})
	
	/* 1대1채팅 버튼2 */
	$("#btn1on1Chat2").click(function(){
		$("#modalChatBot").modal('hide');
		$("#modal1on1Chat").modal('show');
	})
	
	/* 챗봇 나가기1 */
	/* 자동새로고침 0.2초로 설정 */
	$("#btnChatBotOver1").click(function(){
		$("#modalChatBot").modal('hide');
		setTimeout(function(){
			location.reload();
		}, 100);
	})
	
	/* 챗봇 나가기2 */
	/* 자동새로고침 0.2초로 설정 */
	$("#btnChatBotOver2").click(function(){
		$("#modal1on1Chat").modal('hide');
		setTimeout(function(){
			location.reload();
		}, 100);
	})

});


/* -----------------------------메시지 추가 시 자동scrollMessage기능-------------------------- */

//메시지 추가 시 자동 scrollMessage을 위한 scrollMessagePosition 초기값
var i = 10000;

function scrollMessage(){
// 	초기값 100으로 설정, ajax동작시마다 +100됨
	var scrollPosition = i; 
	console.log(scrollPosition)
	$("#scrollMessagetest1").stop().animate({
		scrollTop: scrollPosition
	}, 2500);
	i+=10000;
}

</script>

</head>
<body>


	<!------------------- 챗봇 구현부분 ------------------->
	<div id="floatChat" style="float:right; margin:5%; top:700px; right:50px; position:absolute;" data-toggle="tooltip" data-placement="left" title="클릭하면 챗봇이 열립니다">
		<form style="zoom:5; cursor:pointer;" data-toggle="modal" data-target="#modalChatBot">
			<span>채팅방 열기</span>
		</form>
	</div>
	
	<div class="modal fade" id="modalChatBot" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg">
	  <h2 style="color:white;">[Chat Bot]
	  <div class="btn-group" data-toggle="buttons-radio" style="float:right; position:relative;">
			  <button type="button" id="btnChatBot1" class="btn btn-warning" data-target="#modalChatBot">챗봇</button>
			  <button type="button" id="btn1on1Chat1" class="btn btn-success" data-target="#modal1on1Chat">1대1문의</button>
	  </div>
	  </h2>   
	    <div class="modal-content" style="height:650px; background:#F7F2E0;">
	    	
	    	
		    <div id="scrollMessagetest1" style="position:relative; overflow:auto; height:600px; margin:10px;">
		    

		    	<!-- 질문목록 띄우기 -->
		      	<form id="btnXChatList" style="margin:20px; cursor:pointer;">
		      		<span class="glyphicon glyphicon-list" style="zoom:2; aria-hidden="true"></span>
		      	</form>
		      	<div id="resultChatBotList" style="margin:10px; display: none;">
		      	
		      	</div>
		      	
		    	<!-- 채팅기록 보여주기 -->
		        <div id="resultChatBot1" data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
	
		        </div>
		        
		        <!-- 채팅내역 사라지게 하기 -->
		        <div id="refresh1" style="position:relative; float:right; bottom:0px; cursor:pointer">
		        	<span class="glyphicon glyphicon-remove" aria-hidden="true">전체삭제</span>
		        </div>
		        
		        <!-- 채팅전송 시마다 가장 밑에있는 채팅 보여주기 위해 div 추가 -->
		        <div id="chatBottom1"></div>
	        </div>
	  </div><hr>
	    
	    <form id="chatBot1" name="chatBot1" style="width:1828px;">
			<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <h2>#</h2>
			      </span>
			      <input type="text" id="content1" name="content1" class="form-control" style="height:100px;" placeholder="#회원가입 #챗봇 #캘린더"/>

			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		</form>
		<button id="btnChatBotSend1" class="btn btn-default" style="float:right">전송</button>
		<button id="btnChatBotOver1" class="btn btn-warning" style="float:right">나가기</button>
	    
	  </div>
	</div>
	
	<jsp:include page="/WEB-INF/views/chat/chat_1on1.jsp"/>


</body>
</html>