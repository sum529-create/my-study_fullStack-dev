<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String agree = request.getParameter("agree");
	boolean isSuccess = false;
	
	if(agree.equals("yes")){
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String name = (String)session.getAttribute("name");
		String filename = id + ".txt";
		
		// file의 중복을 제거하기 위해 사용하는 방법
		// 1. 랜덤(여러문자)	2. 시간
		session.setAttribute("filename", filename);
		String realPath = request.getRealPath("/" + filename);
		BufferedWriter bw = null;
		try{
			bw = new BufferedWriter(new FileWriter(realPath));
			bw.write("가입 아이디: " + id + "\n");
			bw.write("가입 비밀번호: " + pw + "\n");
			bw.write("가입 성명: " + name + "\n");
			isSuccess = true;
		}catch(IOException e){
			isSuccess = false;
		}finally{
			try{
				if(bw != null){
					bw.close();
				}
			}catch(Exception e){
				
			}
		}
	}
	session.setAttribute("isSuccess", isSuccess);
	response.sendRedirect("Q02_D.jsp");
	
%>