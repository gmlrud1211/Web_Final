<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>챗봇관리</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
#container {
	width: 1100px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.subtab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}

.subtab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}

.subtab li a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
}

.tabcon {
	display: none;
	padding: 6px 12px;
	width : 90%;
}

ul.tab li.current {
	background-color: #827ffe;

}

ul.tab li.current a{
   color : white;
}

ul.tab li {
	border : 1px solid grey;
	width: 140px;
	height: 40px;
	padding-bottom : 10px;
	    
}

ul.subtab li.current {
	background-color: #dfdfe5; 
}

ul.subtab li {
	color : gray;
}

.tabcontent.current {
	display: block;
	border: 1px solid grey;
}

.tabcon {
	display: none;
}

.tabcon.current {
	display: block;
}

table.table tr{
 width : 170px;
 height: 50px;
}

table.table tr.answer{
background-color : #eceaea;
}

table.table tbody{
width : 100%

}
</style>
<style>
.header ul{width:302px}
ul{
width : 900px; 
}
tr.question{
 border-bottom :1px solid grey;
}

#container>div {
	border: none;
}

#container>div {
	position: relative;
	height:600px;
}

#container>div>table {
	position: absolute;
	top: 70px;
	left: 0;
}

.cb {
   border-top : 1px solid gray;
   position : absolute;
   top : 70px;
   width: 810px;
}

.cd{
  clear: both;
}

td.ss{
width : 1100px; 
height: 35px;
}
.bt{
background-color : #827ffe;
color : white;
font-size : 35px;
border-style :none;
border-radius: 5px;
}
</style>

</head>
<body>

	<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</div>
	

	<div id="menu" style="background-color: #d7d3d447; border-right: #D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

	<div id="container" style="
	padding:10px; width:1100px; margin: 40px; height:100%; max-width: 1110px; float:left; ">
 
	<h5 style="font-size: 25px; text-align: start;">챗봇관리</h5>	
 
       <br>
		<ul class="tab" style="width:100%;">
			<li class="current" data-tab="tab1"><a href="#">회원관련</a></li>
			<li data-tab="tab2"><a href="#">사이트관련</a></li>
			<li data-tab="tab3"><a href="#">캘린더관련</a></li>
			<li data-tab="tab4"><a href="#">커뮤니티</a></li>
			<li data-tab="tab5"><a href="#">챗봇관련</a></li>
			<li data-tab="tab6"><a href="#">기타</a></li>
		</ul>

		<div id="tab1" class="tabcontent current">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">회원가입</a></li>
				<li data-tab="mtab2"><a href="#">개인정보</a></li>
				<li data-tab="mtab3"><a href="#">정보수집</a></li>
			</ul>
			 <%
				int i = 1;
				int mno = 101;
			 %>

			 <c:forEach var="i" begin="1" end="3">
				<c:set value="<%=mno%>" var="mno"></c:set>
				<div id="mtab<%=i%>" class="tabcon mmmtab<%=i%> cb">
					<%
						i++;
					%>
					<%
						mno++;
					%>
					
					<table class="table table-hover table-striped table-condensed cd" >
						<c:forEach items="${schatlist }" var="slist">
							<c:if test="${slist.mChat_no == mno}">
								<colgroup>
									<col width="*">
									<col width="10%">
									<col width="10%">
								</colgroup>

								<tr class="question">
									<td class="ss" style="height: 20px;text-align: left; padding-left: 20px">
									<i class="xi-lightbulb-o">&nbsp;&nbsp;</i>${slist.sChat_name }</td>
									
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td colspan="3" style="text-align: left; padding-left: 20px">
									${slist.sChat_answer } <i class="xi-angle-up" style="text-align:right;"></i></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</c:forEach>
		</div>

		<div id="tab2" class="tabcontent">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">About
						올댓핫플레이스</a></li>
				<li data-tab="mtab2"><a href="#">사이트 이용관련</a></li>
				<li data-tab="mtab3"><a href="#">사이트 장애</a></li>
			</ul>

			<%
				int j = 1;
				int mno2 = 201;
			%>

			<c:forEach var="j" begin="1" end="3">
				<c:set value="<%=mno2%>" var="mno2">
				</c:set>
				<div id="mtab<%=j%>" class="tabcon mmmtab<%=j%> cb">
					<%
						j++;
					%>
					<%
						mno2++;
					%>

					<table class="table table-hover table-striped table-condensed cd">
						<c:forEach items="${schatlist }" var="slist">
							<c:if test="${slist.mChat_no == mno2}">
								<colgroup>
									<col width="*">
									<col width="10%">
									<col width="10%">
								</colgroup>

							<tr class="question">
									<td class="ss" style="text-align: left; padding-left: 20px">${slist.sChat_name }</td>
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td colspan="3" style="text-align: left; padding-left: 20px">${slist.sChat_answer }</td>
								</tr>

							</c:if>
						</c:forEach>

					</table>
				</div>
			</c:forEach>
		</div>

		<div id="tab3" class="tabcontent">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">캘린더 이용관련</a></li>
			</ul>
			<%
				int r = 1;
				int mno3 = 301;
			%>

			<c:forEach var="r" begin="1" end="3">
				<c:set value="<%=mno3%>" var="mno3"></c:set>
				<div id="mtab<%=r%>" class="tabcon mmmtab<%=r%> cb">
					<%
						r++;
					%>
					<%
						mno3++;
					%>
			<table class="table table-hover table-striped table-condensed cd">
				<c:forEach items="${schatlist }" var="slist">
					<c:if test="${slist.mChat_no == mno3}">
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>

						<tr class="question">
									<td class="ss" style="text-align: left; padding-left: 20px">${slist.sChat_name }</td>
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td colspan="3" style="text-align: left; padding-left: 20px">${slist.sChat_answer }</td>
								</tr>


					</c:if>
				</c:forEach>
			</table>
         		</div>
         		</c:forEach>
		</div>

		<div id="tab4" class="tabcontent">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">커뮤니티 이용관련</a></li>
			</ul>

			<%
				int q = 1;
				int mno4 = 401;
			%>

			<c:forEach var="q" begin="1" end="3">
				<c:set value="<%=mno4%>" var="mno4">
				</c:set>
				<div id="mtab<%=q%>" class="tabcon mmmtab<%=q%> cb">
					<%
						q++;
					%>
					<%
						mno4++;
					%>
			
			<table class="table table-hover table-striped table-condensed cd">
				<c:forEach items="${schatlist }" var="slist">
					<c:if test="${slist.mChat_no == mno4}">
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>

						<tr class="question">
									<td class="ss" style="text-align: left; padding-left: 20px">${slist.sChat_name }</td>
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td colspan="3" style="text-align: left; padding-left: 20px">${slist.sChat_answer }</td>
								</tr>

					</c:if>
				</c:forEach>

			</table>
			</div>
			</c:forEach>
		</div>

		<div id="tab5" class="tabcontent">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">챗봇 이용관련</a></li>
			</ul>

			<%
				int w = 1;
				int mno5 = 501;
			%>

			<c:forEach var="w" begin="1" end="3">
				<c:set value="<%=mno5%>" var="mno5">
				</c:set>
				<div id="mtab<%=w%>" class="tabcon mmmtab<%=w%> cb">
					<%
						w++;
					%>
					<%
						mno5++;
					%>

			<table class="table table-hover table-striped table-condensed cd">
				<c:forEach items="${schatlist }" var="slist">
					<c:if test="${slist.mChat_no == mno5}">
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>

						<tr class="question">
									<td class="ss" style="text-align: left; padding-left: 20px">${slist.sChat_name }</td>
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td colspan="3" style="text-align: left; padding-left: 20px">${slist.sChat_answer }</td>
								</tr>

					</c:if>
				</c:forEach>

			</table>
			</div>
			</c:forEach>
		</div>

		<div id="tab6" class="tabcontent">
			<ul class="subtab" style="float: left;">
				<li class="current" data-tab="mtab1"><a href="#">검색 관련</a></li>
				<li data-tab="mtab2"><a href="#">마이페이지</a></li>
			</ul>

			<%
				int t = 1;
				int mno6 = 601;
			%>

			<c:forEach var="t" begin="1" end="2">
				<c:set value="<%=mno6%>" var="mno6">
				</c:set>
				<div id="mtab<%=t%>" class="tabcon mmmtab<%=t%> cb">
					<%
						t++;
					%>
					<%
						mno6++;
					%>
			<table class="table table-hover table-striped table-condensed cd">
				<c:forEach items="${schatlist }" var="slist">
					<c:if test="${slist.mChat_no == mno6}">
						<colgroup>
							<col width="*">
							<col width="10%">
							<col width="10%">
						</colgroup>

						<tr class="question">
									<td class="ss" style="text-align: left; padding-left: 20px">${slist.sChat_name }</td>
									<td id="modify"><a
										href="/admin/chatbot/modify?sChat_no=${slist.sChat_no } ">수정</a></td>
									<td id="delete"><a
										href="/admin/chatbot/delete?sChat_no=${slist.sChat_no }">삭제</a></td>
								</tr>

								<tr class="answer">
									<td class="sss" colspan="3" style="text-align: left; padding-left: 20px">${slist.sChat_answer }</td>
								</tr>
					</c:if>
				</c:forEach>

			</table>
			</div>
			</c:forEach>
		</div>
	<div>
		<button id="btnWrite" class="btn btn-primary bt"
			style="text-align: center; margin-top: 240px; margin-right: 150px;">등록</button>
	</div>
	</div>

	<script>
	
		$(function() {
			$(".mmmtab1").addClass('current');

			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});

			$('ul.subtab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.subtab li').removeClass('current');
				$(this).parent().siblings('.tabcon').removeClass('current');
				$(this).addClass('current');
				$(this).parent().siblings('#' + activeTab).addClass('current');
			});
			
		});

			//모든 답변 가림 
			$(".answer").css({
				display : "none"
			});

			$(".question").click(function() {
				$(this).next().toggle();
				$(this).parent().siblings("tbody").find(".answer").hide();
			});

			//글쓰기 버튼 이벤트
			$("#btnWrite").click(function() {
				location.href = "/admin/chatbot/write"
			});

			$("#delete").click(function() {
			$(location).attr("href","/admin/chatbot/delete?sChat_no=" + sChat_no);
					});
		
	</script>

</body>
</html>

