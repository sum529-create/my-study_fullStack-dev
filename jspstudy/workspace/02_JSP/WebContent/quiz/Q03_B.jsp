<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String person = request.getParameter("person");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
	<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="player">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="person" value="<%=person %>">
		<input type="button" value="다음" onclick="fn_like(this.form)"/>
		
	</form>
	
	<script type="text/javascript">
		function fn_like(f) {
			f.action ="/02_JSP/quiz/Q03_C.jsp";
			f.submit();
		}
	</script>
</body>
</html>
</body>
</html>