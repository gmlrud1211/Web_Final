<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<head>
		<meta charset="UTF-8">
		<title>개인정보수정</title>
	
		<!-- jQuery 2.2.4 -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
		<link rel="stylesheet" href="/js/bootstrap.js"/>
		<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
		<link rel="stylesheet" href="/css/bootstrap.css"/>
		<link rel="stylesheet" href="/css/bootstrap.min.css"/>
		
		<style>
		   	 /* .help-block 일단 안보이게 설정 */
		     #myForm .help-block{ display: none; }
		      /* glyphicon 일단 안보이게 설정 */
		     #myForm .glyphicon{ display: none;  }
	
			.myForm123 > div{overflow: hidden !important; max-width:100% !important}
			.myForm123 > div > label{float:left !important; width:40% !important}
			.myForm123 > div > div{float:left !important; width:60% !important}
			.myForm123 > div > div > input{width: 100% !important}
			
				     
		     .col-sm-2.control-div {
			    padding-right: 3px;
			    padding-left: 0px;
			    margin-right: 0px;
			}
			.col-sm-3.control-div {
			    padding-right: 3px;
			    padding-left: 0px;
			}
			
			
		</style>
		
		<script type="text/javascript">
			$(document).ready(function(){
				
				$("#btnChange").click(function(){
					$("#myForm").submit();
					alert("정보가 수정되었습니다");
				});

				// 생년월일 select
				 
			    function appendYear(){
			    	var date = new Date();
			    	var year = date.getFullYear();
			    	var selectValue = document.getElementById("birth_year");
			    	var optionIndex = 0;

			    	for(var i=year-100;i<=year;i++){
			    			selectValue.add(new Option(i+"년",i),optionIndex++);                        
			    	}

			    }

			    function appendMonth(){
			    	var selectValue = document.getElementById("birth_month"); 
			    	var optionIndex = 0;

			    	for(var i=1;i<=12;i++){
			    			selectValue.add(new Option(i+"월",i),optionIndex++);
			    	}
			    }

			    function appendDay(){
			    	var selectValue = document.getElementById("birth_day");
			    	var optionIndex = 0;

			    	for(var i=1;i<=31;i++){
			    			selectValue.add(new Option(i+"일",i),optionIndex++);
			    	}
			    } 
			    
			    
		    	var birth_year = appendYear();
				var birth_month = appendMonth();
				var birth_day = appendDay();
	
				
			});
			
		</script>
	</head>

	<jsp:include page="../common/header.jsp" />

	<body>
	
		<div class="container">
		<hr style="color:#ccc;">
			
		
		<div class="row row-offcanvas row-offcanvas-right">
		<jsp:include page="../layout/mypage.jsp"/>
		
		<div class="col-xs-12 col-sm-9">
			
			<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
				<h3>MyPage-개인정보</h3>
	            <p style="font-size: 16px">개인정보 수정</p>
	        </div>
		<div style="max-width: 500px; margin: 0 auto;" >
		
		<form class="form-horizontal myForm123" id="myForm" action="/mypage/infoUpdate" method="post">
					
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_id">아이디</label>
				<div class="col-sm-13">
					<input class="form-control" type="text" value="${user.user_id }" name="user_id" readonly="readonly" />
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_name">이름</label>
				<div class="col-sm-13">
					<input class="form-control" type="text" value="${user.user_name }" name="user_name" />
				</div>
			</div>
			
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_email">이메일</label>
				<div class="col-sm-13">
					<input class="form-control" type="text" value="${user.user_email }" name="user_email" />
				</div>
			</div>
		
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_phone">휴대폰</label>
				<div class="col-sm-13">
					<input class="form-control" type="text" value="${user.user_phone }" name="user_phone"/>
				</div>
			</div>
			
			<div class="form-group has-feedback">
				<label class="col-sm-5 col-sm-offset-1 control-label" for="user_birth">생년월일</label>	
				<div class="col-sm-3 control-div" style="width:200px">
					<select class="form-control" name="birth_year" id="birth_year" ></select>
				</div>
				<div class="col-sm-2 control-div" style="width:200px" >
				     <select class="form-control" name="birth_month" id="birth_month"></select>
				</div>
				<div class="col-sm-2 control-div" style="width:200px">
				     <select class="form-control" name="birth_day" id="birth_day"></select>
				</div>
			</div>
		
			<br><br>
		
			<div class="col-sm-8 col-sm-offset-4" style="text-align:right;">		
				<button class="btn btn-primary" id="btnChange">정보 수정 완료</button>
			</div>
		
		</form>
		</div>
		</div>
	</div>
	</div>
	</body>
