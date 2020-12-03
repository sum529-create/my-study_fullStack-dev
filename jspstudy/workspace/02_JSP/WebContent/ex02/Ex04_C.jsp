<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num1 = 0, num2 = 0;
	String strNum1 = request.getParameter("num1");
	String strNum2 = request.getParameter("num2");
	if(strNum1 != null && !strNum1.isEmpty()){
		num1 = Integer.parseInt(strNum1);
	}
	if(strNum2 != null && !strNum2.isEmpty()){
		num2 = Integer.parseInt(strNum2);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=num1 %> + <%=num2 %> = <%=num1+num2 %></h3>
	<h3><a href="/02_JSP/ex02/Ex04_A.jsp">처음으로 이동</a></h3>
</body>
</html>