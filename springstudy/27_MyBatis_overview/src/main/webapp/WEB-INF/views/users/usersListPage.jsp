<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>사용자목록</h3>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>연락처</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr><td colspan="3">없음</td></tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="usersDto" items="${list}">
					<tr>
						<td>${usersDto.no}</td>
						<td><a href="usersViewPage.do?no=${usersDto.no}">${usersDto.name}</a></td>
						<td>${usersDto.phone}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<a href="usersInsertPage.do">새 사용자 등록하러 가기</a>
				</td>
			</tr>
		</tfoot>
	</table>

</body>
</html>