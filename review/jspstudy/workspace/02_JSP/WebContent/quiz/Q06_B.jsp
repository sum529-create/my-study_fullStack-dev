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
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	%>

	<h3>이용 약관</h3>
	-------------------------------------------------------------<br />
	1. 회원 정보는 웹 사이트 운영을 위해서만 사용됩니다. <br />
	2. 원치 않으면 정보 제공을 하지 않을 수 있습니다. <br />
	3. 다만 이 경우 정상적인 웹 사이트 이용이 제한됩니다. <br />
	-------------------------------------------------------------<br /><br />
	<form method="post"
	      action="/02_JSP/quiz/Q06_C.jsp">
		위 약관에 동의하십니까? <br/><br/>
		<input type="radio" name="agree" value="yes" /> 동의 함&nbsp;&nbsp;
		<input type="radio" name="agree" value="no" /> 동의 안 함<br/><br/>
		<input type="submit" value="회원가입" />
		<%--
			다음 페이지로 보내기 위해서 아래 hidden을 추가해 줍니다.
			추가된 hidden들은 submit할 때 함께 전송됩니다.
		--%>
		<input type="hidden" name="id" value="<%=id%>" />
		<input type="hidden" name="pw" value="<%=pw%>" />
		<input type="hidden" name="name" value="<%=name%>" />
	</form>
	
</body>
</html>