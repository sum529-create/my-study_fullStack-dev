<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<c:if test="${result eq true}">
	<jsp:forward page="guestViewPage.jsp"/>
</c:if>

<c:if test="${result ne true }">
	<script>
		alert('방명록을 열 수 없습니다. 다시 시도 하세요.');
		location.href='/MyHome/guestListPage.guest';
	</script>
</c:if>