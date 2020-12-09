<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 1. "속성"으로 데이터 저장 --%>
<%
	request.setAttribute("a", 100);
	request.setAttribute("b", 50);
	request.getRequestDispatcher("01_request_B.jsp").forward(request, response);
	
	
	
%>