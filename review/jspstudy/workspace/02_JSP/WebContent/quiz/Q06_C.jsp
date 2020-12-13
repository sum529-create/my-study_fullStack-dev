<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String agree = request.getParameter("agree");

	boolean isSuccess = false;
	String filename = "";
	
	if(agree == "yes"){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		filename += id + ".txt";
		
		BufferedWriter bw = null;
		try{
			String realPath = application.getRealPath("quiz/"+filename);
			bw = new BufferedWriter(new FileWriter(realPath));
			bw.write("가입 아이디: " + id);
			bw.newLine();
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
	
	
	response.sendRedirect("/02_JSP/quiz/Q06_D.jsp?isSuccess=" + isSuccess + "&filename=" + filename);
	
	
%>