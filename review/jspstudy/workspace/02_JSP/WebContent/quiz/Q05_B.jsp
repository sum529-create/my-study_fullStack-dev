<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "Q05_C.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int answer = Integer.parseInt(request.getParameter("answer"));
	String symbol = request.getParameter("symbol"); 

	int result = 0;
	
	switch(symbol){
	case "+":
		result = num1 + num2;
		break;
	case "-":
		result = num1 - num2;
		break;
	case "*":
		result = num1 * num2;
		break;
	case "/":
		result = num1 / num2;
		break;
	case "%":
		result = num1 % num2;
		break;
	}
	
	String content = "";
	if(result == answer){
		content += num1 + symbol + num2 + "=" + result + "<br>" + "정답입니다."; 
	}else{
		content += "제출: " + num1 + symbol + num2 + "=" + answer + "<br>정답: " + num1 + symbol + num2 + "=" + result; 
	}
%>
	<%=content %>
	<br><br>
	<a href="Q05_A.jsp">다시풀기</a>
</body>
</html>