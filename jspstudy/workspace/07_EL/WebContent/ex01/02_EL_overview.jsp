<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 표현식</h3>
	<ul>
		<li><%=7+2 %></li>
		<li><%=7-2 %></li>
		<li><%=7*2 %></li>
		<li><%=7/2 %></li>	<!-- 몫 -->
		<li><%=7%2 %></li>
	</ul>
	<h3>EL 표현언어</h3>
	<ul>
		<li>${7+2}</li>
		<li>${7-2}</li>
		<li>${7*2}</li>
		<li>${7/2}</li>	<!-- 나누기 값 -->
		<li>${7%2}</li>
	</ul>
	
	<% int a = 10; %>
	<h3>JSP 표현식</h3>
	<h3><%=a %></h3>
	<h3>EL 표현언어</h3>
	<% pageContext.setAttribute("a", a); %>
	<h3>${a}</h3>	<!--  데이터를 저장할 수 있는 영역이 아니기에.. ex) request.. -->
	
	<h3>우선순위의 확인</h3>
	<%
		pageContext.setAttribute("b", 1);
		request.setAttribute("b", 10);
		session.setAttribute("b", 100);
		application.setAttribute("b", 1000);
	%>
	
	<%-- 우선순위: (높음)pageContext > request > session > application(낮음) --%>
	
	<h3>어떤 값이 나타날까요? ${b}</h3>
	<h3>pageContext: ${pageScope.b}</h3>
	<h3>request: ${requestScope.b}</h3>
	<h3>session:${sessionScope.b}</h3>
	<h3>application: ${applicationScope.b}</h3>
</body>
</html>