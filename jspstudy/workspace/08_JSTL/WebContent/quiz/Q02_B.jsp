<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>일반 forEach 연습</h3>
	<c:forEach var="i" begin="${param.min}+1" end="${param.max}" step="1">		
		<font size="${i}">폰트 사이즈:${i}</font><br/>
	</c:forEach>
	<h3>향상 forEach 연습</h3>
	<c:forEach var="food" items="${paramValues.foodwjen}" varStatus="k">
		<ul>
			<li>${k.count}번째 음식:${food}</li>
		</ul>
	</c:forEach>
</body>
</html>