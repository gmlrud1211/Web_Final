<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    	
	    	
	    	
		    <div id="scrolltest2" style="position:relative; overflow:auto; height:600px; margin:10px;">
		    
		      	
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
	    
	    <form id="chatBot2" name="chatBot2">
			<div class="row">
			  <div class="col-lg-6">
			    <div class="input-group">
			      <span class="input-group-addon">
			        <h2>#</h2>
			      </span>
			      <input type="text" id="content2" name="content2" class="form-control" style="height:100px;" placeholder="#회원가입 #챗봇 #캘린더"/>

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