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
		int num1 = (int)(Math.random()*9)+1;
		int num2 = (int)(Math.random()*9)+1;
		int i = (int)(Math.random()*5);
		String[] symbol = {"+", "-", "*", "/", "%"}; 
	%>
	
	<form action="Q05_B.jsp" method="get">
		<%=num1 %> <%=symbol[i] %> <%=num2 %>=
		<input type="text" name="answer">
		<input type="hidden" name="num1" value="<%=num1 %>"/>
		<input type="hidden" name="num2" value="<%=num2 %>"/>
		<input type="hidden" name="symbol" value="<%=symbol[i] %>"/>
		<button>제출</button>
	</form>
</body>
</html>