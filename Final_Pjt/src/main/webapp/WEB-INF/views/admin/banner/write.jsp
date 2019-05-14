<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllThatHotPlace</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

		$(document).ready(function() {
			$("#btnSub").click(function() {
				$("form").submit();
			});
			
			$("#btnCancel").click(function() {
				history.go(-1);
			})

			$("#btnFile").click(function() {
				//화면크기 구하기
				var w = screen.availWidth;
				var h = screen.availHeight;
				
				//팝업 띄우기
				var popup = window.open(
						"",
						"",
						"status=no" //하단 상태바
						+",menubar=no" //상단 메뉴
						+",scrollbars=no" //스크롤바
						+",resizable=no" //사이즈변경
						+",width=300" //너비
						+",height=200" //높이
						+",left="+(w-300)/2 //x 위치
						+",top="+(h-200)/2 ); //y 위치
				
				//팝업 url 설정
				popup.location = "/admin/banner/fileup";
			});
		});
		function sendData(no, name) {
			$("#file_no").val(no); //파일번호넣기
			$("#upResult").html(name); //파일이름 넣기
		}
	</script>

<style type="text/css">
.bt {
	background-color: #827ffe;
	color: white;
	font-size: 20px;
	border-style: none;
	border-radius: 5px;
}

.bs {
	height: 40px;
}
</style>
</head>

<body>
	<div id="leftside" style="height: 100%; width: 40%; float: left;">
	<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

	<div id="content"
		style="backgound-color: #EEEEEE; height: 100%; width: 50%; float: left;">
		<div style="margin-left: 70px; margin-bottom: 40px; margin-top: 30px">
			<h3>배너등록</h3>
		</div>

		<div class="container">
			<div>
				<form action="/admin/banner/write" method="post"
					class="form-horizontal">
					<div class="form-group">
						<strong><label for="banner_name"
							class="col-sm-3 col-sm-offset-1 control-label bs">배너명</label></strong>
						<div class="col-sm-5">
							<input type="text" id="title" name="title"
								placeholder="특수문자는 사용할수 없습니다" class="form-control" 
								style="border: 1px solid #aea8a8; width:300px;margin-bottom: 20px; height: 30px;" />
						</div>
					</div>
                     
					<div class="form-group">
						<strong> <label for="image"
							class="col-sm-3 col-sm-offset-1 control-label bs">이미지</label>
						</strong>
						<div class="col-sm-5" style="border: 1px solid #aea8a8; width:300px; margin-bottom: 40px; height: 30px;">

							<input type="hidden" id="file_no" name="file_no" />
							<button type="button" id="btnFile" class="btn btn-default" style="margin : 2.4 auto;">파일첨부</button>
							<span id="upResult"></span>
						</div>

					</div>

					<div class="form-group" style="height: 20px"></div>

					<div class="col-sm-offset-4">
						<button type="button" id="btnSub" class="btn btn-sm bt"
							style="color: #ffffff;">등록</button>
						<button type="button" id="btnCancel" class="btn btn-sm bt"
							style="color: #ffffff;">취소</button>
					</div>

				</form>
			</div>
		</div>

	</div>


	<br>






	<div style="clear: both;">
		<%-- <jsp:include page="/view/layout/footer.jsp" /> --%>
	</div>












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