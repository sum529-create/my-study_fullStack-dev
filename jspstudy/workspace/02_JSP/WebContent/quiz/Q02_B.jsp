<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	int age = Integer.parseInt(request.getParameter("age"));
	
	if(age < 20){
		// redirect를 하려면 age를 다시 새로운 request로 만들어 주면 됩니다.
		// response.sendRedirect("/02_JSP/quiz/Q02_C.jsp?age="+age);
		// forward를 하면 age가 저장된 request가 C와 D로 이동됩니다.
		request.getRequestDispatcher("/quiz/Q02_C.jsp").forward(request, response);
	}else{
		// response.sendRedirect("/02_JSP/quiz/Q02_D.jsp?age="+age);
		request.getRequestDispatcher("/quiz/Q02_D.jsp").forward(request, response);
	}
	
%>