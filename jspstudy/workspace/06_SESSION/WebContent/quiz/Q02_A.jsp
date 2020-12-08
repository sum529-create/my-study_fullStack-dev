<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% session.invalidate(); %>

	<h3>신규 회원 정보를 입력하세요</h3>
	<form action="/06_SESSION/quiz/Q02_B.jsp" method = "post">
		<label for="lid">아이디</label>
		<input type="text" name="id" id="lid"><br/>
		<label for="lpw">비밀번호</label>
		<input type="password" name="pw" id="lpw"><br/>
		<label for="lname">이름</label>
		<input type="text" name="name" id="lname"><br/>
		<button>회원가입</button>
		
	</form>
</body>
</html>