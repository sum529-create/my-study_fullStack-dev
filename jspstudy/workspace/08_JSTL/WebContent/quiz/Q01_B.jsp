<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${age >= 0 and age <= 7}">
		<c:set var="aage" value="미취학아동"/> 
	</c:if>
	<c:if test="${age >= 8 and age <= 13}">
		<c:set var="aage" value="초등학생"/> 
	</c:if>
	<c:if test="${age >= 14 and age <= 16}">
		<c:set var="aage" value="중학생"/> 
	</c:if>
	<c:if test="${age >= 17 and age <= 19}">
		<c:set var="aage" value="고등학생"/> 
	</c:if>
	<c:if test="${age >= 20}">
		<c:set var="aage" value="성인"/> 
	</c:if>
	
	<h3>${age}살 이므로 ${aage}입니다.</h3>
	
	
	
	<c:if test="${param.num >= 0 }">	<!-- 직접 비교 가능함 -->
		<c:set var="abs" value="${param.num}"/>
	</c:if>
	<c:if test="${param.num - 0 < 0 }">
		<c:set var="abs" value="${param.num * -1}"/>
	</c:if>
	<h3>${param.num}의 절대값은 ${abs}이다.</h3>
</body>
</html>