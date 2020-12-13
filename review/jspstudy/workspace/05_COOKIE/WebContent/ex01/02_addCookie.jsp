<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
	
		Cookie cookie = new Cookie("nickname", URLEncoder.encode("james", "UTF-8")); 
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
	%>
	<h3>쿠키이름:<%=cookie.getName() %></h3>
	<h3>쿠키유효시간: <%=cookie.getMaxAge() %></h3>
	<h3>쿠키값: <%=URLDecoder.decode(cookie.getValue(), "UTF-8") %></h3>
</body>
</html>
