<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="now" value="<%=new Date()%>"/>
	
	디폴트 <fmt:formatDate value="${now}" /><br/>
	
	yyyy. M. d <fmt:formatDate value="${now}" type="date"/><br/>
	오전 h:mm:ss <fmt:formatDate value="${now}" type="time"/><br/>
	yyyy. M. d 오전 h:mm:ss <fmt:formatDate value="${now}" type="both"/><br/>
	
	<%-- SimpleDateFormat 클래스의 패턴을 기억하시면 좋습니다. 동일합니다. --%>
	날짜: <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 E요일"/><br/>
	<%-- 시간을 나타내는 방법은 2가지 am/pm 표현방식 24시간 표현 방식 --%>
	시간: <fmt:formatDate value="${now}" pattern="a h:mm:ss"/><br/>
	시간: <fmt:formatDate value="${now}" pattern="H:mm:ss"/>
	
	
</body>
</html>