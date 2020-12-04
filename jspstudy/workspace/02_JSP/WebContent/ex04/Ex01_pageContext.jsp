<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	JSP의 4가지 영역
	1. 데이터를 저장할 때 사용하는 내장객체 4가지를 의미합니다.
	2. 각 객체별로 데이터 생명주기가 다르다.
	3. 데이터를 저장하거나 꺼내는 메소드는 모두 동일하다.
	4. 종류 
		1) pageContext
			(1) 해당 페이지에서 사용하는 영역이다.
			(2) 페이지를 벗어나면 소멸된다.
		2) request
			(1) 요청이 발생되면 사용하는 영역이다.
			(2) 응답(response)되면 소멸된다.
		3) session
			(1) 웹 브라우저가 사용하는 영역이다.
			(2) 웹 브라우저를 닫으면 소멸된다.
		4) application
			(1) 애플리케이션에서 사용하는 영역이다.
			(2) 애플리케이션을 종료하면 소멸된다.
	5. 속성(Attribute)으로 저장한다.
	6. 데이터 저장 메소드
		1) setAttribute("속성명", 값)
		2) 모두 Object 타입으로 저장된다.
	7. 데이터 읽기 메소드
		1) getAttribute("속성명")
		2) 읽어 들인 속성은 Object이므로 캐스팅(형변환)을 해야한다.
	8. 속성으로 저장된 데이터는 EL(Express Language)로 사용하는 것이 일반적이다.
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	// 현재 페이지에서 사용하고자 하는 변수가 생겼다.
	// pageContext에 속성으로 저장하는 방법이 있다.
	
	// "속성"은 변수로 생각합시다.
	
	pageContext.setAttribute("name", "제임스");
	pageContext.setAttribute("age", 20);
	pageContext.setAttribute("encoding", "UTF-8");
	
%>

	<h3>name 속성: <%=pageContext.getAttribute("name") %></h3>
	<h3>age 속성: <%=pageContext.getAttribute("age") %></h3>
	<h3>encoding 속성: <%=pageContext.getAttribute("encoding") %></h3>

<%
	// 속성의 값을 꺼낼 때는 캐스팅(형변환)이 필요합니다.
	int age = (int)pageContext.getAttribute("age");
	// encoding값이 object임으로 parse형식으로 변환해야한다.
	String encoding = pageContext.getAttribute("endcoding").toString();
%>

<%
	if(encoding.equals("UTF-8")){%>
		<h3>UTF-8입니다.</h3>
	<%}else{ %>
		<h3>UTF-8로 인코딩해야 합니다.</h3>
	<%} %>

</body>
</html>