<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	// String name = request.getParameter("name");		
	// 속성으로 저장된 값은 (setAttribute()) 파라미터가 아닙니다. getParameter()는 사용이 안됩니다.
	String name = request.getAttribute("name").toString();	// 속성은 "getAttribute() + 캐스팅" 해야합니다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>이름:<%=name %></h3>

</body>
</html>