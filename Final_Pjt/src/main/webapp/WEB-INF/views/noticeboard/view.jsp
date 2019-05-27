<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btnList").click(
								function() {
									$(location).attr("href",
											"/noticeboard/list");
								});
				
					});
</script>
<style type="text/css">
ul{
list-style: none;
}
table {
	border-collapse: collapse;
	width: 100%;
}

td.info {
	border-bottom: 2px solid  grey;
	height: 50px;
}


.bt {
	background-color: #827ffe;
	color: white;
	font-size: 35px;
	border-style: none;
	border-radius: 5px;
}
li{
padding: 5px;
}


.asdfasdf li{border: 1px solid #e1e1e1;
    padding: 5px 20px;
    border-left: 0;
    border-right: 0;
    height: 50px;
    line-height: 40px;
    box-sizing: border-box;
    transition:all,1.5s;}
    
    
.asdfasdf li:hover{background: #f5f6f7; transition:all,1.5s;}
</style>

<div id="leftside" style="height: 100%; width: 20%; float: left;"></div>

<div class="container" style="width: 60%; float: left;">
    
    <form action="/noticeboard/view/" method="get">
    	<input type="hidden" name="notice_no" id="notice_no"value="${view.notice_no }" />
    </form> 
      
      
	<h3 style="    font-size: 40px;
    text-align: center;
    margin: 20px auto 50px;
    color: #827ffe;
    font-weight: normal;">공지사항</h3>

	<table class="table table-bordered"
		style="border-bottom: 2px solid grey; border-top: 2px solid grey;">
		<tbody>

			<tr>
				<td class="info" style="width: 5%;">제목</td>
				<td class="info" style="width: 50%; margin: 0 auto;">${view.notice_title }</td>
				<td class="info" style="width: 7%;">조회 : ${view.notice_count }</td>
				<td class="info" style="width: 15%; margin-right: 5px;"><fmt:formatDate
						value="${view.notice_date }" pattern="yyyy-MM-dd" /></td>
			</tr>

			<tr>
				<td colspan="4" style="height: 300px;vertical-align: top;
    padding: 20px;">
					<div>${view.notice_content }</div>
				</td>
			</tr>
		</tbody>
	</table>

	<ul class="prev-next asdfasdf">
		<li onclick="javascript:counsel.NoticeDetail.goDetail(this);">
		<strong><i class="xi-angle-up" style="text-align: right;"></i>&nbsp;&nbsp;
		다음글&nbsp;</strong>
			
			 <c:if test="${min_title eq null }">
			 	<a>다음글이 없습니다.</a>
			 </c:if>
		     
		     <c:if test="${min_title ne null }">
				<a href="/noticeboard/view?notice_no=${min_no }">${min_title }</a>
		     </c:if>
		</li>

		<li onclick="javascript:counsel.NoticeDetail.goDetail(this);">
		<strong><i class="xi-angle-down" style="text-align: right;"></i>&nbsp;&nbsp;
			이전글&nbsp;</strong>
			 <c:if test="${max_title eq null }">
			 	<a>이전글이 없습니다.</a>
			 </c:if>
		     
		     <c:if test="${max_title ne null }">
			<a href="/noticeboard/view?notice_no=${max_no }">${max_title }</a>
		     </c:if>
			
		</li>
	</ul>

	<div style="height: 20px; width: 100%; margin-top:20px;">
		<div class="text" style="height: 20px; width: 100%; margin: 0 atuo;">
			<button class="btn bt" id="btnList" style=" margin: 0 auto;
    display: block;
    text-align: center;
    padding: 10px 40px;
    box-sizing: border-box">목록</button>
		</div>
	</div>
</div>

<div id="rightside" style="height: 100%; width: 20%; float: left;"></div>



