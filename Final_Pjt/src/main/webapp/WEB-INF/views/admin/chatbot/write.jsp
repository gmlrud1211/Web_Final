<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
}
</style>

<div class="container">

<h3>챗봇 등록</h3>
<hr>

<div>
<form action="/admin/chatbot/write" method="post">
<table class="table table-bordered">

<tr><td class="info">아이디</td><td>관리자</td></tr>

<tr>
	<td class="info">대분류 번호 입력</td>
	<td>   
	  <SELECT name='type'> <!-- 검색 컬럼 -->
        <OPTION id="title" value='title'>제목</OPTION>
        <OPTION id="content" value='content'>내용</OPTION>
        <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION>
        <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION>
      
      </SELECT></td>
</tr>

<tr>
	<td class="info">중분류 번호 입력</td>
	<td>
	 <SELECT name='type'> <!-- 검색 컬럼 -->
        <OPTION id="title" value='title'>제목</OPTION>
        <OPTION id="content" value='content'>내용</OPTION>
        <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION>
        <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION>
      
      </SELECT></td>
</tr>

<tr>
<td class="info">질문</td>
<td ><textarea id="quse" name="quse"></textarea></td>
</tr>
<tr>
<td class="info">답</td>
<td><textarea id="ans" name="ans"></textarea></td>
</tr>



</table>
</form>
</div>

<div class="text-center">	
	<button type="button" id="btnWrite" class="btn btn-primary">작성</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
</div>


<script type="text/javascript">
// 스마트에디터 스킨 적용
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "quse", //<textarea>의 id를 입력
    sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams: {
    	bUseToolbar: true, //툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절 바
    	bUseModeChanger: false //모드 탭
    }
});


// <form>의 submit동작에 맞춰 스마트에디터에 작성한 내용을
//<textarea>의 내용으로 전송함 -> <form>태그의 값으로 적용
function submitContents(elClickedObj) {
    oEditors.getById["quse"].exec("UPDATE_CONTENTS_FIELD", []);
    try {
        elClickedObj.form.submit();

    } catch(e) {}
}
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />
















    