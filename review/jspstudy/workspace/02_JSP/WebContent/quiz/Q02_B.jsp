<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int age = Integer.parseInt(request.getParameter("age"));
	if(age < 20){
		request.getRequestDispatcher("/quiz/Q02_C.jsp?age="+ age).forward(request, response);		
	}else{
		request.getRequestDispatcher("/quiz/Q02_D.jsp?age=" + age).forward(request, response);		
	}
%>