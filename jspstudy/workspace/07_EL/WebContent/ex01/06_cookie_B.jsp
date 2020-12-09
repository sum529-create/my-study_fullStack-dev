<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 쿠키에 저장된 데이터 --%>
	<h3>이름: ${cookie.name }</h3>
	<h3>나이: ${cookie.age }</h3>

	<h3>이름 값: ${cookie.name.value}</h3>
	<h3>나이 값: ${cookie.age.value}</h3>
</body>
</html>