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

%>

	<%-- 빈 만들기 : 태그 이용 --%>
	<%-- Person p = new Person(); 같은 형식 --%>
	<jsp:useBean id="p" class="bean.Person"/>

	
	<%-- 
		p.setName(request.getParameter("name"));
		p.setAge(Integer.parseInt(request.getParameter("age")));
		p.setGender(request.getParameter("gender").charAt(0));
	 --%>
	 <%-- p의 모든 property(필드)를 request로 채운다. --%>
	<jsp:setProperty property="*" name="p"/>
	
	<%-- 별도로 저장하는 것 --%>
	<%-- <jsp:setProperty property="name" name="p"/>
	<jsp:setProperty property="age" name="p"/>
	<jsp:setProperty property="gender" name="p"/> --%>

	<%-- 
		p.getName();
		p.getAge();
		p.getGender(); 
	--%>
	<h3>이름: <jsp:getProperty property="name" name="p"></h3>
	<h3>나이: <jsp:getProperty property="age" name="p"></h3>
	<h3>성별: <jsp:getProperty property="gender" name="p"></h3>
</body>
</html>