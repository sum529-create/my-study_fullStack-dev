<%@page import="bean.Person"%>
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
		request.setCharacterEncoding("UTF-8");
		String name= request.getParameter("name");
		String age= request.getParameter("age");
		String gender= request.getParameter("gender");
		
		// Bean 만들기: 자바 코드 활용
		
		Person p = new Person();
		p.setName(name);
		p.setAge(Integer.parseInt(age));
		p.setGender(gender.charAt(0));	// 각 타입의 한개만
		
	%>
	
	<h3>이름: <%=p.getName() %></h3>
	<h3>나이: <%=p.getAge() %></h3>
	<h3>성별: <%=p.getGender() %></h3>
	
<%-- 	-------------------
	
	<h3>이름: <%=name %></h3>
	<h3>나이: <%=age %></h3>
	<h3>성별: <%=gender%></h3> --%>

</body>
</html>