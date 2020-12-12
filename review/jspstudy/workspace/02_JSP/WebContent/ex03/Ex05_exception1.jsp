<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 예외가 발생하면 자동으로 이동할 페이지를 page 지시어의 errorPage 속성에 작성합니다. --%>

<%@ page errorPage = "Ex05_exception2.jsp" %>

<%-- 확인을 위해 강제로 예외를 발생시킵니다. --%>
<%
	String query = request.getParameter("query");
	query.charAt(0);	// query가 전달이 없으므로 NullPointerException 발생
	
%>
