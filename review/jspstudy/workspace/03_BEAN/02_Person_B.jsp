<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="p" class = "bean.Person"/>
	<jsp:setProperty property="*" name="p"/>
	<h3>이름: <jsp:getProperty property="name" name="p"></h3>
	<h3>나이: <jsp:getProperty property="age" name="p"></h3>
	<h3>성별: <jsp:getProperty property="gender" name="p"></h3>

</body>
</html>