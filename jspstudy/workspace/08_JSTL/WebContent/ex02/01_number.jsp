<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="n" value="123456789.123456789"/>
	
	디폴트 패턴: <fmt:formatNumber value="${n}"/><br/>
	쉼표(,)처리 : <fmt:formatNumber value="${n}" groupingUsed="true"/><br/>
	<!-- #,## -->
	쉼표(,)처리 : <fmt:formatNumber value="${n}" groupingUsed="false"/><br/>
	<!-- 0.00 -->
	
	쉼표(,)0 + 정수 : <fmt:formatNumber value="${n}" pattern="#,##0"/><br/>
	쉼표(,)0 + 소수1자리 : <fmt:formatNumber value="${n}" pattern="#,##0.0"/><br/>
	쉼표(,)0 + 소수2자리 : <fmt:formatNumber value="${n}" pattern="#,##0.00"/><br/>
	
	쉼표(,)x + 정수 : <fmt:formatNumber value="${n}" pattern="0"/><br/>
	쉼표(,)x + 소수1자리 : <fmt:formatNumber value="${n}" pattern="0.0"/><br/>
	쉼표(,)x + 소수2자리 : <fmt:formatNumber value="${n}" pattern="0.00"/><br/>
	
	퍼센트(%): <fmt:formatNumber value="${n}" type="percent"/><br/>
	<!-- 1 == 100%   0.1 == 10% -->
	
	통화(원화): <fmt:formatNumber value="${n}" type="currency" /><br/>
	통화(달러): <fmt:formatNumber value="${n}" type="currency" currencySymbol="$"/> 
	
</body>
</html>