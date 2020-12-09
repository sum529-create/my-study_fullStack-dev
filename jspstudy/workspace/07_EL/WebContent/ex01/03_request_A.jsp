<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 1. "속성"으로 만들어서 request 전달 --%>
	<%
		request.setAttribute("name", "제임스");
		request.getRequestDispatcher("03_request_B.jsp").forward(request, response); // 파일명만 작성
		
	%>
</body>
</html>