<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	response.addCookie(new Cookie("id", URLEncoder.encode(id, "UTF-8")));
	response.addCookie(new Cookie("pw", URLEncoder.encode(pw, "UTF-8")));
	response.addCookie(new Cookie("name", URLEncoder.encode(name, "UTF-8")));
	
%>
</head>
<body>
	<h3>연락처를 입력하세요.</h3>
	<form action="/05_COOKIE/quiz/Q06_C.jsp" method = "get">
		<table>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" placeholder="example@xxxx.xxx"/></td>
			</tr>
		</table>
		<br><br><br>
			<input type="hidden" name="id" value="<%=id%>"/>
			<input type="hidden" name="pw" value="<%=pw%>"/>
			<input type="hidden" name="name" value="<%=name%>"/>
		<button>확인</button>
	</form>
</body>
</html>