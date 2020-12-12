<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
		<input type="text" name="name"/>
		<h3>좋아하는 연에인?</h3>
		<input type="text" name="ent"/>
		<input type="button" value="다음" onclick="fn_check(this.form)"/>
	</form>
	<script type="text/javascript">
		function fn_check(f) {
			f.action="/02_JSP/quiz/Q03_B.jsp";
			f.submit();
		}
	</script>
</body>
</html>