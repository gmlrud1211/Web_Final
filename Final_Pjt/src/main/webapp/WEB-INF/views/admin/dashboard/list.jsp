<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>



<style>
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			//클릭이벤트가 발생한 <tr>의 첫번째 <td>자식의 텍스트
			var u_no = $(this).children("td").eq(0).text();

			$(location).attr("href", "/admin/user/view?u_no=" + user_no);
		});

		//글쓰기 버튼 이벤트
		$("#btnWrite").click(function() {
			location.href = "/admin/user/write";
		});

		//회원 삭제 이벤트
		$("#delete").click(function() {
			$(location).attr("href", "/admin/user/delete?u_no=" + user_no);
		});

	});
</script>


<style type="text/css">
table {
	width: 100%;
}

th {
	text-align: center !important;
}

th,td:not(:nth-child(2)){
text-align:center;
}

td {
	text-align: center;
	border-left: 1px solid white;
	border-right: 1px solid white;
}

td.info {
	background-color: grey;
}

#btnBox {
	text-align: right;
}

ul.pagination {
	list-style: none;
	text-align: center
}

ul.pagination li {
	display: inline-block;
}


.aaaaaaa {
	overflow: hidden;
}

.aaaaaaa li {
	float: left;
	width: 50%;
}
</style>


<style type="text/css">

.jb-wrap {
border : 1px solid #c2b7c6;
    width: 75%;
    height: 220px;
    margin : 15px auto;
    padding : 15px;
}

.jb-wrap-img {
padding :5px;
margin: 0 auto;
width: 50%;
}

.jb-text{
padding :5px;
margin: 0 auto;
width: 50%;
}

p{
font-size : 20px;
font-family: fantasy;
font-weight: 500;
}

li.group {
height : 100%;  
}
</style>
</head>

<body>
<div style="border-bottom: 1px solid grey; height: 95px; padding-top: 5px;">
<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
</div>

	<div id="menu" style="background-color: #d7d3d447; border-right:#D8D8D8; height: 2260px; width: 20%; float: left;">
		<jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
	</div>

	<div id="content"
		style="padding: 10px; width: 950px; margin: 0 auto; border-left: 1px solid #D8D8D8; height: 100%; float: left;">

		<h5 style="font-size: 25px;">대시보드</h5>
		<hr>

		<ul id="navi" class="aaaaaaa" style="width: 100%; height: 100%; margin: 0 auto;">
			<li class="group">

				<div class="jb-wrap">
					<div class="jb-wrap-img">
						<img alt="달력" src="/img/cal.jpg" width="150px" height="150px">
					</div>
					 <div class="jb-text">
						<p>일정 비공개 : ${calno}</p>
						<p>일정 공개 : ${calyes }</p>
						</div>
				</div> 

			</li>
			
			<li class="group">
				<div class="jb-wrap">
					<div class="jb-wrap-img" style="padding :10px;">
						<img alt="새 가입자" src="/img/newuser.jpg" width="150px" height="150px">
					</div>

                     <div class="jb-text">
						<p>새로운가입자 : ${newuser }</p>
				     </div>
				
				</div> 

			</li>
			
			
			<li class="group">
				<div class="jb-wrap">

					<div class="jb-wrap-img">
						<img alt="총방문자수" src="/img/total.png" width="150px" height="150px">
					</div>
					
					 <div class="jb-text">
						<p>총 방문자수 : ${sessionScope.totalCount}</p>
					 </div>
					 
				</div>

			</li>
			
			<li class="group" style=>
				<div class="jb-wrap">
					<div class="jb-wrap-img" >
						<img alt="오늘방문자수" src="/img/today.jpg" width="150px" height="150px" >
					</div>
                        <div class="jb-text">
						<p>오늘 방문자 수 : ${sessionScope.todayCount}</p>
						</div> 
				</div>
			</li>
		</ul>
	</div>

	<div style="clear: both;">
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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