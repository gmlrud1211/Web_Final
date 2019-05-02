<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
</style>


<script type="text/javascript">

	$(document).ready(function() {
		
		//비밀번호 재확인
		$("#user_pw").keyup(function(){
	        var pwd=$(this).val();
	        // 비밀번호 검증할 정규 표현식
	        var reg=/^.{8,}$/;
	        if(reg.test(pwd)){//정규표현식을 통과 한다면
	                    $("#pwdRegErr").hide();
	                    successState("#user_pw");
	        }else{//정규표현식을 통과하지 못하면
	                    $("#pwdRegErr").show();
	                    errorState("#user_pw");
	        }
	    });
	    $("#re_user_pw").keyup(function(){
	        var rePwd=$(this).val();
	        var pwd=$("#user_pw").val();
	        // 비밀번호 같은지 확인
	        if(rePwd==pwd){//비밀번호 같다면
	            $("#rePwdErr").hide();
	            successState("#re_user_pw");
	        }else{//비밀번호 다르다면
	            $("#rePwdErr").show();
	            errorState("#re_user_pw");
	        }
	    });
			
	    
		
		// 휴대폰번호 자동하이픈
		function autoHypenPhone(str){
		    str = str.replace(/[^0-9]/g, '');
		    var tmp = '';
		    if( str.length < 4){
		        return str;
		    }else if(str.length < 7){
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3);
		        return tmp;
		    }else if(str.length < 11){
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3, 3);
		        tmp += '-';
		        tmp += str.substr(6);
		        return tmp;
		    }else{              
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3, 4);
		        tmp += '-';
		        tmp += str.substr(7);
		        return tmp;
		    }
		    return str;
		}
		var phone = document.getElementById('user_phone');
		phone.onkeyup = function(event){
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenPhone(_val) ;
		}
			
		//이메일 정규식 표현(___@___.com)
		$("#user_email").keyup(function(){
		       var email=$(this).val();
		       // 이메일 검증할 정규 표현식
		       var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		       if(reg.test(email)){//정규표현식을 통과 한다면
		                   $("#emailErr").hide();
		                   successState("#user_email");
		       }else{//정규표현식을 통과하지 못하면
		                   $("#emailErr").show();
		                   errorState("#user_email");
		       }
		   });
		
		
		// 성공 상태로 바꾸는 함수
		function successState(sel){
			$(sel)
				.parent()
		        .removeClass("has-error")
		        .addClass("has-success")
		        .find(".glyphicon")
		        .removeClass("glyphicon-remove")
		        .addClass("glyphicon-ok")
		        .show();
		 
		        $("#myForm button[type=submit]")
		                    .removeAttr("disabled");
		    };
		    
		// 에러 상태로 바꾸는 함수
		function errorState(sel){
			$(sel)
		        .parent()
		        .removeClass("has-success")
		        .addClass("has-error")
		        .find(".glyphicon")
		        .removeClass("glyphicon-ok")
		        .addClass("glyphicon-remove")
		        .show();
		 
		        $("#myForm button[type=submit]")
		                    .attr("disabled","disabled");
		    };	
		
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
					    	
		    




		 // 회원가입 버튼 클릭 시 유효성 검사 후 폼전송
			$("#btnJoin").click(function(){
				
				var user_id = document.getElementById('user_id');
				// 아이디 중복확인을 해야 가입되도록
				if(user_id!=null){
					var pwRule = new RegExp("^[a-zA-Z0-9][a-zA-Z0-9]{5,11}$","g");  
				    var nameRule = new RegExp("^[\u3131-\u318E\uAC00-\uD7A3]*$");
				    var year = parseInt($("#year").val());
				    var day = parseInt($("#day").val());
				    var thisyear = new Date().getFullYear();
				    var user_birth = birthday();
				    
				    var pwMatch = pwRule.exec($("#user_pw").val()); 
				    var nameMatch = nameRule.exec($("#user_name").val());
				    
				    
				    if(pwMatch == null || $("#user_pw").val().length <  6 || $("#user_pw").val().length > 12){
					    // 비밀번호 정규식 체크
				    	alert("비밀번호를 6~11자의 영숫자로 입력해주세요.");
				    	$("#user_pw").focus();
				    	return;
				    } else if($("#user_pw").val() != $("#re_user_pw").val()){
				    	// 비밀번호 / 비밀번호 일치 여부 확인
				    	alert("비밀번호와 비밀번호 확인이 서로 일치하지 않습니다");
				    	$("#user_pw").focus();
				    	return; 
				    } else if (nameMatch == null ||  $("#user_name").val() == ""){
				    	// 이름은 한글만 입력가능
				    	alert("이름을 한글로 입력해주세요.")
				    	$("#user_name").focus();
				    	return;
				    } else if($("#user_phone").val() == "") {
				    	// 휴대폰번호 빈값 체크
				    	alert("휴대폰번호를 입력해주세요");
				    	$("#user_phone").focus();
				    	return;
				    } else if($("#year").val() == "" || $("#month").val() == 'default' || $("#day").val() == ""){
				    	// 생년월일 빈값 체크 
				    	alert("생년월일이 입력되지 않았습니다. ");
				    	$("#year").focus();
				    	return;
				    } else if( thisyear - year < 14 ){
				    	// 14세 이상 회원가입 가능
				    	alert("14세 이상 회원가입 가능합니다");
				    	$("#year").focus(); 
				    	return;
				    } else if ( year+100 < thisyear ){
				    	// 100세 이상은 연도 재확인 
				    	alert("태어난 연도를 재확인해주세요");
				    	$("#year").focus();
				    	return;
				    } else if( day<1 || day>31){
				    	// 1~31일 아닌 다른 수 입력 시 체크
				    	alert("태어난 일자를 재확인해주세요");
				    	$("#day").focus();
				    	return;
				    } else
				    {
				    	// 유효성 검사 완료 후 폼전송!
						$("#joinForm").submit();
				    }
				    	 
				} else {
			    	alert("아이디 중복확인을 해주세요");
			    	return;
			    }
			})
		    
		    
		    
		    
		    
	});

</script>

</head>
<style>
	.oh{overflow: hidden !important;}
	.fl{float:left !important;}
	
	.myForm123 > div{overflow: hidden !important; max-width:100% !important}
	.myForm123 > div > label{float:left !important; width:40% !important}
	.myForm123 > div > div{float:left !important; width:60% !important}
	.myForm123 > div > div > input{width: 100% !important}
	
	.col-sm-2.control-div {
	    padding-right: 2px;
	    padding-left: 0px;
	}
	.col-sm-3.control-div {
	    padding-right: 2px;
	    padding-left: 0px;
	}
	
</style>
<body>
	<div class="container">
			
			<div style="max-width: 450px; margin: 0 auto;">
			<h4 style="text-align:center;">JOIN</h4>
			<br><br>
			
			<form class="form-horizontal myForm123" id="myForm" action="/join" method="post">
					
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_id">아이디</label>
					<div class="col-sm-13">
						<input class="form-control" type="text" name ="user_id" id="user_id" size="10" placeholder="Id" />
					</div>
				</div>

				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_pw">비밀번호</label>
					<div class="col-sm-13">
						<input class="form-control" type="password" id ="user_pw" name="user_pw" placeholder="Password" />
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	
				<br>

				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="re_user_pw">비밀번호 재확인</label>
					<div class="col-sm-13">
						<input class="form-control" type="password" id ="re_user_pw" name="re_user_pw" placeholder="Password" />
						<span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
	            		<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_name">이름</label>
					<div class="col-sm-13">
						<input class="form-control" type="text" id ="user_name" name="user_name" placeholder="Name" />
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_email">이메일</label>
					<div class="col-sm-13">
						<input class="form-control" type="text" id ="user_email" name="user_email" placeholder="Email" />
						<span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	

				<div class="form-group has-feedback">	
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_phone">휴대폰 번호</label>			
					<div class="col-sm-13">
						<input class="form-control" type="text" id ="user_phone" name="user_phone" placeholder="Phone_Number" />
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_birth">생년월일</label>
						<div class="col-sm-3 control-div" style="width:200px">
					      <select class="form-control" name="birth_year" id="birth_year"></select>
					   </div>
					   <div class="col-sm-2 control-div" style="width:200px" >
					      <select class="form-control" name="birth_month" id="birth_month"></select>
					   </div>
					   <div class="col-sm-2 control-div" style="width:200px">
					      <select class="form-control" name="birth_day" id="birth_day"></select>
					   </div>
				</div>	
				<br>
				
		
				<div class="col-sm-8 col-sm-offset-4" style="text-align:center;">		
					<button class="btn btn-success" id="btnJoin">Sign up</button>
				</div>
			</form>
			
		</div>	
	</div>

</body>
</html>