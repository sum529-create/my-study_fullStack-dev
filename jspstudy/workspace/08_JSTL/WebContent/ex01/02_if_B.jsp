<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
		1. if 태그만 있고, else의 개념이 없다.
		2. 형식
			<c:if test="${조건식}">
				본문
			</c:if>
	 --%>

	<%-- a와 b중에서 큰 값을 max에 저장하기 --%>
	
	<c:if test="${param.a - param.b > 0 }">
		<c:set var="max" value="${param.a}"/>
	</c:if>
	<c:if test = "${param.a - param.b <= 0 }">
		<c:set var ="max" value="${param.b }"/>
	</c:if>

	<h3>둘 중 큰 수는 ${max}입니다.</h3>
	
	<%-- a와 b 중에서 10과 가까운 수를 출력하시오. --%>
	<c:if test = "${param.a-10 > 0}">
		<c:set var="diff1" value="${param.a -10}"/>
	</c:if>
	<c:if test = "${param.a-10 <= 0 }">
		<c:set var="diff1" value="${10-param.a}"/>
	</c:if>
	<c:if test = "${param.b-10 > 0}">
		<c:set var="diff2" value="${param.b -10}"/>
	</c:if>
	<c:if test = "${param.b-10 <= 0 }">
		<c:set var="diff2" value="${10-param.b}"/>
	</c:if>
	<c:if test="${diff1 > diff2 }">
		<h3>둘 중 10과 가까운 수는 ${param.b}입니다.</h3>
	</c:if>
	<c:if test="${diff1 < diff2 }">
		<h3>둘 중 10과 가까운 수는 ${param.a}입니다.</h3>
	</c:if>
	<c:if test="${diff1 == diff2 }">
		<h3>${param.a}와 ${param.b}는 10과 동일한 차이입니다.</h3>
	</c:if>
</body>
</html>