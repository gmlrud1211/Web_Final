<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#btnSend').on('click', function(evt){
		
		evt.preventDefault();
		
		console.log("버튼클릭");
		
		if(socket.readyState != 1 || socket.readyState == null) return;
		
		let msg = $('input#msg').val();
		socket.send(msg);
	});
	
	connect();
});

var socket = null;

function connect(){
	var ws = new WebSocket("ws://192.168.20.17:8089/replyEcho");
	socket = ws;

	//event handler Connection, 소켓 연결 됬을 때
	ws.onopen = function(){
		console.log('Info: connection opened.');
		
	};

	ws.onmessage = function(event){
		console.log("ReceiveMessage: ", event.data+'\n');
	};

	ws.onclose = function (event) {
		console.log('Info: connection closed.');
		setTimeout( function(){ connect();}, 1000); // retry connection!!
	
	};
	ws.onerror = function (err) { console.log('error: ', err);};
}




</script>
</head>
<body>

<div class="well">
	<input type="text" id="msg" value="1212" class="form-control"/>
	<button id="btnSend" class="btn btn-primary">Send Message</button>

</div>

</body>
</html>