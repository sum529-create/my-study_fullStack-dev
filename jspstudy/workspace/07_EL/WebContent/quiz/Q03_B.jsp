<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
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
		request.setCharacterEncoding("UTf-8");
	
		User user = new User();
		
		user.setName(request.getParameter("name"));
		user.setAge(Integer.parseInt(request.getParameter("age")));
		user.setGender(request.getParameter("gender").charAt(0));
		
		user.setHobbies(request.getParameterValues("hobbies"));
		user.setAddress(request.getParameter("address"));
		user.setFood(request.getParameterValues("food"));
		
		pageContext.setAttribute("user", user);
		
	%>

	<ul>
		<li>이름: ${user.name}</li>
		<li>나이: ${user.age}</li>
		<li>성별: ${user.gender}</li>
		<li>취미: ${user.hobbies[0]} ${user.hobbies[1]} ${user.hobbies[2]} ${user.hobbies[3]}</li>
		<li>주소: ${user.address}</li>
		<li>좋아하는 음식: ${user.food[0]}${user.food[1]} ${user.food[2]} ${user.food[3]}</li>
	</ul>
</body>
</html>