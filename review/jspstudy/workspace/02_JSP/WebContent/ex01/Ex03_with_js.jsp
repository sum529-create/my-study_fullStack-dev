<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 자바 변수는 자바스크립트에서 사용할 수 있다. --%>
	<% int a = 10; %>
	<script type="text/javascript">
		
		var n = <%= a %>;
		alert(n);
		
	</script>
	
	<%-- 자바 스크립트 변수는 자바에서 사용할 수 없다. --%>
	<%--<%=n %>의 사용이 불가능하다. --%>
</body>
</html>