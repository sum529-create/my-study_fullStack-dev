<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String data = request.getParameter("data");

	// 세션에 담기
	session.setAttribute("data", data);	// 변수이름이 data 저장할 값 data
	
	// 화면 이동
	// 기존의 request 정보를 넘기지 않는 이동
	response.sendRedirect("/06_SESSION/ex01/02_session_C.jsp");
	
	
%>