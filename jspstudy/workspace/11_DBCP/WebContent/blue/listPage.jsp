<%@page import="dto.BlueDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BlueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	// BlueDao blueDao = BlueDao.getInstance();
	ArrayList<BlueDto> list = BlueDao.getInstance().list();
	pageContext.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/11_DBCP/blue/insertPage.jsp">새 글 작성하기</a>
	<br/><br/>
	
	<table border="1">
		<thead>
			<tr>
				<td>게시글 번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="blueDto" items="${list}">
					<tr>
						<td>${blueDto.no}</td>	<!-- getNumber() 메소드 -->
						<td>${blueDto.title}</td>
						<td>${blueDto.writer}</td>
						<td>${blueDto.postate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
</body>
</html>
