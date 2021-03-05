<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>

	<c:if test="${empty list}"> list is empty! </c:if>
	<c:if test="${not empty list}">
		<c:forEach var="memberDto" items="${list}">
			
			${memberDto.MName}
		
		</c:forEach>
	</c:if>


<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>