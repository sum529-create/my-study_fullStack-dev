<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EMP 테이블</h3>
	<table border="1">
		<thead>
			<tr>
				<td>사원ID</td>
				<td>LAST_NAME</td>
				<td>FIRST_NAME</td>
				<td>연락처</td>
				<td>고용일</td>
				<td>직업ID</td>
				<td>연봉</td>
				<td>부서ID</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="8">검색된 직원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="whiteDto" items="${list}">
					<tr>
						<td>${empDto.employee_id }</td>
						<td>${empDto.last_name }</td>
						<td>${empDto.first_name }</td>
						<td>${empDto.phone_number }</td>
						<td>${empDto.hire_date }</td>
						<td>${empDto.job_id }</td>
						<td>${empDto.salary }</td>
						<td>${empDto.department_id }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>