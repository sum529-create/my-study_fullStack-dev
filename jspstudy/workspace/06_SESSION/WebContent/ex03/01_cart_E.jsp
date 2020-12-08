<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// removeAttribute(), invalidate()
	// invalidate()는 로그인도 해제된다. 
	// 장바구니만을 해제할려고 한다면 removeAttribute()를 해야한다.
	
	// 장바구니 비우기는 cart만 제거한다.
	session.removeAttribute("cart");
	
	// 쇼핑하려 이동
	response.sendRedirect("/06_SESSION/ex03/01_cart_B.jsp");

%>