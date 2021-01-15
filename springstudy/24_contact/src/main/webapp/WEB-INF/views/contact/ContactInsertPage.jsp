<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="contactInsert.do" method="post">
		이름<br/>
		<input type="text" name="name"/><br/><br/>
		전화<br/>
		<input type="text" name="phone"/><br/><br/>
		주소<br/>
		<input type="text" name="address"/><br/><br/>
		이메일<br/>
		<input type="text" name="email"/><br/><br/>
		비고<br/>
		<input type="text" name="note"/><br/><br/>
		<button>연락처 저장하기</button>
		<input type="button" value="전체연락처" onclick="location.href='contactListPage.do'"/> 
	</form>
	
</body>
</html>