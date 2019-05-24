<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

   var loninConfirm = confirm("로그인 후 이용해주세요");
   if(loninConfirm){
      location.href = "/login"; 
   } else {
      location.href = "/community";
   }

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>