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
		session.setAttribute("name","에밀리"); 
		session.setAttribute("age", 20);
	%>
	
	<h3>이름: ${name}</h3>
	<h3>이름: ${age}</h3>
	
	<!-- 세션에 올라가면서 바로바로 처리가 된다. -->
	<h3>이름: ${sessionScope.name}</h3>
	<h3>이름: ${sessionScope.age}</h3>
	
</body>
</html>