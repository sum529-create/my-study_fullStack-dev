<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if(title == null || title.isEmpty()){
		title = "환영합니다.";
	}
	pageContext.setAttribute("title", title);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<script type="text/javascript">
	function fn_logout() {
		if(confirm('로그아웃 하시겠습니까?')){
			location.href='/MyPage/logout.member';
		}
	}
	function fn_signOutPage() {
		location.href='/MyHome/signOutPage.member';
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="header-wrap">
			<a href="/MyPage/"><img alt="logo" src="assets/img/logo.png" style="width:50px"></a>
			<%-- 1. 비 로그인 상태  메뉴--%>
			<c:if test="${loginDto eq null }">
				<input type="button" value="로그인" onclick="location.href='/MyPage/'">
				<input type="button" value="회원가입" onclick="location.href='/MyPage/'">
				<input type="button" value="마이페이지" onclick="location.href='/MyPage/'">
			</c:if>
			
			<%-- 2. 로그인 상태 메뉴 --%>
			<c:if test="${loginDto ne null }">
				<input type="button" value="로그아웃" onclick="location.href='/MyPage/'">
				<input type="button" value="회원탈퇴" onclick="location.href='/MyPage/'">
				<input type="button" value="마이페이지" onclick="location.href='/MyPage/'">
			</c:if>
			<%-- 3. 고정된 메뉴 --%>
				<input type="button" value="방명록" onclick="location.href='/MyPage/'">
				<input type="button" value="BBS" onclick="location.href='/MyPage/'">
				<input type="button" value="게시판" onclick="location.href='/MyPage/'">
				
		</div>
		<div class="body-wrap">