<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>

	<%-- 1. String 타입의 파라미터 처리 --%>
	<h3>이름: ${param.name}</h3>

	<%-- 2. String[] 타입의 파라미터 처리 --%>
	<h3>취미:${paramValues.hobbies[0]}</h3>
	<h3>취미:${paramValues.hobbies[1]}</h3>
	<h3>취미:${paramValues.hobbies[2]}</h3>

	<%-- EL과 JSTL(추가태그: if, for)을 함께 사용합니다. --%>
	
	
	
	
</body>
</html>