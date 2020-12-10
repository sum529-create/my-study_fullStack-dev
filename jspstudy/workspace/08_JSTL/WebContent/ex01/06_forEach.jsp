<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User user1 = new User("user1", "1111", new Date(System.currentTimeMillis()));
		User user2 = new User("user2", "1111", new Date(System.currentTimeMillis()));
		User user3 = new User("user3", "1111", new Date(System.currentTimeMillis()));
		ArrayList<User> list = new ArrayList<>();
		list.add(user1);
		list.add(user2);
		list.add(user3);
		pageContext.setAttribute("list", list);
		pageContext.setAttribute("size", list.size());
	%>
	<!-- arraylist는 length가 아닌 size()를 사용한다. -->
	<h3>전체 ${size}명</h3>
	<table border="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${list}" varStatus="k">
				<tr>
					<td>${k.count}</td>
					<td>${user.id}</td>
					<td>${user.pw}</td>
					<td>${user.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>