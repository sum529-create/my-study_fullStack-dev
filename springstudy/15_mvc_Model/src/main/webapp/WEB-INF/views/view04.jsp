<%@page import="com.koreait.mvc05.dto.PersonDto"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>view04.jsp</h3>

	<c:forEach var="personDto" items="${list}">
		<li>${personDto.name}</li>
		<li>${personDto.age}</li>
	</c:forEach>
</body>
</html>