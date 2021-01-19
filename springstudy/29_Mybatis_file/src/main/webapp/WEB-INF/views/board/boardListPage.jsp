<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/style/common.css">
</head>
<body>
	
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>이미지</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">없음</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="boardDto" items="${list}">
					<tr>
						<td>${boardDto.no }</td>
						<td>${boardDto.filename }</td>
						<td>${boardDto.writer }</td>
						<td>${boardDto.title }</td>
						<td>${boardDto.regDate }</td>
					</tr>
				 </c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<a href="boardInsertPage.do">작성하러가기</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
</body>
</html>