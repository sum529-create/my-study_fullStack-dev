<%@page import="dao.RedDao"%>
<%@page import="dto.RedDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pw = request.getParameter("npw");
	String no = request.getParameter("no");
	
	RedDto redDto = new RedDto();
	redDto.setPw(pw);
	redDto.setNo(Integer.parseInt(no));
	
	int result = RedDao.getInstance().change(redDto);
	
	out.println("<script>");
	if(result == 1){
		out.println("alert('비밀 번호가 수정되었습니다.')");
		// 목록보기로 이동
		// out.println("location.href='/10_DAO/red/listPage.jsp");
		// 회원정보보기로 이동
		out.println("location.href='/10_DAO/red/viewPage.jsp?no="+no +"'");
	}else{
		out.println("alert('비밀번호가 수정되지 않았습니다. 다시 시도하세요.')");
		out.println("history.back()");
	}
	
	out.println("</script>");
	
%>