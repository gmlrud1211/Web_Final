<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
			var boardno = $(this).children("td").eq(0).text();

			$(location).attr("href", "/board/view?board_no=" + board_no);

// 			글쓰기 버튼 이벤트
// 			$("#btnWrite").click(function() {
// 				location.href = "/board/write";
// 			});

		});
	});
	
	$(document).ready(function(){
	    //최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
	});
	
	function AlldeleteAction(){
	     var checkRow = "";
	     $( "input[name='chk']:checked" ).each (function (){
	       checkRow = checkRow + $(this).val()+"," ;
	     });
	     checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
	    
	     if(checkRow == ''){
	       alert("삭제할 게시글을 선택하세요.");
	       return false;
	     }
	    
	     if(confirm("게시글을 삭제하겠습니까?")){
	         //삭제처리 후 다시 불러올 리스트 url      
	         var url = document.location.href;

	         location.href="/board/deleteCheck?board_no="+checkRow;      
	     }
	}
</script>

<style type="text/css">
table {
 width : 100%;
}
th{
text-align: center !important;
}

th, td:not (:nth-child(2)) {
	text-align: center; 
}



td {
       text-align : center;
	border-left: 1px solid white;
	border-right: 1px solid white;
}

#btnBox {
	text-align: right;
}

ul.pagination{
	list-style: none;
	text-align: center
}

ul.pagination li { 
	display: inline-block;
}
</style>

<div id="menu" style="height:100%;width:20%;float:left;">
<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" /> </div>


<div id="content" style="padding:10px; width:1000px; margin: 0 auto; border-left: 1px solid #D8D8D8; height:100%; float:left; " >

	<h3>게시글 목록</h3>
	<hr>

	<table class="table table-hover table-striped table-condensed">
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 25%">제목</th>
				<th style="width: 10%">조회수</th>
				<th style="width: 10%">작성일</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${nboardlist }" var="list">
				<tr>
					<td>${list.notice_no }</td>
					<td><a href="/admin/noticeboard/view?notice_no=${list.notice_no }">${list.notice_title }</a></td>
					<td>${list.notice_count }</td>
					<td><fmt:formatDate value="${list.notice_date }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<jsp:include page="/WEB-INF/views/layout/noticeboardpaging.jsp" />


	<div id="btnBox">
		<button id="btnWrite" class="btn btn-primary"
		     onclick="location.href='/admin/noticeboard/write';">글쓰기</button>
	</div>
	
	<div id="btnBox">
		<button id="btnDel" class="btn btn-primary"
		     onclick="AlldeleteAction();">삭제</button>
	</div>
	
	<div class='text-center' style="clear:both;">
  <FORM method='get' action='/admin/noticeboard/list'>
   
      <SELECT name='type'> <!-- 검색 컬럼 -->
       
      <OPTION id="title" value='title'>제목</OPTION>
<!--         <OPTION id="content" value='content'>내용</OPTION> -->
<!--         <OPTION id="writer_id" value='writer_id'>작성자아이디</OPTION> -->
<!--         <OPTION id="write_nick" value='write_nick'>작성자닉네임</OPTION> -->
      
      </SELECT>
      <input type='text' name='word' placeholder="특수문자는 사용할수 없습니다."> 
            <button id="searchBtn" >검색</button>    
    
  </FORM>
  </DIV>

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



