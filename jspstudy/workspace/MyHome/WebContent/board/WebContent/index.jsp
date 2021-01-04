<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- 머리글 포함(파라미터(title)가 있으므로 동적 페이지 포함) --%>    
<jsp:include page="template/header.jsp"/>
<c:if test="${loginDto.mId eq 'admin'}">
	<h1>관리자님 환영합니다.</h1>
	<a href="/MyHome/memberList.admin">회원관리</a><br/>
	<a href="/MyHome/guestList.admin">방명록관리</a><br/>
	<a href="/MyHome/bbsList.admin">BBS관리</a><br/>
	<a href="/MyHome/boardList.admin">게시판관리</a><br/>
</c:if>
			<h1>MyHome에 오신 걸 환영합니다.</h1>
			
<%-- 바닥글 포함(파리미터가 없으므로 정적 페이지 포함) --%>			
<%@ include file="template/footer.jsp"%>