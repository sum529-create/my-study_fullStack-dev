<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그아웃: session에 저장된 loginUser 정보를 삭제
	// session.removeAttribute("loginUser");
	session.invalidate();
	
	// 다시 로그인 페이지로 되돌아간다.
	response.sendRedirect("/06_SESSION/ex02/01_login_A.jsp");
%>