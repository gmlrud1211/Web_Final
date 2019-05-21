<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

	
<div class="total_check" style="font-size:20px">
	<!-- 결과값 카운트 -->
	<c:if test="${!empty keyword}"><strong> <span id="keyword" style="color:#827ffe;">${keyword }</span> 에 대한 검색결과입니다</strong></c:if>
	<strong>총<span id="resultCnt" style="color:#827ffe;"> <c:out value="${totalCnt}" /> </span> 건의 핫플레이스를 찾았어요 :) </strong>
</div>
	
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
						<img src="http://api.visitkorea.or.kr/static/images/common/noImage.gif" onclick="goPage('${list.contentid}','${list.contenttypeid }' );" alt="${list.title}" style="width: 300px; height: 230px; cursor:pointer;">
					</c:when>
					<c:otherwise>
						<img src="${list.firstimage}" onclick="goPage('${list.contentid}','${list.contenttypeid }' );" alt="${list.title }" style="width: 300px; height: 230px; cursor:pointer;">
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

<c:choose>
	<c:when test="${page <= 10}">
		<c:set var="startPage" value="${1}" />
		<c:set var="endPage" value="${10}" />
	</c:when>
	<c:when test="${page % 10 eq 0}">
		<fmt:parseNumber var="startPage" value="${(page-1)/10}" integerOnly="true" />
		<fmt:parseNumber var="endPage" value="${(page-1)/10}" integerOnly="true" />

		<c:set var="startPage" value="${startPage*10+1}" />
		<c:set var="endPage" value="${(endPage+1)*10}" />
	</c:when>
	<c:otherwise>
		<fmt:parseNumber var="startPage" value="${page/10}" integerOnly="true" />
		<fmt:parseNumber var="endPage" value="${page/10}" integerOnly="true" />

		<c:set var="startPage" value="${startPage*10+1}" />
		<c:set var="endPage" value="${(endPage+1)*10}" />
	</c:otherwise>
</c:choose>

<div style="text-align: center; padding: 50px; font-size: 20px;">
	<span onclick="prevPage();"> < </span>
	<c:forEach var="pageNum" begin="${startPage}" end="${totalCnt / 30 > endPage? endPage : (totalCnt / 30) + 1}">
		<c:choose>
			<c:when test="${pageNum eq page}"> 
				<span onclick="movePage('${pageNum}')"><b style="color:#827ffe">${pageNum } &nbsp;</b></span>
			</c:when>
			<c:otherwise>
				<span onclick="movePage('${pageNum}')">${pageNum}  &nbsp;</span>
			</c:otherwise>
		</c:choose>
		
	</c:forEach>
	<span onclick="nextPage();"> > </span>
</div>