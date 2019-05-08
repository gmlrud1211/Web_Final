<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	
</style>


<script type="text/javascript">

/* 챗봇창 띄우기 */
$(document).ready(function(){
	
	/* 메시지 전송,답변 */
	$("#btnChatBot").click(function(){
		
		$.ajax({
			type: "post"
			, url: "/chatAjax"
			, data: $("#chatBot").serialize()
			, dataType: "json"
			, success: function( data ){
				
				console.log("채팅글 전송 성공!")
				console.log(data);
				console.log(data.content);
				console.log(data.userid);
				console.log(data.reply);
				console.log(data.reply.length);
				console.log(scroll());
				
				var html = "";
				var beforeChat = $("#resultChatBot").html();
				
				if(data.login){
					
					html =
						beforeChat
						+"<ul class=\"nav nav-pills\">"
						+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px; max-width:530px;\">"
						+"<div style=\"text-align:right; margin:5px; width:auto;\">"
						+data.userid+" : "
						+data.content
						+"</div><br>"
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
								+data.content
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
						
					
					$("#resultChatBot").html(html)
					
					scroll();
					
				} else{
					$("#resultChatBot").html(
							"<div style=\"text-align:right; \">"
							+"로그인이 필요합니다.<br>"
							+"</div><br>"
					)
				}
				
				//""안에 ""넣으려면 \"로 쓰던가, 겉에 '쓰고 안에 " 쓰면 된다
				
// 				for(i=0; i<data.length; i++){
					
// 					$("#resultChatBot").html(
// 						"<h3>"+data.content+"</h3>"
// 						+beforeChat
// 					);
// 				}
				
				//전송버튼 클릭 시 제일 하단 메시지로 이동(스크롤기능없이 바로이동)
// 				location.href="#chatBottom";
				//기본으로 789값 받고 그뒤로 왔다갔다해서 그냥 안함
// 				var scrollPosition = $("#chatBottom").offset().top;
				//scrollPosition값을 큰 수로 지정해놓으면 id가 scrolltest인 div의 scrollPosition y축까지 계속 스크롤됨
				scroll();
				
				//전송버튼 클릭 시 남아있는 input태그 글 삭제
// 				$("#content").remove();
			}
			, error: function(e){
				console.log("실패");
				console.log(e);
			}
			
		})
		
		
		//메시지 전송 시 input태그 입력값 초기화
		$("#content").val("");
		
	});
	
	/* 엔터키 */
	$("#btnChatBot").keypress(function(event){
		if(event.which==13){
			$("#btnChatBot").click();
		}
	});
	
	/* 채팅기록 전체삭제 */
	$("#refresh").click(function(){
		
		$("#resultChatBot").empty().animate(0,500);
		$("#resultChatBot").append("<div class=\"text-center \"style=\"margin:auto;\"><h1><strong>삭제완료</strong></h1></div>");
		setTimeout(function(){$("#resultChatBot").empty();},1000);
	});
	
	
	/* 챗봇 나가기 */
	/* 자동새로고침 0.2초로 설정 */
	$("#btnChatBotOver").click(function(){
		setTimeout(function(){
			location.reload();
		}, 100);
	})
	
	
	/* ----------------------------------------------------------------------------- */
	/* 대분류 리스트 버튼 클릭 시 질문목록 가져오기 */
	$("#btnXChatList").click(function(){
		
		console.log("버튼클릭");
		
		$.ajax({
			type: "get"
			, url: "/chatAjax_ansList"
			, data: {}
			, dataType: "json"
			, success: function(data){
				console.log("성공");
				console.log(data);
				console.log(data.xlist);
				console.log(data.xlist[1]);
				console.log(data.xlist[0].xChat_no);
				console.log(data.xlist[1].xChat_name);
				
				console.log(data.xlist.length);
				
// 				var a = $("#resultChatBotList").html();
				
// 				for(i=0; i<data.list.length; i++){
// 					$("#resultChatBotList").html(
// 						+"<div id=\"btnMChatList"+i+"\" style=\"width:120px;\">"
// 						+data.list[i].xChat_no+".&nbsp;"+data.list[i].xChat_name
// 						+"</div>"
// 					)
// 					+a
// 				}
				$("#resultChatBotList").toggle('slow').html(
					"<div class=\"panel panel-default\" style=\"width:150px;\">"
					+
					"<div class=\"panel-body\" onclick=\"clickX1()\" name=\"XChatList1\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원관련 질문을 하시려면 클릭하세요.\">"
					+data.xlist[0].xChat_no+".&nbsp;"+data.xlist[0].xChat_name
					+"</div>"
					+
					"<div class=\"panel-body\" onclick=\"clickX2()\" name=\"XChatList2\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"사이트관련 질문을 하시려면 클릭하세요.\">"
					+data.xlist[1].xChat_no+".&nbsp;"+data.xlist[1].xChat_name
					+"</div>"
					+
					"<div class=\"panel-body\" onclick=\"clickX3()\" name=\"XChatList3\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"캘린더관련 질문을 하시려면 클릭하세요.\">"
					+data.xlist[2].xChat_no+".&nbsp;"+data.xlist[2].xChat_name
					+"</div>"
					+
					"<div class=\"panel-body\" onclick=\"clickX4()\" name=\"XChatList4\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"커뮤니티관련 질문을 하시려면 클릭하세요.\">"
					+data.xlist[3].xChat_no+".&nbsp;"+data.xlist[3].xChat_name
					+"</div>"
					+
					"<div class=\"panel-body\" onclick=\"clickX5()\" name=\"XChatList5\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"챗봇관련 질문을 하시려면 클릭하세요.\">"
					+data.xlist[4].xChat_no+".&nbsp;"+data.xlist[4].xChat_name
					+"</div>"
					+
					"<div class=\"panel-body\" onclick=\"clickX6()\" name=\"XChatList6\" style=\"width:120px; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"기타 질문을 하시려면 클릭하세요.\">"
					+data.xlist[5].xChat_no+".&nbsp;"+data.xlist[5].xChat_name
					+"</div>"
					+"</div>"
					
				);
				
				/* 대분류 첫번째 질문에 마우스 올릴 시 대분류1의 중분류 mouseover */
// 				$("#btnXChatList1").mouseover(function(){
					
// 					var html = "";
// 					var chatBotList= $("#resultChatBotList").html();
					
// 					$("#resultChatBotList").html(
// 							chatBotList.css('display','block');
// 							+"<div id=\"rem\">ㅎㅇ</div>".css('display','block');
// 					);
					
// 					$("btnXChatList1").mouseout(function(){
// 						$("#rem").css('display','none');
// 					})
// 				})
						
				
			}
			, error: function(e){
				console.log("실패");
				console.log(e);
			}
		})
	});
	

	
	/* 중분류 리스트 클릭 시 자동질문응답 출력 */
	
	/* 중분류 리스트 마우스 올릴시 소분류 질문목록 가져오기 */
// 	$("#btnSChatList").mouseover(function(){
		
// 	});
	
	/* 소분류 리스트 클릭 시 자동질문응답 출력 */
	
	
	
	/* 마우스 갖다댈때 이벤트 발생 mouseover */
	
	/* 새로생긴 메시지로 바로바로 화면 이동시키려면 그 해당 div에 id="test" 를 주고 클릭이벤트에 location.href="#test"를 설정해준다. */
	
});


/* -----------------------------메시지 추가 시 자동scroll기능-------------------------- */

//메시지 추가 시 자동 scroll을 위한 scrollPosition 초기값
var i = 10000;

function scroll(){
// 	초기값 100으로 설정, ajax동작시마다 +100됨
	var scrollPosition = i; 
	console.log(scrollPosition)
	$("#scrolltest").stop().animate({
		scrollTop: scrollPosition
	}, 1500);
	i+=10000;
}

/* ------------------INNER AJAX 함수 구현부분(대분류 클릭 시 발동)------------------ */
/* 대분류 첫번째 질문 클릭 시  */
function clickX1(){
	
	var a = 1;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			console.log(data.mlist);
			console.log(data.mlist[0]);
			console.log(data.mlist[0].xChat_no);
			console.log(data.mlist[0].mChat_no);
			console.log(data.mlist[0].mChat_name);
			
			console.log(data.mlist.length);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[0].xChat_no+".&nbsp;"+data.xlist[0].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[0].xChat_no+".&nbsp;"+data.xlist[0].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickM102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[1].mChat_no+".&nbsp;"
					+data.mlist[1].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickM103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[2].mChat_no+".&nbsp;"
					+data.mlist[2].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
					
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
			
		}
		, error: function(e){
			console.log("실패");
			console.log(e);
		}
	})
}

/* 대분류 두번쨰 질문 클릭 시 */
function clickX2(){
	
	var a = 2;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			console.log(data.mlist);
			console.log(data.mlist[1]);
			console.log(data.mlist[1].xChat_no);
			console.log(data.mlist[1].mChat_no);
			console.log(data.mlist[1].mChat_name);
			
			console.log(data.mlist.length);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[1].xChat_no+".&nbsp;"+data.xlist[1].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[1].xChat_no+".&nbsp;"+data.xlist[1].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM201()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickM202()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"사이트 이용관련 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[1].mChat_no+".&nbsp;"
					+data.mlist[1].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickM203()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"사이트 장애 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[2].mChat_no+".&nbsp;"
					+data.mlist[2].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 대분류 세번째 질문 클릭 시 */
function clickX3(){
	
	var a = 3;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[2].xChat_no+".&nbsp;"+data.xlist[2].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[2].xChat_no+".&nbsp;"+data.xlist[2].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM301()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 대분류 네번째 질문 클릭 시 */	
function clickX4(){
	
	var a = 4;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[3].xChat_no+".&nbsp;"+data.xlist[3].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[3].xChat_no+".&nbsp;"+data.xlist[3].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM401()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 대분류 다섯번째 질문 클릭 시 */
function clickX5(){
	
	var a = 5;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[4].xChat_no+".&nbsp;"+data.xlist[4].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[4].xChat_no+".&nbsp;"+data.xlist[4].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM501()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 대분류 여섯번째 질문 클릭 시 */
function clickX6(){
	
	var a = 6;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_XChatList"
		, data: {a}
		, dataType: "json"
		, success: function( data ){
			
			console.log("성공");
			console.log(data);
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.xlist[5].xChat_no+".&nbsp;"+data.xlist[5].xChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.xlist[5].xChat_no+".&nbsp;"+data.xlist[5].xChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickM601()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[0].mChat_no+".&nbsp;"
					+data.mlist[0].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickM602()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"홈페이지 정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.mlist[1].mChat_no+".&nbsp;"
					+data.mlist[1].mChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* ------------------INNER AJAX 함수 구현부분(중분류 클릭 시 발동)------------------ */
/* 101 질문 클릭 시 */
function clickM101(){
	
	var a = 101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[0].mChat_no+".&nbsp;"+data.mlist[0].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:400px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[0].mChat_no+".&nbsp;"+data.mlist[0].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS10101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS10102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS10103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS10104()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[3].sChat_no+".&nbsp;"
					+data.slist[3].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 102 질문 클릭 시 */
function clickM102(){
	
	var a = 102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[1].mChat_no+".&nbsp;"+data.mlist[1].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:400px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[1].mChat_no+".&nbsp;"+data.mlist[1].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS10201()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS10202()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
		
	})
}

/* 103 질문 클릭 시 */
function clickM103(){
	
	var a = 103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[2].mChat_no+".&nbsp;"+data.mlist[2].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:400px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[2].mChat_no+".&nbsp;"+data.mlist[2].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS10301()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
		
	})
}

/* 201 질문 클릭 시 */
function clickM201(){
	
	var a = 201;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[3].mChat_no+".&nbsp;"+data.mlist[3].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:400px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[3].mChat_no+".&nbsp;"+data.mlist[3].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS20101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20104()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[3].sChat_no+".&nbsp;"
					+data.slist[3].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 202 질문 클릭 시 */
function clickM202(){
	
	var a = 202;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[4].mChat_no+".&nbsp;"+data.mlist[4].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:500px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[4].mChat_no+".&nbsp;"+data.mlist[4].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS20201()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20202()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20203()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20204()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[3].sChat_no+".&nbsp;"
					+data.slist[3].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20205()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[4].sChat_no+".&nbsp;"
					+data.slist[4].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 203 질문 클릭 시 */
function clickM203(){
	
	var a = 203;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[5].mChat_no+".&nbsp;"+data.mlist[5].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:350px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[5].mChat_no+".&nbsp;"+data.mlist[5].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS20301()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20302()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS20303()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 301 질문 클릭 시 */
function clickM301(){
	
	var a = 301;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[6].mChat_no+".&nbsp;"+data.mlist[6].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:380px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[6].mChat_no+".&nbsp;"+data.mlist[6].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS30101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS30102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS30103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS30104()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[3].sChat_no+".&nbsp;"
					+data.slist[3].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 401 질문 클릭 시 */
function clickM401(){
	
	var a = 401;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[7].mChat_no+".&nbsp;"+data.mlist[7].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:430px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[7].mChat_no+".&nbsp;"+data.mlist[7].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS40101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS40102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS40103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 501 질문 클릭 시 */
function clickM501(){
	
	var a = 501;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[8].mChat_no+".&nbsp;"+data.mlist[8].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:350px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[8].mChat_no+".&nbsp;"+data.mlist[8].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS50101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS50102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS50103()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"정보수집 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[2].sChat_no+".&nbsp;"
					+data.slist[2].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 601 질문 클릭 시 */
function clickM601(){
	
	var a = 601;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[9].mChat_no+".&nbsp;"+data.mlist[9].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:400px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[9].mChat_no+".&nbsp;"+data.mlist[9].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS60101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"<li onclick=\"clickS60102()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"개인정보 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[1].sChat_no+".&nbsp;"
					+data.slist[1].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 602 질문 클릭 시 */
function clickM602(){
	
	var a = 602;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_MChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.mlist[10].mChat_no+".&nbsp;"+data.mlist[10].mChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto; max-width:350px;\">"
					+"<div style=\"margin:10px;\">["
					+data.mlist[10].mChat_no+".&nbsp;"+data.mlist[10].mChat_name
					+"]&nbsp;에 대한 답변입니다.<br>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"clickS60101()\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+data.slist[0].sChat_no+".&nbsp;"
					+data.slist[0].sChat_name+"&nbsp;<br>"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}


/* ------------------INNER AJAX 함수 구현부분(소분류 클릭 시 발동)------------------ */
/* 10101 질문 클릭 시 */
function clickS10101(){
	
	var a = 10101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[0].sChat_no+".&nbsp;"+data.slist[0].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:auto;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[0].sChat_no+".&nbsp;"+data.slist[0].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"회원가입 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 10102 질문 클릭 시 */
function clickS10102(){
	
	var a = 10102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[1].sChat_no+".&nbsp;"+data.slist[1].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[1].sChat_no+".&nbsp;"+data.slist[1].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 10103 질문 클릭 시 */
function clickS10103(){
	
	var a = 10103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[2].sChat_no+".&nbsp;"+data.slist[2].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[2].sChat_no+".&nbsp;"+data.slist[2].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 10104 질문 클릭 시 */
function clickS10104(){
	
	var a = 10104;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[3].sChat_no+".&nbsp;"+data.slist[3].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[3].sChat_no+".&nbsp;"+data.slist[3].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}

/* 10201 질문 클릭 시 */
function clickS10201(){
	
	var a = 10201;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[4].sChat_no+".&nbsp;"+data.slist[4].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[4].sChat_no+".&nbsp;"+data.slist[4].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 10202 질문 클릭 시 */
function clickS10202(){
	
	var a = 10202;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[5].sChat_no+".&nbsp;"+data.slist[5].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[5].sChat_no+".&nbsp;"+data.slist[5].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 10301 질문 클릭 시 */
function clickS10301(){
	
	var a = 10301;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[6].sChat_no+".&nbsp;"+data.slist[6].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[6].sChat_no+".&nbsp;"+data.slist[6].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20101 질문 클릭 시 */
function clickS20101(){
	
	var a = 20101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[7].sChat_no+".&nbsp;"+data.slist[7].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[7].sChat_no+".&nbsp;"+data.slist[7].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20102 질문 클릭 시 */
function clickS20102(){
	
	var a = 20102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[8].sChat_no+".&nbsp;"+data.slist[8].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[8].sChat_no+".&nbsp;"+data.slist[8].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20103 질문 클릭 시 */
function clickS20103(){
	
	var a = 20103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[9].sChat_no+".&nbsp;"+data.slist[9].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[9].sChat_no+".&nbsp;"+data.slist[9].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20104 질문 클릭 시 */
function clickS20104(){
	
	var a = 20104;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[10].sChat_no+".&nbsp;"+data.slist[10].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[10].sChat_no+".&nbsp;"+data.slist[10].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20201 질문 클릭 시 */
function clickS20201(){
	
	var a = 20201;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[11].sChat_no+".&nbsp;"+data.slist[11].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[11].sChat_no+".&nbsp;"+data.slist[11].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20202 질문 클릭 시 */
function clickS20202(){
	
	var a = 20202;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[12].sChat_no+".&nbsp;"+data.slist[12].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[12].sChat_no+".&nbsp;"+data.slist[12].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20203 질문 클릭 시 */
function clickS20203(){
	
	var a = 20203;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[13].sChat_no+".&nbsp;"+data.slist[13].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[13].sChat_no+".&nbsp;"+data.slist[13].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20204 질문 클릭 시 */
function clickS20204(){
	
	var a = 20204;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[14].sChat_no+".&nbsp;"+data.slist[14].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[14].sChat_no+".&nbsp;"+data.slist[14].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20205 질문 클릭 시 */
function clickS20205(){
	
	var a = 20205;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[15].sChat_no+".&nbsp;"+data.slist[15].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[15].sChat_no+".&nbsp;"+data.slist[15].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20301 질문 클릭 시 */
function clickS20301(){
	
	var a = 20301;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[16].sChat_no+".&nbsp;"+data.slist[16].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[16].sChat_no+".&nbsp;"+data.slist[16].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20302 질문 클릭 시 */
function clickS20302(){
	
	var a = 20302;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[17].sChat_no+".&nbsp;"+data.slist[17].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[17].sChat_no+".&nbsp;"+data.slist[17].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 20303 질문 클릭 시 */
function clickS20303(){
	
	var a = 20303;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[18].sChat_no+".&nbsp;"+data.slist[18].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[18].sChat_no+".&nbsp;"+data.slist[18].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 30101 질문 클릭 시 */
function clickS30101(){
	
	var a = 30101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[19].sChat_no+".&nbsp;"+data.slist[19].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[19].sChat_no+".&nbsp;"+data.slist[19].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 30102 질문 클릭 시 */
function clickS30102(){
	
	var a = 30102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[20].sChat_no+".&nbsp;"+data.slist[20].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[20].sChat_no+".&nbsp;"+data.slist[20].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 30103 질문 클릭 시 */
function clickS30103(){
	
	var a = 30103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[21].sChat_no+".&nbsp;"+data.slist[21].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[21].sChat_no+".&nbsp;"+data.slist[21].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 30104 질문 클릭 시 */
function clickS30104(){
	
	var a = 30104;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[22].sChat_no+".&nbsp;"+data.slist[22].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[22].sChat_no+".&nbsp;"+data.slist[22].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 40101 질문 클릭 시 */
function clickS40101(){
	
	var a = 40101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[23].sChat_no+".&nbsp;"+data.slist[23].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[23].sChat_no+".&nbsp;"+data.slist[23].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 40102 질문 클릭 시 */
function clickS40102(){
	
	var a = 40102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[24].sChat_no+".&nbsp;"+data.slist[24].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[24].sChat_no+".&nbsp;"+data.slist[24].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 40103 질문 클릭 시 */
function clickS40103(){
	
	var a = 40103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[25].sChat_no+".&nbsp;"+data.slist[25].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[25].sChat_no+".&nbsp;"+data.slist[25].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 50101 질문 클릭 시 */
function clickS50101(){
	
	var a = 50101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[26].sChat_no+".&nbsp;"+data.slist[26].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[26].sChat_no+".&nbsp;"+data.slist[26].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 50102 질문 클릭 시 */
function clickS50102(){
	
	var a = 50102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[27].sChat_no+".&nbsp;"+data.slist[27].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[27].sChat_no+".&nbsp;"+data.slist[27].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 50103 질문 클릭 시 */
function clickS50103(){
	
	var a = 50103;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[28].sChat_no+".&nbsp;"+data.slist[28].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[28].sChat_no+".&nbsp;"+data.slist[28].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 60101 질문 클릭 시 */
function clickS60101(){
	
	var a = 60101;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[29].sChat_no+".&nbsp;"+data.slist[29].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[29].sChat_no+".&nbsp;"+data.slist[29].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 60102 질문 클릭 시 */
function clickS60102(){
	
	var a = 60102;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[30].sChat_no+".&nbsp;"+data.slist[30].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[30].sChat_no+".&nbsp;"+data.slist[30].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
 
/* 60201 질문 클릭 시 */
function clickS60201(){
	
	var a = 60201;
	
	$.ajax({
		
		type: "post"
		, url: "/chatAjax_SChatList"
		, data:{a}
		, dataType: "json"
		, success: function(data){
			
			var html = "";
			var beforeChat = $("#resultChatBot").html();
			
			
			$("#resultChatBot").html(
					beforeChat
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"float:right; margin:5px;\">"
					+"<div style=\"text-align:right; margin:5px;\">"
					+data.userid+" : "
					+data.slist[31].sChat_no+".&nbsp;"+data.slist[31].sChat_name
					+"</div><br>"
					+"</li>"
					+"</ul>"
					+"<ul class=\"nav nav-pills\">"
					+"<li role=\"presentation\" class=\"panel panel-default\" style=\"margin:5px;\">"
					+"<div style=\"text-align:left; margin:5px; width:530px;\">"
					+"<div style=\"margin:10px;\">["
					+data.slist[31].sChat_no+".&nbsp;"+data.slist[31].sChat_name
					+"&nbsp;에 대한 답변입니다.]<br>"
					+"</div>"
					+"<div style=\"margin:10px\">"
					+"<span class=\"glyphicon glyphicon-hand-right\" aria-hidden=\"true\"></span>"
					+"&nbsp;&nbsp;"
					+data.answer.sChat_answer
					+"</div>"
					+"<ul class=\"nav nav-pills\">"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"* 페이지로 이동"
					+"</li>"
					+"<li onclick=\"\" role=\"presentation\" class=\"panel panel-default\" style=\"margin:10px; width:auto; height:auto; cursor:pointer;\"data-toggle=\"tooltip\" data-placement=\"right\" title=\"회원가입 질문을 하시려면 클릭하세요.\">&nbsp;"
					+"제일 위로 이동"
					+"</li>"
					+"</ul>"
					+"</div>"
					+"</li>"
					+"</ul>"
			)
			//버튼 클릭 시 제일 하단 메시지로 이동
// 			location.href="#chatBottom";
			scroll();
		}
	})
}
</script>

</head>
<body>


	<!------------------- 챗봇 구현부분 ------------------->
	<div style="float:right; margin:100px;">
		<form style="zoom:3; cursor:pointer;" data-toggle="modal" data-target=".bs-example-modal-lg">
			<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
		</form>
	</div>
	

	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	  <h2 style="color:white;">[Chat Bot]</h2>
	    <div class="modal-content" style="height:650px; background:white;">
	    	
	    	<div style="float:right; z-index:999;">
		    	<a href="#">챗봇</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		    	<a href="#">1대1 문의</a>&nbsp;&nbsp;&nbsp;
	    	</div>
	    	<hr>

		    <div id="scrolltest" style="position:relative; overflow:auto; height:600px; margin:10px;">
		    
		    	<!-- 질문목록 띄우기 -->
		      	<form id="btnXChatList" style="width:20px; cursor:pointer;">
		      		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		      	</form>
		      	<div id="resultChatBotList" style="margin:10px; display: none;">
		      	
		      	</div>
		      	
		    	<!-- 채팅기록 보여주기 -->
		        <div id="resultChatBot" data-spy="scroll" data-target="#navbar-example2" data-offset="0" class="scrollspy-example">
	
		        </div>
		        
		        <!-- 채팅내역 사라지게 하기 -->
		        <div id="refresh" style="position:relative; float:right; bottom:0px; cursor:pointer">
		        	<span class="glyphicon glyphicon-remove" aria-hidden="true">전체삭제</span>
		        </div>
		        
		        <!-- 채팅전송 시마다 가장 밑에있는 채팅 보여주기 위해 div 추가 -->
		        <div id="chatBottom"></div>
	        </div>
	  </div><hr>
	    
	    <form id="chatBot" name="chatBot">
			<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <h2>#</h2>
			      </span>
			      <input type="text" id="content" name="content" class="form-control" style="height:100px;" placeholder="#회원가입 #챗봇 #캘린더"/>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
		</form>
		
	    <button id="btnChatBot" class="btn btn-default" style="float:right">전송</button>
	    <button id="btnChatBotOver" class="btn btn-warning" style="float:right">나가기</button>
	  </div>
	</div>


</body>
</html>