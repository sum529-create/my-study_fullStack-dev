<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - 관리자 페이지입니다." name="title"/>
</jsp:include>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/admin.css" />

	
	<div class="adminManage">
		<a href="">상품 목록</a>
		<a href="adminUserList.do">회원 목록</a>
		<a href="">게시판 관리</a>
	</div>
	
	
<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>