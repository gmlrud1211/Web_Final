<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../views/common/meta.jsp" />

<c:set var="page" value="1" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<script type="text/javascript">
	var areaPage = 1;
	function onenter(){
		var word = $("#word").val();
		if (!word) {
			word = '${word}';
		}
		var page = areaPage;

		$.ajax({
			type : "post",
			url : "/mainsearch",
			data : {
				"word" : word,
				"page" : page

			},
			dataType : "html",
			success : function(html) {
				$("#resultPlace").html(html);
				$('html').scrollTop(0);
				console.log(page);
			}

			,
			error : function(e) {
				console.log('error!');
				console.log(e);
			}
		});
	}
	$(document).ready(function() {

		$("#btnSearch").click(function() {
			var word = $("#word").val();
			if (!word) {
				word = '${word}';
			}
			var page = areaPage;

			$.ajax({
				type : "post",
				url : "/mainsearch",
				data : {
					"word" : word,
					"page" : page

				},
				dataType : "html",
				success : function(html) {
					$("#resultPlace").html(html);
					$('html').scrollTop(0);
					console.log(html);
				}

				,
				error : function(e) {
					console.log('error!');
					console.log(e);
				}
			});
		});

	})

	function goPage(contentid, contenttypeid) {
		location.href = "/detail?contentId=" + contentid + "&contentTypeId="
				+ contenttypeid;
	};

	function movePage(page) {
		areaPage = page;

		$("#btnSearch").click();
	};
</script>
<style>
/*  .searchcontext{display:inline; min-width:600px; border-top:1px;} */
.searchwrap {
	height: 100%;
	width: 100%;
	margin: 0px auto;
	overflow: hidden;
	padding: 10px 0;
	box-sizing: border-box;
}

.photo {
	float: left;
	width: 30%;
	height: 100%
}

.photo img {
	width: 100%;
	height: 100%
}

.textarea {
	float: left;
	width: 67%;
	margin-left: 3%;
	font-size: 25px;
}

.textarea h3 {
	font-size: 18px;
	font-weight: bold;
}

.textarea p {
	font-size: 14px;
}

.wrap {
	width: 600px;
	margin: 0 auto;
}

.searchdiv {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	text-align: center;
	position: relative;
}

.searchdiv input {
	width: 100%;
	height: 50px;
	border: 2px solid #827ffe;
	padding-left: 20px;
}

.searchdiv button {
	position: absolute;
	top: 0px;
	right: 0px;
	width: 50px;
	height: 50px;
	background: #827ffe;
	border: 1px solid #827ffe;
}

.searchdiv button i {
	font-size: 30px;
}

.tagbox {
	list-style: none;
	overflow: hidden;
	padding: 0;
	margin: 20px 0;
}

.tagbox li {
	float: left;
	margin-right: 10px;
}

.tagbox li a {
	font-size: 20px;
	color: #aaa;
	font-weight: bold;
	transition: all, .5s;
}

.tagbox li a:hover {
	color: #827ffe;
	transition: all, .5s
}

.tagbox li:after {
	padding-left: 10px;
	content: "|";
	font-size: 20px;
	vertical-align: top
}

.tagbox li:last-child:after {
	content: "";
}

.total_check {
	position: relative;
	width: 600px;
	padding: 15px 0 13px;
	font-weight: 700;
	border-top: 1px solid #999;
}

.bar_wrap {
	border-top: 2px solid #827ffe
}

.bar {
	border-bottom: 1px solid #827ffe;
	width: 100%;
	height: 200px;
	margin: 0 auto;
}

.totalsearch {
	font-size: 24px;
	margin: 10px 0;
}

.totalsearch span {
	font-size: 28px;
	font-weight: bold;
	color: #827ffe;
}
</style>

<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #827ffe;
}
</style>


<body>
	<div class="wrap">
		<div class="sub_wrap">
			


			<!-- 			<ul class="tagbox"> -->
			<!-- 				<li><a href="#">전체</a></li> -->
			<!-- 				<li><a href="#">추천</a></li> -->
			<!-- 				<li><a href="#">코스</a></li> -->
			<!-- 				<li><a href="#">여행지</a></li> -->
			<!-- 				<li><a href="#">축제</a></li> -->
			<!-- 				<li><a href="#">이미지/동영상</a></li> -->
			<!-- 				<li><a href="#">기타</a></li> -->
			<!-- 			</ul> -->
			<div id="resultPlace">
				<div class="searchdiv" style="margin-top: 56px;">
					
						<input type="text" name="word" id="word" placeholder="검색어 입력">
	
						<button type="button" id="btnSearch" onkeydown="javascript:if(event.keyCode==13){onenter();}">
							<i class=xi-search></i>
						</button>
					
				</div>

				<p class="totalsearch">
					총 <span>${totalCnt }</span> 건
				</p>

				<div class="bar_wrap">


					<c:forEach var="list" items="${placeList }" varStatus="i">
						<div class="bar">
							<div class="searchwrap">
								<div class="photo">

									<c:choose>
										<c:when
											test="${empty list.firstimage or list.firstimage eq 'null'}">
											<img
												src="http://api.visitkorea.or.kr/static/images/common/noImage.gif"
												onclick="goPage('${list.contentid}','${list.contenttypeid }' );"
												alt="${list.title}">
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0);"
												onclick="goPage('${list.contentid}','${list.contenttypeid }' );">
												<img src="${list.firstimage}" alt="${list.title }">
											</a>
										</c:otherwise>
									</c:choose>
								</div>

								<div class="textarea">

									<h3>
										<a href="javascript:void(0);"
											onclick="goPage('${list.contentid}','${list.contenttypeid }' );">${list.title }</a>
									</h3>
									<c:choose>
										<c:when test="${empty list.addr1 or list.addr1 eq 'null'}">
											<p class="tag">'null'</p>
										</c:when>
										<c:otherwise>
											<p class="tag">${list.addr1 }</p>
										</c:otherwise>
									</c:choose>
								</div>

							</div>
						</div>
					</c:forEach>


				</div>



				<div>
					
					<c:forEach var="pageNum" begin="${1}"
						end="${(totalCnt/30) +1 }">
						<c:choose>
							<c:when test="${pageNum eq page}">
								<span onclick="movePage('${pageNum}')"><b style="">${pageNum }</b></span>
							</c:when>
							<c:otherwise>
								<span onclick="movePage('${pageNum}')">${pageNum}</span>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					
				</div>



			</div>
		</div>
</body>
</html>