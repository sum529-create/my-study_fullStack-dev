<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String player = request.getParameter("player");
		
		session.setAttribute("player", player);
		
		String name = (String)session.getAttribute("name");
		String person = (String)session.getAttribute("person");
	%>
</head>
<body>
	<h3><%=name%>님의 선호도 조사 결과</h3>
	<ul>
		<li>좋아하는 연예인 : <%=person %></li>
		<li>좋아하는 운동선수: <%=player %></li>
	</ul>
	<br><br>
	<input type="button" onclick="location.href= '/06_SESSION/quiz/Q01_A.jsp'" value="처음부터 다시하기">
</body>
</html>