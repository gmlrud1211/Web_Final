<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<meta charset="UTF-8">
<title>북마크</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
		
<link rel="stylesheet" href="/js/bootstrap.js"/>
<link rel="stylesheet" href="/js/bootstrap.min.js"/>
		
<link rel="stylesheet" href="/css/bootstrap.css"/>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>


<script type="text/javascript">

	function bookmark_del(bookmark_no) {
		var con = confirm("일정을 정말로 찜에서 삭제하시겠어요?");
		if(con){
			location.href="/mypage/bookmark/delete?bookmark_no="+bookmark_no;
		}
	}
</script>


<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
<hr style="color:#ccc;">

	<div class="row row-offcanvas row-offcanvas-right">
	<jsp:include page="../layout/mypage.jsp"/>
		
	<div class="col-xs-12 col-sm-9">
			
		<div class="jumbotron" style="padding: 5px; background-color: #eee0; border-bottom: 1px solid #403866; border-radius: 0;" >
			<h3>마이페이지-즐겨찾기</h3>
	        <p style="font-size: 16px">찜한일정 조회</p>
	    </div>
	    
		<div class="row">
			<c:if test="${bookmark_list.size()>0}"> 
			<c:forEach var="i" begin="0" end="${bookmark_list.size()-1}">
				<div class="col-xs-6 col-lg-4">
					<input type="button" value="X" onclick="bookmark_del(${bookmark_list.get(i).bookmark_no});"/>
					<div><a href="#"><img src="default.jpg" onerror="this.src='noimage.png'" style="width:250px; height:200px"></a></div>
				</div>
			</c:forEach>
			</c:if>
			
			<c:if test="${bookmark_list.size() eq 0 }">
				<div style="text-align:center;">
					<h4>찜한 일정이 없습니다.</h4>				
				</div>
			</c:if>
		</div>

	</div>
	</div>

</div>

</body>
