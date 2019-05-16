<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript"
	src="/resources/smarteditor2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			//스마트에디터 내용을 <textarea>에 적용하기
			submitContents($("#btnWrite"));

			$("form").submit();
		});

		$("#btnCancel").click(function() {
			history.go(-1);
		});
	});
</script>

<style type="text/css">
table {
	border: 1px solid grey;
	border-collapse: collapse;
}

td {
	border: 1px solid grey;
}

#content {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

td.info {
	background-color: #827ffe;
	color: white;
}

.bt {
	background-color: #827ffe;
	color: white;
	font-size: 30px;
	border-style: none;
	border-radius: 5px;
}
</style>

<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
</div>
	<div id="menu" style="background-color: #d7d3d447; border-right:#D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>
<div class="container">



		<h5 style="font-size: 25px;">공지사항 등록</h5>
	<div style="width: 70%; float: left;">
		
        
         <br><br>
         <br><br>
         		<div>
			<form action="/admin/noticeboard/write" method="post">
				<table class="table table-bordered" style="width: 80%">
                   <tbody>
					<tr>
						<td class="info" style="padding: 10px 5px;">아이디</td>
						<td>관리자</td>
					</tr>

					<tr>
						<td class="info">제목</td>
						<td><input type="text" name="notice_title"
							style="width: 100%; height: 100%; margin: 0 auto;" /></td>
					</tr>

					<tr>
						<td class="info">본문</td>
						<td colspan="2"><textarea id="content" name="notice_content"></textarea>
					</tr>
					</tbody>
				</table>

			</form>
	<div style="height: 20px; width: 100%; padding: 30px 350px; claer: both;">

		<div class="text-center"
			style="height: 20px; width: 100%; margin: 0 atuo;">
			<button type="button" id="btnWrite" class="btn btn-primary bt">작성</button>
			<button type="button" id="btnCancel" class="btn btn-danger bt">취소</button>
		</div>

	</div>
		</div>
	</div>

</div>



<script type="text/javascript">
	// 스마트에디터 스킨 적용
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "content", //<textarea>의 id를 입력
		sSkinURI : "/resources/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			bUseToolbar : true, //툴바 사용여부
			bUseVerticalResizer : false, //입력창 크기 조절 바
			bUseModeChanger : false
		//모드 탭
		}
	});

	// <form>의 submit동작에 맞춰 스마트에디터에 작성한 내용을
	// <textarea>의 내용으로 전송함 -> <form>태그의 값으로 적용
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			elClickedObj.form.submit();

		} catch (e) {
		}
	}
</script>





















