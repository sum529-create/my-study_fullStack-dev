<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 특정 속성만 제거하기
	session.removeAttribute("data");
	
	// 2. 세션 초기화하기
	session.invalidate();
	
	// 3. 이전 페이지로 이동
	response.sendRedirect("/06_SESSION/ex01/02_session_C.jsp");
	// 위에서 삭제함으로
	// 이전 페이지에 세션이 존재하지 않기에 "존재하지 않음"이라고 뜰 것임
%>