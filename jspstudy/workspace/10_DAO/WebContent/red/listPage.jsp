<%@page import="dto.RedDto"%>
<%@page import="dao.RedDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB에서 RED 테이블 전체 목록을 가져온다.
	ArrayList<RedDto> list = RedDao.getInstance().list();
	// EL 처리를 위해서
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("size", list.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	현재 등록인원은 ${size }명입니다. <br/><br/>
	
</body>
</html>