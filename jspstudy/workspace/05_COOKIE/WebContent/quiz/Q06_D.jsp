<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	String birth = year + "년 " + month + "월 " + day + "일";
	
	String married = request.getParameter("married");
	String job = request.getParameter("job");
	
	response.addCookie( new Cookie("birth", URLEncoder.encode(birth, "UTF-8")) );
	response.addCookie( new Cookie("married", URLEncoder.encode(married, "UTF-8")) );
	response.addCookie( new Cookie("job", URLEncoder.encode(job, "UTF-8")) );
	
	response.sendRedirect("Q06_E.jsp");
	
%>