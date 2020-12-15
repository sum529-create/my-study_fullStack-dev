<%@page import="dto.BlueDto"%>
<%@page import="dao.BlueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = 0;
	
	if(strNo != null || !strNo.isEmpty()){
		no = Integer.parseInt(strNo);
	}
	
	BlueDto blueDto = BlueDao.getInstance().view(no);
	pageContext.setAttribute("blueDto", blueDto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>${blueDto.no}번 게시글입니다.</h3>
	<div>
		작성자<br/>
		<pre>${blueDto.writer}</pre>
		
		제목<br/>
		<pre>${blueDto.title }</pre>
		
		내용<br/>
		<pre>${blueDto.content}</pre>
		
		작성일<br/>
		<pre>${blueDto.postDate}</pre>
	</div>
	<br/><br/>
	
	<input type="button" value="목록으로 이동하기" onclick="location.href='/11_DBCP/blue/listPage.jsp'"/>
	<input type="button" value="삭제하기" onclick="location.href='/11_DBCP/blue/delete.jsp'"/>
</body>
</html>
