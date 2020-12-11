<%@page import="dao.RedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 가입을 희망하는 아이디가 id이다.
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	// 2. DB에 id를 전달하고 사용하는 회원이 있는지 확인한다.
	boolean isPossible = RedDao.getInstance().idCheck(id);
	
	// 3. 결과에 따라 처리
	out.println("<script>");
	if(isPossible){
		out.println("alert('사용 가능한 아이디입니다.')");
		out.println("location.href='/10_DAO/red/insertPage.jsp?id="+id + "&chk=true'");
	}else{
		out.println("alert('이미 사용중인 아이디입니다.')");
		out.println("history.back()");
	}
	out.println("</script>");
%>
