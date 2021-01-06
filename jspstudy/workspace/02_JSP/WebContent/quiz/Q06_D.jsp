<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	boolean isSuccess = Boolean.parseBoolean(request.getParameter("isSuccess"));
	String message = "";
	String filename = "";
	
	if ( isSuccess ) {  // 파일 생성에 성공했다면(가입 성공)
		filename = request.getParameter("filename");
		String realPath = application.getRealPath("quiz/" + filename);
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(realPath));
			String line = null;
			while (true) {
				line = br.readLine();  // 한 줄 읽기
				if (line == null) {
					break;
				}
				message += line + "<br/>";
			}
		} catch (FileNotFoundException e) {
			out.println("해당 내용을 찾을 수 없습니다.");
		} catch (IOException e) {
			out.println("해당 내용을 읽을 수 없습니다.");
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (Exception e) {
				
			}
		}
	}  // if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% if ( isSuccess ) { %>
		<h1>가입되었습니다.</h1>
		<h3>가입내용</h3>
		<%=message%>
		<br/>
		<form method="post">
			<%-- 삭제할 파일명을 알려줘야 하므로 아래 hidden을 넘겨야 합니다. --%>
			<input type="hidden" name="filename" value="<%=filename%>" />
			<input type="button" value="탈퇴" onclick="fn_signOut(this.form)" />
		</form>
	<% } else { %>
		<h1>가입되지 않았습니다.</h1>
		<a href="/02_JSP/quiz/Q06_A.jsp">다시 가입하기</a>
	<% } %>
	
	<script type="text/javascript">
		function fn_signOut(f) {
			if (confirm('탈퇴하시겠습니까?')) {
				f.action = '/02_JSP/quiz/Q06_E.jsp';
				f.submit();
			}
		}
	</script>
	
</body>
</html>