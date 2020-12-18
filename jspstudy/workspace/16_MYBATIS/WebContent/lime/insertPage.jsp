<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="/16_MYBATIS/insert.lime" method="post">
		작성자<br/>
		<input type="text" name="writer"/><br/><br/>
		제목<br/>
		<input type="text" name="title"/><br/><br/>
		내용 <br/>
		<textarea rows="5" cols="50" name="content"></textarea><br/><br/>
		<button>삽입하기</button>
		<input type="reset" value="다시 작성하기"/>
		<input type="button" value="목록으로 이동" onclick = "location.href='/16_MYBATIS/listPage.lime'"/> 
	</form>
	
</body>
</html>