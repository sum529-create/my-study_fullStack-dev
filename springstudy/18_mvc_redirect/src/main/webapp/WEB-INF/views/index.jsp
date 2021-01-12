<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
		<form action="v01"> 이 부분은 
		MyController의 @RequestMapping(value="v01")과 연결됩니다.
	 --%>

	<form action="v01" method="get">
		이름<br/>
		<input type="text" name="name"/><br/><br/>
		나이<br/>
		<input type="text" name="age"/><br/><br/>
		<button>전송</button>
	</form>

	<form action="v02" method="get">
		이름<br/>
		<input type="text" name="name"/><br/><br/>
		나이<br/>
		<input type="text" name="age"/><br/><br/>
		<button>전송</button>
	</form>
	<!-- 
		model.addAttribute() -> request
		redirect은 request로 전달하지 않는다. 값이 바로 이동x
	 -->

</body>
</html>