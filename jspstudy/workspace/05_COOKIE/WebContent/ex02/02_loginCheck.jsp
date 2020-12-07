<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String chk = request.getParameter("chk");
	
	Cookie cookie = null;
	
	// 1. 아이디 기억하기를 체크했다.
	if(chk != null){
		cookie = new Cookie("id", id);
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
	}
	
	// 2. 아이디 기억하기를 해제했다.
	//    (기존 쿠키에서 id를 삭제한다.)
	else{
		Cookie[] cookieList = request.getCookies();
		if(cookieList != null && cookieList.length != 0){
			for(Cookie ck : cookieList){
				if(ck.getName().equals("id")){
					cookie = new Cookie("id", "");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					break;
				}
			}
		}
		
	}
	
	// 01_loginPage.jsp로 되돌아가기
	response.sendRedirect("/05_COOKIE/ex02/01_loginPage.jsp");

%>