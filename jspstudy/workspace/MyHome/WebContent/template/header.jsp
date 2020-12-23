<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<%-- jQuery --%>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>  
</head>
<body>
	<div class="wrap">
		<div class="head-wrap">
			<input type="button" value="myHome 로그인" onclick="location.href='/MyHome/loginPage.member'"/>
			<input type="button" value="myHome 회원가입" onclick="location.href='/MyHome/signUpPage.member'"/>
			<input type="button" value="마이페이지" onclick="location.href='/MyHome/myPage.member'"/>
			<input type="button" value="방명록" onclick="location.href='/MyHome/ ... '"/>
			<input type="button" value="BBS" onclick="location.href='/MyHome/ ... '"/>
			<input type="button" value="BBS" onclick="location.href='/MyHome/ ... '"/>
			<input type="button" value="게시판" onclick="location.href='/MyHome/ ... '"/>
		</div>
