<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<form action="/admin/banner/updatefileup" method="post" enctype="multipart/form-data">
파일선택 <input type="file" name="file" /><br><br>

<input type="hidden"id="file_no" name="file_no" value="${session.file_no }" />

<button style="color:#ffffff; background:#F67280">업로드</button>
<button onclick="window.close();" style="color:#ffffff; background:#F67280">취소</button>
</form>

<!-- enctype="application/x-www-form-urlencoded" -->
	<!-- form 데이터를 기본적인 쿼리스트링 형태로 인코딩 -->
	<!-- title=123123&name=ABCDE -->

<!--  enctype="multipart/form-data" -->
	<!-- file을 서버로 전송하기 위해 사용하는 인코딩 -->
	<!-- 파일의 내용을 서버로 전송해준다 -->
	
</body>
</html>





















