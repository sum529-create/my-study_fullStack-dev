<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String person = request.getParameter("person");
	String player = request.getParameter("player");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=name %>님의 선호도 조사 결과</h3>
	<ul>
		<li>좋아하는 연예인 : <%=person %></li>
		<li>좋아하는 운동선수 : <%=player %></li>
	</ul>
	<input type="button" value="처음부터 다시하기" onclick="location.href='/02_JSP/quiz/Q03_A.jsp'" />
</body>
</html>