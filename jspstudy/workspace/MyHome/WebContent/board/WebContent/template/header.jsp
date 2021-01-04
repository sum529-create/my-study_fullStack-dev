  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "환영합니다";
	}
	pageContext.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<%-- CSS --%>
<link rel="stylesheet" href="assets/style/common.css">
<%-- jQuery --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function fn_logout() {
		if (confirm('로그아웃 하시겠습니까?')) {
			location.href = '/MyHome/logout.member';
		}
	}
	
	function fn_signOutPage() {
		location.href='/MyHome/signOutPage.member';
	}
</script>
</head>
<body>

	<div class="wrap">
		
		<div class="head-wrap">
			<a href="/MyHome/"><img src="assets/img/logo.png" style ="width:50px;margin-right:30px;float:left;"/></a>
			
			<%-- 1. 로그인 안 된 상태 --%>
			<c:if test="${loginDto eq null}">
				<input type="button" value="MyHome 로그인" onclick="location.href='/MyHome/loginPage.member'" />
				<input type="button" value="MyHome 회원가입" onclick="location.href='/MyHome/signUpPage.member'" />
				<input type="button" value="마이페이지" onclick="location.href='/MyHome/loginPage.member'" />
			</c:if>
			
			<%-- 2. 로그인 상태 --%>
			<c:if test="${loginDto ne null}">
				${loginDto.mName} 님 반갑습니다&nbsp;&nbsp;
				<input type="button" value="로그아웃" onclick="fn_logout()" />
				<input type="button" value="회원탈퇴" onclick="fn_signOutPage()" />
				<input type="button" value="마이페이지" onclick="location.href='/MyHome/myPage.member'" />
			</c:if>
			
			<%-- 3. 고정 메뉴 --%>
				<input type="button" value="방명록" onclick="location.href='/MyHome/guestListPage.guest'" />
				<input type="button" value="BBS" onclick="location.href='/MyHome/bbsListPage.bbs'" />
				<input type="button" value="게시판" onclick="location.href='/MyHome/boardListPage.board'" />
		</div>
		
		<div class="body-wrap">