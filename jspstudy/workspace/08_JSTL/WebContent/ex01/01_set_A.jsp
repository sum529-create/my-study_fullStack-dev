<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 

	tablib를 사용하려면 taglib 지시어를 작성해야 한다.
	1. 코어(core) 라이브러리: if, for
		<%@ taglib url= "" %>
	2. 형식(fmt) 라이브러리: 숫자, 날짜 형식
		<%@ taglib url="" prefix = "fmt" %>
	
 --%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- set : 변수 선언 --%>
	<c:set var = "name" value="제시카"/>
	<c:set var = "age" value="20"/>
	<!-- 숫자도 묶어준다. -->

	<%-- taglib는 기본적으로 모두 EL을 사용한다. --%>
	<%--
		String name = "제시카";
		int age = 20;
		pageContext.setAttribute("name", name);
		pageContext.setAttribute("age", age);
	--%>

	<h3>이름: ${name}</h3>
	<h3>나이: ${age}</h3>

	<%-- set 태그에 scope 속성을 지정할 수 있다. 기본값은 pageContext이다. --%>
	<%-- request에 변수 선언하기 --%>
	<c:set var="a" value="10" scope="request"/>
	<c:set var="b" value="5" scope="request"/>
	
	
	<%--
		set 태그를 이용하면 "속성"으로 저장된다.
		request.setAttribute("a", 10);
		request.setAttribute("b", 10);
	--%>
	
	<jsp:forward page="01_set_B.jsp"/>
	
	<%-- jsp는 스크립트릿이 없는 것이 좋은 코드이다. Model-1버전에서는 다수 사용중 --%>
	
</body>
</html>