<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#btnChatBotSend2').on('click', function(evt){
		
		evt.preventDefault();
		
		console.log("버튼클릭");
		
		if(socket.readyState != 1 || socket.readyState == null) return;
		
		let content2 = $('input#content2').val();
		socket.send(content2);
		
		//메시지 전송 시 input태그 입력값 초기화
		$("#content2").val("");
	});
	connect();
});

var socket = null;

function connect(){
	var ws = new WebSocket("ws://localhost:8089/replyEcho");
	socket = ws;

	//event handler Connection, 소켓 연결 됬을 때
	ws.onopen = function(){
		console.log('Info: connection opened.');
		
	};

	ws.onmessage = function(event){
		console.log("ReceiveMessage: ", event.data+'\n');
		
		var html = "";
		var beforeChat = $("#resultChatBot2").html();
		
		if(true){
			
			html =
				beforeChat
				+"<ul class=\"nav nav-pills\">"
				+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px; max-width:530px;\">"
				+"<div style=\"text-align:right; margin:5px; width:auto;\">"
				+event.data
				+"</div>"
				+"</li>"
				+"</ul>";	
//					+"<div id=\"chatBottom2\"></div>"
				
			$("#resultChatBot2").html(html)
			
			scrollMessage2();
			
		}
	};

	ws.onclose = function (event) {
		console.log('Info: connection closed.');
		setTimeout( function(){ connect();}, 1000); // retry connection!!
	
	};
	ws.onerror = function (err) { console.log('error: ', err);};
}

/* -----------------------------메시지 추가 시 자동scrollMessage기능-------------------------- */

// 메시지 추가 시 자동 scrollMessage을 위한 scrollMessagePosition 초기값
var i = 10000;

function scrollMessage2(){
//	초기값 100으로 설정, ajax동작시마다 +100됨
	var scrollPosition = i; 
	console.log(scrollPosition)
	$("#scrollMessagetest2").stop().animate({
		scrollTop: scrollPosition
	}, 2500);
	i+=10000;
}


</script>
</head>
<body>
 
<div class="modal fade" id="modal1on1Chat" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg">
	  <h2 style="color:white;">[Chat Bot]
	  <div class="btn-group" data-toggle="buttons-radio" style="float:right; position:relative;">
			  <button type="button" id="btnChatBot2" class="btn btn-warning" data-target="#modalChatBot">챗봇</button>
			  <button type="button" id="btn1on1Chat2" class="btn btn-success" data-target="#modal1on1Chat">1대1문의</button>
	  </div>
	  </h2>   
	    <div class="modal-content" style="height:650px; background:#E0F8E0;">
	    	
	    	
	    	
		    <div id="scrollMessagetest2" style="position:relative; overflow:auto; height:600px; margin:10px;">
		    
		      	
		    	<!-- 채팅기록 보여주기 -->
		        <div id="resultChatBot2" data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
	
		        </div>
		        
		        <!-- 채팅내역 사라지게 하기 -->
		        <div id="refresh2" style="position:relative; float:right; bottom:0px; cursor:pointer">
		        	<span class="glyphicon glyphicon-remove" aria-hidden="true">전체삭제</span>
		        </div>
		        
		        <!-- 채팅전송 시마다 가장 밑에있는 채팅 보여주기 위해 div 추가 -->
		        <div id="chatBottom2"></div>
	        </div>
	  </div><hr>
	    
	    <form id="chatBot2" name="chatBot2" style="width:1828px;">
			<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <h2>#</h2>
			      </span>
			      <input type="text" id="content2" name="content2" class="form-control" style="height:100px;" placeholder="보낼 메세지를 입력하세요"/>

			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		</form>
		<button id="btnChatBotSend2" class="btn btn-default" style="float:right">전송</button>
		<button id="btnChatBotOver2" class="btn btn-warning" style="float:right">나가기</button>
	    
	  </div>
	</div>

</body>
</html>