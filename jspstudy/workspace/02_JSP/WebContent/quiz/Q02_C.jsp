<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		alert(<%=age%> + '살은 주류 구매가 불가능합니다.');
		history.go(-1);		// 2번 뒤로 이동합니다. forward는 1번 B에 위치해 있기때문
	</script>

<%-- 	<h1>미성년자</h1>
	<h3>당신의 나이는 <%=age%>살 이므로 주류 구매가 불가능합니다.</h3>
	<h3><a href="/02_JSP/quiz/Q02_A.jsp">처음으로 이동</a></h3> --%>
</body>
</html>