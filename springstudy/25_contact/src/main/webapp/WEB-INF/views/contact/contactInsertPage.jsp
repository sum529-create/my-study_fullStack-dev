<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>입력란</h3>

	<form action="contactInsert.do" method="post">
		이름<br/>
		<input type="text" name="name"/><br/><br/>
		핸드폰번호<br/>
		<input type="text" name="phone"/><br/><br/>
		주소<br/>
		<input type="text" name="address"/><br/><br/>
		이메일<br/>
		<input type="text" name="email"/><br/><br/>
		내용<br/>
		<input type="text" name="note"/><br/><br/>
		<button>확인</button>
	</form>
</body>
</html>