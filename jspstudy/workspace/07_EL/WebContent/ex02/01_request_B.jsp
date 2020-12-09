<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	+ : ${a} + ${b} =  ${a+b}<br/>
	- : ${a} - ${b} =  ${a-b}<br/>
	* : ${a} * ${b} =  ${a*b}<br/>
	
	/ : ${a} / ${b} =  ${a/b}<br/>
	/ : ${a} / ${b} =  ${a div b}<br/>
	
	% : ${a} % ${b} =  ${a%b}<br/>
	% : ${a} % ${b} = ${a mod b}<br/>
	
	> : ${a} > ${b} =  ${a>b}<br/>
	> : ${a} > ${b} = ${a gt b}<br/>
	>= : ${a} >= ${b} = ${a >= b}<br/>
	>= : ${a} >= ${b} = ${a ge b}<br/>
	
	< : ${a} < ${b} =  ${a<b}<br/>
	< : ${a} < ${b} = ${a lt b}<br/>
	<= : ${a} <= ${b} = ${a <= b}<br/>
	<= : ${a} <= ${b} = ${a le b}<br/>
	
	== : ${a} == ${b} = ${a == b}<br/>
	== : ${a} == ${b} = ${a eq b}<br/>
	
	!= : ${a} != ${b} = ${a != b}<br/>
	!= : ${a} != ${b} = ${a ne b}<br/>
	
	조건 연산자 : 큰 수 = ${a gt b ? a : b}<br>
	
</body>
</html>