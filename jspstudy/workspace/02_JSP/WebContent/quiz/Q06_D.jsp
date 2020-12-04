<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_exit(f) {
		alert('탈퇴되었습니다.');
	}
</script>
</head>
<body>
	<h1>가입되었습니다.</h1><br>
	<h4>가입내용</h4><br>
	가입아이디: 
	가입 비밀번호: 
	가입 성명: 
	<br>
	<br>	
	<input type="button" value="탈퇴" onclick="fn_exit(this.form)">
	
</body>
</html>