<%@page import="java.util.ArrayList"%>
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
		String[] foods = request.getParameterValues("foods");
		
		ArrayList<String> list = new ArrayList<>();
		for(String food:foods){
			list.add(food);
		}
		// EL 사용을 위해서 pageContext에 저장한다.
		pageContext.setAttribute("list", list);	// "list"는 아래 list를 나타낸다.
	%>
	
	<%-- ArrayList와 같은 List타입은 배열처럼 사용합니다. --%>
	<h3>${list[0]}</h3>
	<h3>${list[1]}</h3>
	<h3>${list[2]}</h3>
</body>
</html>