<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		설문작성자<br/>
		<input type="text" name="name"/><br/><br/>
		<h3>1. 좋아하는 연예인은 누구인가요?</h3>
		<input type="text" name="person">
		<input type="button" value="다음" onclick="fn_like(this.form)"/>
		
	</form>
	
	<script type="text/javascript">
		function fn_like(f) {
			f.action = "/02_JSP/quiz/Q03_B.jsp";
			f.submit();
		}
	</script>
</body>
</html>