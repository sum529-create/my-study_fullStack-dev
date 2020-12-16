<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- Model-2 시작 --%>
	<%-- JSP는 VIEW이다. --%>
	<%-- JSP는 CONTROLLER(SERVLET)에게 요청한다. --%>

	<h3>MVC패턴으로 현재날짜 요청하기</h3>
	<input type="button" value="현재날짜요청" onclick="location.href='/12_MVC/DateController'"/>
	<!-- ContextPath + URLMapping -->
	
	<h3>MVC패턴으로 현재시간 요청하기</h3>
	<input type="button" value="현재시간요청" onclick="location.href='/12_MVC/TimeController'"/>
	
</body>
</html>