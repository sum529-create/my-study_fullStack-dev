<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String[] singer = request.getParameterValues("singer");
		ArrayList<String> singers = new ArrayList<>();
		for(String like:singers){
			singers.add(like);
		}
		pageContext.setAttribute("singers", singers);
		response.sendRedirect("Q01_C.jsp");
		
	%><%-- 
		포워드 태그
		<jsp:forward page="Q01_C.jsp"/> --%>