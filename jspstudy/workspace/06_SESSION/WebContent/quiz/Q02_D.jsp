<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = (String)session.getAttribute("filename");
	boolean isSuccess = (boolean)session.getAttribute("isSuccess");
	String message = "";
	
	if(isSuccess){
		String realPath = application.getRealPath("/" + filename);
		BufferedReader br = null;
		try{
			br = new BufferedReader(new FileReader(realPath));
			String line = null;
			while(true){
				line = br.readLine();
				if(line == null){
					break;
				}
				message += line + "<br/>";
			}
		}catch(FileNotFoundException e){
			out.println("<h3>해당 파일이 없습니다.<h3>");
		}catch(IOException e){
			out.println("파일을 읽을 수 없습니다.");
		}finally{
			try{
				if(br != null){
					br.close();
				}
			}catch(Exception e){
				
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess) {%>
		<h1>가입되었습니다.</h1>
		<h3>가입내용</h3>
		<%=message %>
		<br/>
		<form method="post">
			<input type="button" value="탈퇴" onclick="location.href = '/06_SESSION/quiz/Q02_E.jsp'"/>
		</form>
	<%} else{%>
			<h1>가입되지 않았습니다.</h1>
			<a href="Q02_A.jsp">다시 가입하기</a>
	<%} %>

</body>
</html>