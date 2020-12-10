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
	<!-- 90보다 작으면 아예 구문 밖을 나가버림. elseif(?)의 개념 : c:when-->
	<!-- 나머지의 모든 경우 else의 개념. 식은 작성하지 않는다. : c:otherwise-->

	<c:set var="average" value="${(param.kor + param.eng + param.mat)/3}" />
	<c:choose>
		<c:when test="${average >= 90}">
			<c:set var="grade" value="A" />
		</c:when>
		<c:when test="${average >= 80}">
			<c:set var="grade" value="B" />
		</c:when>
		<c:when test="${average >= 70}">
			<c:set var="grade" value="C" />
		</c:when>
		<c:when test="${average >= 60}">
			<c:set var="grade" value="D" />
		</c:when>
		<c:otherwise>	
			<c:set var="grade" value="F" />
		</c:otherwise>
	</c:choose>

		<h3>평균은 ${average}점이고, 학점은 ${grade}학점입니다.</h3>
</body>
</html>