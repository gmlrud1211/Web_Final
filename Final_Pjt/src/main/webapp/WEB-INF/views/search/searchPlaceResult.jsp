<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<div class="total_check">
	<!-- 결과값 카운트 -->
	<strong>총<span id="resultCnt"> <c:out value="${totalCnt}" /> 건 </span></strong>
</div>
			
<%-- <ul class='list_thumType'>
	<c:forEach var="list" items="${placeList }" varStatus="i">
		<li>
			<div>
				<div class='div1'>
					<div>
					
					<c:choose>
						<c:when test="${empty list.firstimage1 or list.firstimage1 eq 'null'}">
							<img src="http://api.visitkorea.or.kr/static/images/common/noImage.gif" alt='대표이미지'
								style="width: 300px; height: 200px">
						</c:when>
						<c:otherwise>
							<img src="${list.firstimage1}" alt="${list.title }" style="width: 300px; height: 200px">
						</c:otherwise>
					</c:choose>
					
					<hr>
				</div>
			</div>
			<div class="area_txt">
				<div class="${list.contentid }">
					<a href="javascript:void(0);" onclick="goPage('${list.contentid}','${list.contenttypeid }' );">${not empty list.title? list.title : '' } </a>
				</div>
				<div class="addr">
					<p>${not empty list.addr1? list.addr1 : ''}</p>
				</div>
			</div>
		</li>
	</c:forEach>
</ul> --%>

<table>
	<tbody>
		<c:forEach var="list" items="${placeList }" varStatus="i">
			<c:choose>
				<c:when test="${i.index % 3 eq 0}">
					</tr><tr>
				</c:when>
			</c:choose>
			
			<td style="padding:20px;">
				<c:choose>
					<c:when test="${empty list.firstimage or list.firstimage eq 'null'}">
						<img src="http://api.visitkorea.or.kr/static/images/common/noImage.gif" onclick="goPage('${list.contentid}','${list.contenttypeid }' );" alt="${list.title}" style="width: 300px; height: 200px; cursor:pointer;">
					</c:when>
					<c:otherwise>
						<img src="${list.firstimage}" onclick="goPage('${list.contentid}','${list.contenttypeid }' );" alt="${list.title }" style="width: 300px; height: 200px; cursor:pointer;">
					</c:otherwise>
				</c:choose>
				<br />
				<a href="javascript:void(0);" onclick="goPage('${list.contentid}','${list.contenttypeid }' );">
				<c:choose>
					<c:when test="${empty list.title or list.title eq 'null'}"></c:when>
					<c:otherwise>
						<p style="margin:10px 0 10px; font-size:15px">${list.title }</p>
					</c:otherwise>
				</c:choose>
				</a>
				<c:choose>
					<c:when test="${empty list.addr1 or list.addr1 eq 'null'}"></c:when>
					<c:otherwise>
						${list.addr1 }
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty list.addr2 or list.addr2 eq 'null'}"></c:when>
					<c:otherwise>
						${list.addr2 }
					</c:otherwise>
				</c:choose>
			</td>
		</c:forEach>
	</tbody>
</table>

<div>
	<<
	<c:forEach var="pageNum" begin="${page/10 eq 0? 1 : page/10}" end="${(page/10+1)*10 }">
		<c:choose>
			<c:when test="${pageNum eq page}">
				<span onclick="movePage('${pageNum}')"><b style="co">${pageNum }</b></span>
			</c:when>
			<c:otherwise>
				<span onclick="movePage('${pageNum}')">${pageNum}</span>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	>>
</div>