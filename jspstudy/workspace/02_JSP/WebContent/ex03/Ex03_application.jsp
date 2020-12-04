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
	
	<h3>컨텍스트패스: <%=contextPath %></h3>
	<h3>파일의실제경로: <%=realPath %></h3>
	
	<h1>잔향</h1>
	<%-- 잔향.txt 파일의 내용을 읽어서 웹 화면에 표시합시다. --%>
	<%
		// 정상적인 한글 처리를 위해서 문자 스트림을 사용합니다.
		BufferedReader br = null;
		try{	
			br = new BufferedReader(new FileReader(realPath));
			while(true){
				String line =br.readLine();	// 파일을 모두 읽고 더 이상 읽어 들인 내용이 없으면 null 반환
				if(line == null){
					break;
				}
				out.println(line + "<br/>");
			}
		}catch(FileNotFoundException e){
			out.println("<h3>파일을 찾을 수 없습니다.</h3>");
		}catch(IOException e){
			out.println("<h3>파일을 읽을 수 없습니다.</h3>");
		}finally{
			try{
				if(br != null){
					br.close();
				}
			}catch(Exception e){
				
			}
		}
	%>
	
</body>
</html>