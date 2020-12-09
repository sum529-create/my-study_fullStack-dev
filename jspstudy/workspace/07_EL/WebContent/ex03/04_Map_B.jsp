<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// id와 pw를 DB로 보낸다고 생각해 봅시다.
		// 1. 따로 보낸다.
		// 2. id와 pw만 가진 bean을 만들어서 보낸다.
		// 3. id와 pwe만 가진 Map을 만들어서 보낸다.
		
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		
		// EL 사용을 위해서
		pageContext.setAttribute("map", map);
	%>
	<%-- Map은 bean처럼 사용할 수 있다. --%>
	<h3>아이디: ${map.id}</h3>
	<h3>비밀번호: ${map.pw}</h3>

</body>
</html>