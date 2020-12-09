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

	<%-- 1. tag로 bean 생성 --%>
	<%-- <jsp:useBean id ="p" class="xxxx.Person"/> 
		<jsp:setProperty property="*" name="p"/>
		<jsp:setProperty property="name" name="p" value="${param.name}"/>
	--%>
	
	<%-- 2. java로 bean 생성 --%>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		
		Person person = new Person();
		person.setName(name);
		person.setAge(Integer.parseInt(age));
		person.setGender(gender.charAt(0));
		
		// EL 사용을 위해서 pageContext에 올려둔다.
		pageContext.setAttribute("person", person);
	%>
	
	<h3>이름: ${person.name}</h3>	<%-- <%=person.getName() %>--%>
	<%-- , private인데 어떻게 가져온것인가? No, 사실은 이 ${person.getName()} 코드의 줄임임 --%>
	<h3>나이: ${person.age}</h3> <%-- <%=person.getAge() %>  --%>
	<h3>성별: ${person.gender}</h3> <%-- <%=person.getGender() %>  --%>
	
	<%--
		이름: ${person.getName()}
		나이: ${person.getAge()}
		성별: ${person.getGender()}
	 --%>
	
</body>
</html>