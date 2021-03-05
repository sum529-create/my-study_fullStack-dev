<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="usersInsert.do" method="post">
		이름<br/>
		<input type="text" name="name" autofocus /><br/><br/>
		전화<br/>
		<input type="text" name="phone" /><br/><br/>
		<button>작성완료</button>
		<input type="button" value="목록보기" onclick="location.href='usersListPage.do'" />
	</form>

</body>
</html>