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
<link rel="stylesheet" href="/css/datepicker3.css"/>
    

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
		
		
	})

</script>

</head>
<style>
	.oh{overflow: hidden !important;}
	.fl{float:left !important;}
	
	.myForm123 > div{overflow: hidden !important; max-width:100% !important}
	.myForm123 > div > label{float:left !important; width:40% !important}
	.myForm123 > div > div{float:left !important; width:60% !important}
	.myForm123 > div > div > input{width: 100% !important}
	
</style>
<body>
	<div class="container">
			
			<div style="max-width: 450px; margin: 0 auto;">
			<h4 style="text-align:center;">JOIN</h4>
			<br><br>
			
			<form class="form-horizontal myForm123" id="myForm" action="/join" method="post">
					
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_id">아이디</label>
					<div class="col-sm-11">
						<input class="form-control" type="text" name ="user_id" id="user_id" size="10" placeholder="Id" />
					</div>
				</div>

				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_pw">비밀번호</label>
					<div class="col-sm-11">
						<input class="form-control" type="password" id ="user_pw" name="user_pw" placeholder="Password" />
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	
				<br>

				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="re_user_pw">비밀번호 재확인</label>
					<div class="col-sm-11">
						<input class="form-control" type="password" id ="re_user_pw" name="re_user_pw" placeholder="Password" />
						<span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
	            		<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_name">이름</label>
					<div class="col-sm-11">
						<input class="form-control" type="text" id ="user_name" name="user_name" placeholder="Name" />
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_email">이메일</label>
					<div class="col-sm-11">
						<input class="form-control" type="text" id ="user_email" name="user_email" placeholder="Email" />
						<span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</div>
				</div>	

				<div class="form-group has-feedback">	
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_phone">휴대폰 번호</label>			
					<div class="col-sm-11">
						<input class="form-control" type="text" id ="user_phone" name="user_phone" placeholder="Phone_Number" />
					</div>
				</div>	
				
				<div class="form-group has-feedback">
					<label class="col-sm-5 col-sm-offset-1 control-label" for="user_birth">생년월일</label>	
					<div class="col-sm-11">
						<input class="form-control" type="date" id="user_birth" name="user_birth" placeholder="Birthday" />
					</div>
				</div>	
				<br>
				
		
				<div class="col-sm-8 col-sm-offset-4" style="text-align:center;">		
					<button class="btn btn-success">Sign up</button>
				</div>
			</form>
			
		</div>	
	</div>

</body>
</html>