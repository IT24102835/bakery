<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>   
</head>
<body>
    <p>Logging out...</p>
</body>
</html>