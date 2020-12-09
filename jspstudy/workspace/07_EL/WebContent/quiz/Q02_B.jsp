<%@page import="bean.Board"%>
<%@page import="java.sql.Date"%>
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
		/*  Date date = new Date();*/
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		Board board = new Board();
		board.setTitle(title);
		board.setName(name);
		board.setContent(content);
		board.setDate(new Date(System.currentTimeMillis()));
		
		pageContext.setAttribute("board", board);
	%>
	
	제목: ${board.title} <br>
	작성: ${board.name} <br>
	내용: ${board.content} <br>
	게시: ${board.date} <br>

</body>
</html>