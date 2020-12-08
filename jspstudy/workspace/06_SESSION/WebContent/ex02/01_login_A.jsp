<%@page import="bean.User"%>
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
		User loginUser = (User)session.getAttribute("loginUser");
	%>
	
	<%if (loginUser == null) {%>
		<form action="/06_SESSION/ex02/01_login_B.jsp">
			<input type="text" name="id"><br>		<!-- bean패키지의 User 값을 사용명시 -->
			<input type="password" name="pw"><br>
			<button>로그인</button>
		</form>
	<%}else{ %>
		<%=loginUser.getId()%>님 반갑습니다.<br><br>
		<form action="/06_SESSION/ex02/01_login_C.jsp">
			<button>로그아웃</button>
		</form>
	<%} %>
</body>
</html>