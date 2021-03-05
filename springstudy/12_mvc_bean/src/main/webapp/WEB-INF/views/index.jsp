<%@page import="com.koreait.mvc02.dto.PersonDto"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>index.jsp</h3>
	
	<%--
		root-context.xml 에 저장된 Bean은 applicationScope를 가집니다.
	--%>
	<%
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);
	
		PersonDto p1 = ctx.getBean("person1", PersonDto.class);
		PersonDto p2 = ctx.getBean("person2", PersonDto.class);
		// PersonDto p3 = ctx.getBean("person3", PersonDto.class);
		
		// EL 사용을 위해서 4개 영역으로 옮깁니다.
		pageContext.setAttribute("p1", p1);
		pageContext.setAttribute("p2", p2);
		// pageContext.setAttribute("p3", p3);
	%>
	
	<h3>사용자1</h3>
	<ul>
		<li>이름: ${p1.name}</li>
		<li>나이: ${p1.age}</li>
		<li>전화: ${p1.contact.phone}</li>
		<li>주소: ${p1.contact.address}</li>
	</ul>
	
	<h3>사용자2</h3>
	<ul>
		<li>이름: ${p2.name}</li>
		<li>나이: ${p2.age}</li>
		<li>전화: ${p2.contact.phone}</li>
		<li>주소: ${p2.contact.address}</li>
	</ul>

	<!--
	<h3>사용자3</h3>
	<ul>
		<li>이름: ${p3.name}</li>
		<li>나이: ${p3.age}</li>
		<li>전화: ${p3.contact.phone}</li>
		<li>주소: ${p3.contact.address}</li>
	</ul>
	-->
	
</body>
</html>