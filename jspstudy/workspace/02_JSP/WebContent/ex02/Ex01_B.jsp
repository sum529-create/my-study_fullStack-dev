<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// JSP는 이미 request를 가지고 있습니다. (내장객체)
	// 모든 JSP는 request를 그냥 쓸 수 있습니다.
	
	// 언제나 request는 인코딩부터 합니다.
	request.setCharacterEncoding("UTF-8");
	
	// request에 저장된 파라미터를 뺍니다.
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>
		<h3>첫 번째 파라미터: <%= num1 %></h3>
		<h3>두 번째 파라미터: <%= num2 %></h3>
		<h3><a href="/02_JSP/ex02/Ex01_C.jsp?num1=<%=num1%>&num2=<%=num2%>">이동</a></h3>
	</div>
	
</body>
</html>