<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String agree = request.getParameter("agree");
	boolean isSuccess = false;   // 파일 생성 성공 유무를 저장합니다.
	String filename = "";
	
	if ( agree.equals("yes") ) {  // 이전 페이지에서 동의했다면
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		filename = id + ".txt";  // 아이디가 파일이름이 됩니다.
		
		BufferedWriter bw = null;
		try {
			String realPath = application.getRealPath("quiz/" + filename);
			// String realPath = request.getRealPath("quiz/" + filename);  request도 realPath를 알아낼 수 있습니다.
			bw = new BufferedWriter(new FileWriter(realPath));
			bw.write("가입 아이디: " + id);
			bw.newLine();  // 이런 줄 바꿈도 있습니다.(\n 대신입니다.)
			bw.write("가입 비밀번호: " + pw + "\n");
			bw.write("가입 성명: " + name + "\n");
			isSuccess = true;
		} catch (IOException e) {
			isSuccess = false;  // 생략해도 됩니다.
		} finally {
			try {
				if (bw != null) {
					bw.close();
				}
			} catch (Exception e) {
				
			}
		}
		
	} // if
	
	// 1. 기존 request 정보(id, pw, name, agress)를 다음 페이지로 보낼 필요가 없으므로
	//    기존 request 정보를 안 보내는 리다이렉트로 이동합니다.
	// 2. 파일 생성 성공 유무와 생성된 파일명은 다음 페이지로 전달해 줘야 하므로
	//    새로운 파라미터를 추가해서 보내줍니다.(?isSuccess=" + isSuccess + "&filename=" + filename)
	//    1) 파일 생성 성공 유무: 성공/실패에 따른 작업 구분용
	//    2) 생성된 파일명: 읽어야 할 파일명
	response.sendRedirect("/02_JSP/quiz/Q06_D.jsp?isSuccess=" + isSuccess + "&filename=" + filename);
	
%>
