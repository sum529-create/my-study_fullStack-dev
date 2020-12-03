<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_check(f) {
		f.action = "/02_JSP/quiz/Q01_B.jsp";
		f.submit();
		// location을 사용하면 아래 value값을 전송해주지 못한다.
	}
</script>

</head>
<body>

	<form method="get">
		사이트명 : 
		<select name ="site">
			<option value="https://www.google.co.kr/">구글
			<option value="https://www.naver.com/">네이버
			<option value="https://www.daum.net/">다음
			<option value="https://www.nate.com/">네이트
		</select>
		<input type="button" value="확인" name="check" onclick="fn_check(this.form)">
	</form>
<%-- 
			자바 2차원 배열로 했을 시
<%
	String[][] sites = {
			{"https://www.google.co.kr/", "구글"},
			{"https://www.naver.com/", "네이버"},
			{"https://www.daum.net/", "다음"},
			{"https://www.nate.com/", "네이트"}
	};
	
%>
	<select name="portal">
		<% for (int i=0; i<sites.length; i++){ %>
			<option value="<%sites[i][0]%>"><%=sites[i][1]%></option>
		<% } %>
	</select> --%>
</body>
</html>