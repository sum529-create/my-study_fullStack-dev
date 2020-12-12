<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_site(f) {
		f.action = "/02_JSP/quiz/Q01_B.jsp";
		f.submit();
	}
</script>
</head>
<body>

	<form method="get">
		<select name="list">
			<option value="https://www.google.co.kr/">구글
			<option value="https://www.naver.com/">네이버
			<option value="https://www.daum.net/">다음
			<option value="https://www.nate.com/">네이트
		</select>
		<input type="button" value="전송" onclick="fn_site(this.form)"/>
	</form>

</body>
</html>