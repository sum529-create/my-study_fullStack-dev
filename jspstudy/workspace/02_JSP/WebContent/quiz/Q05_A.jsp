<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#rand1, #rand2{
		border:none;
		width:10px;
	}
</style>
</head>
<body>
<%
	int rand1 = (int)(Math.random()*9)+1;
	int rand2 = (int)(Math.random()*9)+1;
	int i = (int)(Math.random()*5);
	String[] operators = {"+", "-", "*", "/", "%"};
%>
<%-- 	<form action="/02_JSP/quiz/Q05_B.jsp">
		<h3>랜덤 계산기</h3>
		<input type ="text" value="<%=rand1 %>" name="rand1" id="rand1">
		+<input type ="text" value="<%=rand2 %>" name="rand2"id="rand2">=
		<input type="text" name="result"/>
		<button>제출</button>
	</form> --%>
	<form action = "<%=request.getContextPath() %>/quiz/Q05_B.jsp">
		<%=rand1 %> <%=operators[i] %> <%=rand2 %> = 
		<input type="text" name = "result"/>
		<input type="hidden" name = "rand1" value="<%=rand1 %>"/>
		<input type="hidden" name = "rand2" value="<%=rand2 %>"/>
		<input type ="hidden" name="operator" value="<%=operators[i] %>"/>
		<button>제출</button> 
	</form>
	
</body>
</html>