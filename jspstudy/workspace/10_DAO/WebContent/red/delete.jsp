<%@page import="dto.RedDto"%>
<%@page import="dao.RedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	
	RedDto redDto = new RedDto();
	redDto.setNo(Integer.parseInt(no));
	
	int result = RedDao.getInstance().delete(redDto);
	
	out.println("<script>");
	if(result == 1){
		out.println("alert('회원 정보가 삭제되었습니다.')");
		out.println("location.href='/10_DAO/red/listPage.jsp'");
	}else{
		out.println("alert('회원 정보 삭제가 실패하였습니다.')");
		out.println("location.href='/10_DAO/red/listPage.jsp'");
	}
	
	out.println("</script>");
%>
