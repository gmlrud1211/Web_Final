<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="/file/fileup" method="post" enctype="multipart/form-data">

<label for="title"> 제목 </label>
<input type="text" name="title" id="title"/> <br>

<label for="file"> 파일등록 </label>
<input type="file" name="file" id="file"/> <br>
 
<button> 전송 </button>

</form>

<form action="/file/list" method="get">

<button> 리스트로 이동 </button>

</form>


</body>
</html>