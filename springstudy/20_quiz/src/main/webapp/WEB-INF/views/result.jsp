<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="calc">
		
		첫 번째 수 : ${calculator.n1}<br/>
		두 번째 수 : ${calculator.n2}<br/>
		${calculator.n1} ${calculator.op} ${calculator.n2} = ${calculator.result}<br/>
		
		<input type="hidden" name="n1" value="${calculator.n1}" />
		<input type="hidden" name="n2" value="${calculator.n2}" />
		<input type="hidden" name="btn" value="${calculator.btn}" />
		
		<button>${calculator.btn}</button>
		
	</form>
</body>
</html>