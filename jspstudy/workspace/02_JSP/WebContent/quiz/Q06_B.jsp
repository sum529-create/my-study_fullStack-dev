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
<style type="text/css">
	.form2{
		display: none;
	}
</style>
</head>
<body>
	<form class ="form1">
	<div>
		---------------------------------------------------<br>
		1. 회원 정보는 웹 사이트 운영을 위해서만 사용됩니다.<br>
		2. 원치 않으면 정보 제공을 하지 않을 수 있습니다.<br>
		3. 다만 이 경우 정상적인 웹 사이트 이용이 제한됩니다<br>
		---------------------------------------------------<br>
	</div>
	<br>위 약관에 동의하십니까?<br>
	<input type="radio" name="check" id="check" value="yes" checked>동의 함
	<input type="radio" name="check" id="check" value="no">동의 안 함
	<input type="button" value="회원가입" onclick="fn_re(this.form)">
	</form>
	
	
<script type="text/javascript">
	function fn_re(f) {
	<%
		String check = request.getParameter("check");
		if(check == "yes"){%>
			f.action = "/02_JSP/quiz/Q06_C.jsp";
			f.submit();
	<%	}else{%>
			.form2.style.display = "inliine";
			.form1.style.display = "none";
	<%	}
	%>
	}
</script>

	<form class="form2">
		<h3>가입되지 않았습니다.</h3>
		<br><a href="/02_JSP/quiz/Q06_A.jsp">다시 가입하기</a>			
	</form>
</body>
</html>