<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String contextPath = application.getContextPath();
		String realPath = application.getRealPath("/ex03/잔향.txt");
	%>
	<h3>컨텍스트패스:<%=contextPath %></h3>
	<h3>컨텍스트패스:<%=realPath %></h3>
	
	<h1>잔향</h1>
	
	<%
		BufferedReader br = null;
		try{
			br = new BufferedReader(new FileReader(realPath));
			while(true){
				String line = br.readLine();
				if(line == null){
					break;
				}
				out.println(line + "<br/>");
			}
		}catch(FileNotFoundException e){
			out.println("파일을 찾을 수 없습니다.");
		}catch(IOException e){
			out.println("파일을 읽을 수 없습니다.");
		}finally{
			try{
				if(br!= null){
					br.close();
				}
			}catch(Exception e){
				
			}
			
		}
	
	
	%>
	
	
</body>
</html>