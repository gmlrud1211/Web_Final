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
#content {
	width: 100%;
	margin: 0 auto;
}
td.info{
width : 120px;
text-align: center;
}

td.con{
width : 571px;

}


table {
	border: 1px solid grey;
	border-collapse: collapse;
}

td {
	border: 1px solid grey;
	padding: 5px 5px;
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

	<div style="float: left; margin-top: 70px; margin-left: 150px; ">
		<form action="/admin/chatbot/modify" method="post">
			<table class="table table-bordered">

				<tr>
					<td class="info">아이디</td> <td class="con">관리자</td>
				</tr>

				<tr>
					<td class="info">대분류 번호 입력</td>

					<td class="con"><SELECT name='xChat_no'>
						<OPTION id="xChat_1" value='1'>회원관련</OPTION>
						<OPTION id="xChat_2" value='2'>사이트관련</OPTION>
						<OPTION id="xChat_3" value='3'>캘린더관련</OPTION>
						<OPTION id="xChat_4" value='4'>커뮤니티</OPTION>
						<OPTION id="xChat_5" value='5'>챗봇관련</OPTION>
						<OPTION id="xChat_6" value='6'>기타</OPTION>
						
					</SELECT>
					</td>
				</tr>

				<tr>
					<td class="info">중분류 번호 입력</td>

					<td class="con"><SELECT name='mChat_no'>
						<OPTION id="mChat_1" value='101'>회원가입 </OPTION>
						<OPTION id="mChat_2" value='102'>개인정보 </OPTION>
						<OPTION id="mChat_3" value='103'>정보수집 </OPTION>
						<OPTION id="mChat_4" value='201'>About 올댓핫플레이스 </OPTION>
						<OPTION id="mChat_5" value='202'>사이트 이용관련</OPTION>
						<OPTION id="mChat_6" value='203'>사이트 장애</OPTION>
						<OPTION id="mChat_7" value='301'>캘린더 이용관련 </OPTION>
						<OPTION id="mChat_8" value='401'>커뮤니티 이용관련 </OPTION>
						<OPTION id="mChat_9" value='501'>챗봇 이용관련 </OPTION>
						<OPTION id="mChat_10" value='601'>검색 관련</OPTION>
						<OPTION id="mChat_11" value='602'>마이페이지</OPTION>
					</SELECT></td>
				</tr>

				<tr>
					<td class="info">소분류 번호 입력</td>

					<td class="con"><textarea id="sChat_no" name="sChat_no">${view.sChat_no }</textarea></td>

				</tr>

				<tr>
					<td class="info">질문</td>
					<td class="con"><textarea style="height: 100px; width: 571px;"
							id="content1" name="sChat_name">${view.sChat_name }</textarea></td>
				</tr>
				<tr>
					<td class="info">답</td>
					<td class="con"><textarea style="height: 100px; width: 500px;"
							id="content2" name="sChat_answer">${view.sChat_answer}</textarea></td>
				</tr>

			</table>
			<div class="btn" style="margin: 10px; margin: 20px;margin-left: 270px;">
				<button id="btnWrite" class="btn btn-primary bt">수정</button>
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
		elPlaceHolder : "content2", //<textarea>의 id를 입력
		sSkinURI : "/resources/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			bUseToolbar : true, //툴바 사용여부
			bUseVerticalResizer : true, //입력창 크기 조절 바
			bUseModeChanger : false
		//모드 탭
		}
	});

	// <form>의 submit동작에 맞춰 스마트에디터에 작성한 내용을
	//<textarea>의 내용으로 전송함 -> <form>태그의 값으로 적용
	function submitContents(elClickedObj) {
		oEditors.getById["content2"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			elClickedObj.form.submit();

		} catch (e) {
		}
	}
</script>
