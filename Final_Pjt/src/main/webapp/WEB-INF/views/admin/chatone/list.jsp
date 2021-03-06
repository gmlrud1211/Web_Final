<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
	$.ajax({
		type: "get"
		, url: "/resultChatList"
		, data: { "chatroom_idx" : $('#chatroom_idx').val() }
		, dataType: "json"
		, success: function( data ){
			
			
		}
	});
		$('#btnChatBotSend2').on('click', function(evt){
			
			evt.preventDefault();
			
			console.log("버튼클릭");
			
			if(socket.readyState != 1 || socket.readyState == null) return;
			
			let content2 = $('input#content2').val();
			socket.send(content2);
			
			//메시지 전송 시 input태그 입력값 초기화
			$("#content2").val("");
			
		});
		
		/* 챗봇 나가기2 */
		/* 자동새로고침 0.2초로 설정 */
		$("#btnChatBotOver2").click(function(){
			console.log("나가기버튼");
			setTimeout(function(){
				location.reload();
			}, 100);
		});
		
		// 챗봇 전체삭제   
	      $("#refresh2").click(function(){
	         
	         $("#resultChatBot2").empty().animate(0,500);
	         $("#resultChatBot2").append("<div class=\"text-center \"style=\"margin:0 auto;\"><h1>삭제완료</h1></div>");
	         setTimeout(function(){$("#resultChatBot2").empty();},1000);
	      });
	   });
	   
		
	});
	var socket = null;

	function connect(){
		var ws = new WebSocket("ws://192.168.20.17:8089/replyEcho");
		socket = ws;

		//event handler Connection, 소켓 연결 됬을 때
		ws.onopen = function(){
			console.log('Info: connection opened.');
			
		};

		ws.onmessage = function(receive){
			console.log("receive: " + receive);
			console.log("receive.data: "+receive.data+'\n');
			
			var noFlag = receive.data.split('#')[0];
			var senderId = receive.data.split('#')[1];
			var result = receive.data.split('#')[2];
			console.log("noFlag: "+noFlag);
			console.log("senderId: "+senderId);
			console.log("result: "+result);
			
			var html = "";
			var beforeChat = $("#resultChatBot2").html();
			
			if('${user_id}' == senderId){
				
				html =
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px; max-width:530px;\">"
					+"<div style=\"text-align:right; margin:5px; width:auto;\">"
					+senderId+":"+result
					+"</div>"
					+"</li>"
					+"</ul>";	
//						+"<div id=\"chatBottom2\"></div>"
					
				
				$("#resultChatBot2").html(html)
				
				
				
			} else{
				html =
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:left; margin:5px; max-width:530px;\">"
					+"<div style=\"text-align:right; margin:5px; width:auto;\">"
					+senderId+":"+result
					+"</div>"
					+"</li>"
					+"</ul>";	
//						+"<div id=\"chatBottom2\"></div>"
					
				
				$("#resultChatBot2").html(html)
			}
			
			
			scrollMessage2();
		};

		ws.onclose = function (event) {
			console.log('Info: connection closed.');
// 			setTimeout( function(){ connect();}, 1000); // retry connection!!
		
		};
		ws.onerror = function (err) { console.log('error: ', err);};
	}

	/* -----------------------------메시지 추가 시 자동scrollMessage기능-------------------------- */

	// 메시지 추가 시 자동 scrollMessage을 위한 scrollMessagePosition 초기값
	var i = 10000;

	function scrollMessage2(){
//		초기값 100으로 설정, ajax동작시마다 +100됨
		var scrollPosition = i; 
		console.log(scrollPosition)
		$("#scrollMessagetest2").stop().animate({
			scrollTop: scrollPosition
		}, 2500);
		i+=10000;
	}

	
	
function connectFunc(chatroom_idx){
	console.log("chatroom_idx:"+chatroom_idx);
	$.ajax({
		type: "get"
		, url: "/connectFunc"
		, data: { "chatroom_idx" : chatroom_idx }
		, dataType: "json"
		, success: function( data ){}
	});
	connect();
}


</script>




<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th {
	text-align: center !important;
	height: 40px;
	border-bottom: 2px solid grey;
	border-top: 2px solid grey;
}

th
,
td
:not
 
(
:nth-child(2)
 
)
{
text-align
:
 
center
;


}
td {
	text-align: center;
	height: 40px;
	border-bottom: 1px solid #D8D8D8;
}

#btnBox {
	text-align: right;
}

ul.pagination {
	list-style: none;
	text-align: center
}

ul.pagination li {
	display: inline-block;
}

.bt {
	background-color: #827ffe;
	color: white;
	font-size: 20px;
	border-style: none;
	border-radius: 5px;
}
</style>

<div
	style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
</div>

<input type="hidden" name="chatroom_idx" id="chatroom_idx"
	value="${list.chatroom_idx }" />

<div id="menu"
	style="background-color: #d7d3d447; border-right: #D8D8D8; height: 2260px; width: 20%; float: left;">
	<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
</div>

<div id="content"
	style="padding: 10px; width: 1000px; margin: 0 auto; border-left: 1px solid #D8D8D8; height: 100%; float: left;">

	<h3 style="font-size: 25px">1:1 문의 관리</h3>


	<table class="table table-hover table-striped table-condensed">

		<thead>
			<tr style="border-top: 2px solid grey;">
				<th style="width: 10%; border-top: 2px solid grey;">번호</th>
				<th style="width: 25%; border-top: 2px solid grey;">회원명</th>
				<th style="width: 25%; border-top: 2px solid grey;">IP</th>
				<th style="width: 10%; border-top: 2px solid grey;">채팅방 개설 시각</th>
				<th style="width: 10%; border-top: 2px solid grey;">채팅하기</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${chatonelist }" var="list">
				<tr>
					<td>${list.chatroom_idx }</td>
					<td>${list.user_name }</td>
					<td>${list.chatroom_userIp }</td>
					<td><fmt:formatDate value="${list.chatroom_date }"
							pattern="yyyy-MM-dd" /></td>
					<td>
						<div id="floatChat" data-toggle="tooltip" data-placement="left"
							title="클릭하면 챗봇이 열립니다"
							onclick="connectFunc(${list.chatroom_idx })">
							<form style="cursor: pointer;" data-toggle="modal"
								data-target="#modal1on1Chat">
								<span>채팅방 열기</span>
							</form>
						</div>

						<div class="modal fade" id="modal1on1Chat" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog modal-lg">
								<div class="modal-content"
									style="height: 650px; background: #E0F8E0;">

									<div id="scrollMessagetest2"
										style="position: relative; overflow: auto; height: 600px; margin: 10px;">

										<!-- 채팅기록 보여주기 -->
										<div id="resultChatBot2" data-spy="scroll"
											data-target="#navbar-example2" data-offset="0"
											class="scrollspy-example"></div>

										<!-- 채팅내역 사라지게 하기 -->
										<div id="refresh2"
											style="position: relative; float: right; bottom: 0px; cursor: pointer">
											<span class="glyphicon glyphicon-remove" aria-hidden="true">전체삭제</span>
										</div>

										<!-- 채팅전송 시마다 가장 밑에있는 채팅 보여주기 위해 div 추가 -->
										<div id="chatBottom2"></div>
									</div>
								</div>
								<hr>

								<form id="chatBot2" name="chatBot2" style="width: 1828px;">
									<div class="row">
										<div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-addon">
													<h2>#</h2>
												</span> <input type="text" id="content2" name="content2"
													class="form-control" style="height: 100px;"
													placeholder="보낼 메세지를 입력하세요" />

											</div>
											<!-- /input-group -->
										</div>
										<!-- /.col-lg-6 -->
									</div>
									<!-- /.row -->
								</form>
								<button id="btnChatBotSend2" class="btn btn-default"
									style="float: right">전송</button>
								<button id="btnChatBotOver2" class="btn btn-warning"
									style="float: right">나가기</button>

							</div>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div style="margin: 20px;">
		<jsp:include page="/WEB-INF/views/layout/chatonepaging.jsp" />
	</div>


	<div
		style="height: 20px; width: 100%; padding: 10px 350px; claer: both;">
		<div class='text-center'
			style="height: 20px; width: 100%; margin: 0 atuo;">
			<FORM method='get' action='/admin/chatone/list'>
				<SELECT name='search'>
					<!-- 검색 컬럼 -->
					<OPTION id="notice_title" value='notice_title'>제목</OPTION>
					<OPTION id="notice_content" value='notice_content'>본문 내용</OPTION>

				</SELECT> <input type='text' name='word' placeholder="특수문자는 사용할수 없습니다.">
				<button class="search" id="searchBtn ">검색</button>

			</FORM>
		</DIV>
	</div>
</div>

chatroom_idx:${chatroom_idx }
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



