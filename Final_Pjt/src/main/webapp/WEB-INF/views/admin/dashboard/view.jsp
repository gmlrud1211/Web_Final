<%@ page contentType="text/html;charset=euc-kr" session="true"%>
<%
//     if (application.getAttribute("Counter") != null) {
//         String strCounter = String.valueOf(application.getAttribute("Counter"));
//         int counter = Integer.parseInt(strCounter) + 1;
//         // 페이지에 새로운 접속이 시도될때 Session 개체에 Counter를 1씩 증가시킨다.
//         application.setAttribute("Counter", counter);
//     } else {
//         application.setAttribute("Counter", 1);
//     }

%>
 
<HTML>
<HEAD>
<TITLE>Exercise 4_1</TITLE>
 
 
</HEAD>
<BODY>
     
    방문자수 : <%=application.getAttribute("Counter")%>
 
    <a href="#"> 새로고침 </a>
</BODY>
</HTML>