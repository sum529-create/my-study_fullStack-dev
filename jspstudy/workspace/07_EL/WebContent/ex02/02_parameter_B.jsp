<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- "100" - "50"  String으로 넘어옴 -->

	${param.a} + ${param.b} = ${param.a + param.b }<br/>
	${param.a} - ${param.b} = ${param.a - param.b }<br/>
	${param.a} * ${param.b} = ${param.a * param.b }<br/>
	
	${param.a} / ${param.b} = ${param.a / param.b }<br/>
	${param.a} / ${param.b} = ${param.a div param.b }<br/>
	
	${param.a} % ${param.b} = ${param.a % param.b }<br/>
	${param.a} % ${param.b} = ${param.a mod param.b }<br/>
	
	<%-- 파라미커는 String 타입이므로 크기비교를 사전순으로 한다.
		100  50 일때 1과 5 첫번째자리로 인식하여 인덱스별로 50이 더 크다고 생각함
	 --%>
	${param.a} > ${param.b} = ${param.a - param.b gt 0}<br/>	
	<%-- 그러므로 빼서 0보다 큰지 본다 --%>
	${param.a} >= ${param.b} = ${param.a - param.b ge 0 }<br/>
	${param.a} < ${param.b} = ${param.a - param.b lt 0}<br/>
	${param.a} <= ${param.b} = ${param.a - param.b  le 0}<br/>

	${param.a} == ${param.b} = ${param.a eq param.b }<br/>
	${param.a} != ${param.b} = ${param.a ne param.b }<br/>
	
	큰 수: ${param.a gt param.b ? param.a : param.b }<br/>
	
</body>
</html>