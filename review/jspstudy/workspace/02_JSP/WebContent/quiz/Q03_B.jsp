<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String ent = request.getParameter("ent");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="/02_JSP/quiz/Q03_C.jsp">
		<h3>좋아하는 운동선수는?</h3>
		<input type="text" name="player">
		<input type="hidden" name="name" value="<%=name%>"/>
		<input type="hidden" name="ent" value="<%=ent%>"/>
		<button>전송</button>
	</form>
</body>
</html>