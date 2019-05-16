<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
#content {
	width: 100%;
	margin: 0 auto;
}

table {
	border: 1px solid grey;
	border-collapse: collapse;
}

td {
	border: 1px solid grey;
	padding: 10px 5px;
}

td.info {
	color: white;
	background-color: #827ffe;
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

<div id="menu"
	style="background-color: #d7d3d447; border-right: #D8D8D8; height: 2260px; width: 20%; float: left;">
	<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
</div>


<div class="container">

	<h3 style="font-size: 25px">챗봇 등록</h3>
	<hr>

	<div style="float: left; margin-top: 70px; margin-left: 210px;">
		<form action="/admin/chatbot/write" method="post">
			<table class="table table-bordered">

				<tr>
					<td class="info">아이디</td>
					<td>관리자</td>
				</tr>

				<tr>
					<td class="info">대분류 번호 입력</td>

					<td><textarea id="xChat_no" name="xChat_no"></textarea></td>
					<!-- 	  <SELECT name='type'> 검색 컬럼 -->
					<!--         <OPTION id="title" value='title'>제목</OPTION> -->
					<!--         <OPTION id="content" value='content'>내용</OPTION> -->
					<!--         <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION> -->
					<!--         <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION> -->

					<!--       </SELECT> -->

				</tr>

				<tr>
					<td class="info">중분류 번호 입력</td>

					<td><textarea id="mChat_no" name="mChat_no"></textarea></td>
					<!-- 	 <SELECT name='type'> 검색 컬럼 -->
					<!--         <OPTION id="title" value='title'>제목</OPTION> -->
					<!--         <OPTION id="content" value='content'>내용</OPTION> -->
					<!--         <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION> -->
					<!--         <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION> -->

					<!--       </SELECT> -->

				</tr>

				<tr>
					<td class="info">소분류 번호 입력</td>

					<td><textarea id="mChat_no" name="mChat_no"></textarea></td>
					<!-- 	 <SELECT name='type'> 검색 컬럼 -->
					<!--         <OPTION id="title" value='title'>제목</OPTION> -->
					<!--         <OPTION id="content" value='content'>내용</OPTION> -->
					<!--         <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION> -->
					<!--         <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION> -->

					<!--       </SELECT> -->

				</tr>

				<tr>
					<td class="info">질문</td>
					<td><textarea style="height: 100px; width: 500px;"
							id="sChat_name" name="sChat_name"></textarea></td>
				</tr>
				<tr>
					<td class="info">답</td>
					<td><textarea style="height: 100px; width: 500px;"
							id="sChat_answer" name="sChat_answer"></textarea></td>
				</tr>

			</table>
			<div class="btn" style="margin:10px;">
				<button id="btnWrite" class="btn btn-primary bt">작성</button>
				<button type="button" id="btnCancel" class="btn btn-danger bt">취소</button>
			</div>
		</form>
	</div>

</div>

<div style="clear: both;">
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>

<script type="text/javascript">
	// 스마트에디터 스킨 적용
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "sChat_answer", //<textarea>의 id를 입력
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
	//<textarea>의 내용으로 전송함 -> <form>태그의 값으로 적용
	function submitContents(elClickedObj) {
		oEditors.getById["quse"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			elClickedObj.form.submit();

		} catch (e) {
		}
	}
</script>

















