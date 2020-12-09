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
	request.setCharacterEncoding("UTF-8");
	String[] singers = request.getParameterValues("singers");
			
%>

	좋아하는 가수1:	${singers[0]}
	좋아하는 가수2:	${singers[1]}
	좋아하는 가수3: ${singers[2]}
</body>
</html>