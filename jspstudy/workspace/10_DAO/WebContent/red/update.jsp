<%@page import="dao.RedDao"%>
<%@page import="dto.RedDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("UTF-8");		
	String name= request.getParameter("name");
	String age = request.getParameter("age");
	String email = request.getParameter("email");
	String no = request.getParameter("no");
	
	// 2. DB로 보낼 RedDto 생성
	RedDto redDto = new RedDto();
	redDto.setName(name);
	redDto.setAge(Integer.parseInt(age));
	redDto.setEmail(email);
	redDto.setNo(Integer.parseInt(no));
	
	// 3. DAO
	int result = RedDao.getInstance().update(redDto);
	
	// 4. 성공/실패 처리
	out.println("<script>");
	if(result == 1){
		out.println("alert('회원 정보가 수정되었습니다.')");
		// 목록보기로 이동
		// out.println("location.href='/10_DAO/red/listPage.jsp");
		// 회원정보보기로 이동
		out.println("location.href='/10_DAO/red/viewPage.jsp?no="+no +"'");
	}else{
		out.println("alert('회원 정보가 수정되지 않았습니다. 다시 시도하세요.')");
		out.println("history.back()");
	}
	
	out.println("</script>");
	
%>
