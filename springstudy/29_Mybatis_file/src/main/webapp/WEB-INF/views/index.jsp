<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 이메일 인증 성공하면 게시판을 이용할 수 있습니다. -->
	<form action="emailAuth.do" method="post">
		게시판 이용을 위해서는 이메일 인증을 받으셔야 합니다.<br/><br/>
		이메일 입력
		<input type="text" name="email" autofocus/>
		<button>인증요청하기</button>
	</form>
	
	<!-- <a href="boardListPage.do">게시판으로 가기</a> -->
</body>
</html>