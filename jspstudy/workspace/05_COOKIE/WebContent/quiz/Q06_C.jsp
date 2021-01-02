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

	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	response.addCookie(new Cookie("address", URLEncoder.encode(address,"UTF-8")));
	response.addCookie(new Cookie("phone", URLEncoder.encode(phone,"UTF-8")));
	response.addCookie(new Cookie("email", URLEncoder.encode(email,"UTF-8")));
%>
</head>
<body>
	<h3>연락처를 입력하세요.</h3>
	<form action="/05_COOKIE/quiz/Q06_E.jsp" method = "get">
		<table>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="year">년
				<input type="text" name="month">월
				<input type="text" name="day">일</td>
			</tr>
			<tr>
				<td>결혼여부</td>
				<td><input type="radio" name="married" value="미혼"/>미혼
					<input type="radio" name="married" value="기혼"/>기혼
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
					<option value="developer">개발자</option>
					<option value="writer">작가</option>
					<option value="doctor">의사</option>
				</select></td>
			</tr>
		</table>
		<br><br><br>
		<button>확인</button>
	</form>
</body>
</html>
