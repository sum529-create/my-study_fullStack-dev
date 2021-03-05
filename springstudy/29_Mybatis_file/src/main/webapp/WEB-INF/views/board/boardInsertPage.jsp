<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 첨부시에 필요한 form -->
	<form action="boardInsert.do" method="post" enctype="multipart/form-data">	
		작성자<br/>
		<input type="text" name="writer"/><br/><br/>
		제목<br/>
		<input type="text" name="title"/><br/><br/>
		내용<br/>
		<input type="text" name="content"/><br/><br/>
		첨부<br/>
		<input type="file" name="files"/><br/><br/>
		
		<button>작성완료</button>
		
	</form>
	
</body>
</html>