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
		session.invalidate();
	%>
	
	<form action="/06_SESSION/quiz/Q01_B.jsp">
		설문작성자<br>
		<input type="text" name="name"/>
		<h3>좋아하는 연예인은 누구인가요?</h3>
		<input type="text" name="person"/>
		<button>다음</button>
	</form>
</body>
</html>