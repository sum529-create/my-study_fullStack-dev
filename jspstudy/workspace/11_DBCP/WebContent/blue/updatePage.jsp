<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String postDate = request.getParameter("postDate");
	
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input[readonly]{
		background: silver;
	}
</style>
</head>
<body>

	<form name= "f"
			method="post"
			action="/11_DBCP/blue/update.jsp"
			onsubmit="return fn_update()">
		게시글 번호<br/>
		<input type="text" name="no" value="${param.no}" readonly/><br/><br/>
		작성자<br/>
		<input type="text" name="writer" value="${param.writer}" readonly/><br/><br/>
		제목<br/>
		<input type="text" name="title" value="${param.title}"/><br/><br/>
		내용<br/>
		<textarea rows="5" cols="80" name="content">${param.content}</textarea>
		작성일<br/>
		<input type="text" name="postDate" value="${param.postDate}" readonly/><br/><br/>
		
	</form>
	
	
</body>
</html>