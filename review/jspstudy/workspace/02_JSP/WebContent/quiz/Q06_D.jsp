<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	boolean isSuccess = Boolean.parseBoolean(request.getParameter("isSuccess"));
	String filename = "";
	String message = "";
	
	if(isSuccess){
		filename = request.getParameter("filename");
		String realPath = application.getRealPath("quiz/" + filename);
		BufferedReader br = null;
		try{
			br = new BufferedReader(new FileReader(realPath));
			String line = null;
			while(true){
				line = br.readLine();
				if(line == null){
					break;
				}
				message += line + "<br>";
			}
			
		}catch(FileNotFoundException e){
			out.println("해당 내용을 찾을 수 없습니다.");
		}catch(IOException e){
			out.println("해당 내용을 읽을 수 없습니다.");
		}finally{
			try{
				if(br != null){
					br.close();
				}
			}catch(Exception e){
				e.printStackTrace();
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
	<%
		if(isSuccess){%>
			<h1>가입되었습니다.</h1>
			<h3>가입 내용</h3>
			<%=message %>
			<br/>
			<form method="get">
				<input type="hidden" name="filename" value="<%=filename %>"/>
				<input type="button" value="탈퇴" onclick="fn_signout(this.form)"/>
			</form>
	  <%}else{%>
		 <h1>가입되지 않았습니다.</h1>
		 <a href="Q06_A.jsp">다시 가입하기</a> 
	  <%}
	
	%>
	<script type="text/javascript">
		function fn_signOut(f) {
			if(confirm('탈퇴하시겠습니까?')){
				f.action = "Q06_E.jsp";
				f.submit();
			}
		}
	</script>
</body>
</html>