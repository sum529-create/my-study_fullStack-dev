<%@page import="com.koreait.mvc05.dto.PersonDto"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>view03.jsp</h3>

	<ul>
		<li>이름: ${personDto.name}</li>
		<li>나이: ${personDto.age}</li>
	</ul>
</body>
</html>