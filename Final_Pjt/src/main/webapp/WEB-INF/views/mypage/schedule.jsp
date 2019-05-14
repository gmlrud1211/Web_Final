<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta charset="UTF-8">
<title>일정관리</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
<link rel="stylesheet" href="/js/bootstrap.js"/>
<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
<link rel="stylesheet" href="/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>

<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
<hr style="color:#ccc;">
		
	<div class="row row-offcanvas row-offcanvas-right">
	<jsp:include page="../layout/mypage.jsp"/>

		<div class="col-xs-12 col-sm-9">
			<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
				<h3>ScheduleList<h3><br>
	            <p style="font-size: 16px">나만의 일정을 만들어 보세요~!</p>
	        </div>
			
		

		</div>
	</div>
</div>
</body>
