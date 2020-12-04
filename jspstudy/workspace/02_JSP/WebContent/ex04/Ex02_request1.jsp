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
		// request에 name 속성으로 제임스 저장하기
		request.setAttribute("name", "제임스");
		
		// request를 그대로 전달하는 이동 방법인 forward로 Ex02_request2.jsp로 이동
		request.getRequestDispatcher("/ex04/Ex02_request2.jsp").forward(request, response);
		
		
	%>

</body>
</html>