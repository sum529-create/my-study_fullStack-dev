<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String person = request.getParameter("person");
	
	session.setAttribute("name", name);
	session.setAttribute("person", person);
%>
</head>
<body>

	<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
	<form action="/06_SESSION/quiz/Q01_C.jsp">
		<input type="text" name="player"/>
		<button>결과보기</button>
	</form>

</body>
</html>