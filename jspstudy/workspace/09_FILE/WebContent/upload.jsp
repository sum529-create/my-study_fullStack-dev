<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%-- 업로드가 진행되는 곳 --%>    
    
<%    
  	// request의 인코딩을 할 필요가 없다.
  	// MultipartRequest 객체를 만들 때 인코딩을 한다.
  	
  	// 디렉토리명을 변수로 저장한다.
  	String directory = "archive";

	// 디렉토리의 실제 경로를 알아낸다.
	String realPath = request.getServletContext().getRealPath(directory);
	
	// MultipartRequest 객체를 만든다.	(이 때 업로드가 진행된다.)
	MultipartRequest multipart = new MultipartRequest(
			request,
			realPath,
			1024 * 1024 * 10, 	// 업로드 크기 (10MB)
			"UTF-8",
			new DefaultFileRenamePolicy() // 동일한 파일이 업로드되면 기존 파일명을 수정하는 방법이다.(원래 파일명에 숫자 붙이기)
			);
	// 1024 -> KB
	// 1024 1024 -> MB
	// 업로드 최대 사이즈
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>업로드 결과</h3>
	<ul>
		<li>경로: <%=realPath%></li>
		<li>업로더: <%=request.getParameter("uploader") %></li>
		<li>업로더: <%=multipart.getParameter("uploader") %></li>
		<li>올릴 때 파일명: <%=multipart.getOriginalFileName("filename") %>
		<li>저장된 파일명: <%=multipart.getFilesystemName("filename") %>
		<%
			// multipart 객체에 저장된 파일을 가져오는 메소드: getFile
			File file = multipart.getFile("filename");
			// file을 통해서 필요한 정보를 얻어낸다.
			String filename = file.getName();	// 파일명
			long filesize = file.length() / 1024;	// file.length(): 바이트이므로 / 1024를 통해서 KB로 변환
			pageContext.setAttribute("filesize", filesize);
			String lastModifiedDate = new SimpleDateFormat("yyyy-MM-dd a h:mm").format(file.lastModified());
			
		%>
		<li>저장된 파일명: <%=filename %></li>
		<li>파일크기: <fmt:formatNumber value ="${filesize}" pattern="#,##0"/>KB</li>
		<li>최종수정일: <%=lastModifiedDate %></li>
	</ul>

	<br/><br/>
	<a href="download.jsp?directory=<%= directory %>&filename=<%=filename%>">다운로드</a>

</body>
</html>









