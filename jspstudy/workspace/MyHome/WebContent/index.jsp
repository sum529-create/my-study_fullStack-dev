<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>    
<jsp:include page="template/header.jsp">
	<jsp:param value="title" name="title"/>
</jsp:include>
			
			<h1>MyHome에 오신 걸 환영합니다.</h1>
			
<%-- 바닥글 포함(파리미터가 없으므로 정적 페이지 포함) --%>			
<%@ include file="template/footer.jsp"%>