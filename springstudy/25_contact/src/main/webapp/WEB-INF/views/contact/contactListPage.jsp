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
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">내용이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="contactDto" items="${list}">
					<tr>
						<td>${contactDto.no}</td>
						<td><a href="contactViewPage.do">${contactDto.name}</a></td>
						<td>${contactDto.phone}</td>
						<td>${contactDto.address}</td>
						<td>${contactDto.email}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><input type="button" value="작성하기" onclick="location.href='contactInsertPage.do'"/></td>
			</tr>
		</tfoot>
	</table>

</body>
</html>