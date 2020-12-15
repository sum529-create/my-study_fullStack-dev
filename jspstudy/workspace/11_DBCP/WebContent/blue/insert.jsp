<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BlueDao"%>
<%@page import="dto.BlueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String directory = "storage";
	String realPath = request.getServletContext().getRealPath("/"+directory);
	// application.setAttribute("realPath", realPath);
	// session.setAttribute("realPath", realPath);
	MultipartRequest multipart = new MultipartRequest(
				request,
				realPath,
				1024 * 1024 * 10,
				"UTF-8",
				new DefaultFileRenamePolicy()
			);
	
	String writer =  multipart.getParameter("writer");
	String title =  multipart.getParameter("title");
	String content =  multipart.getParameter("content");
	
	BlueDto blueDto = new BlueDto();
	blueDto.setWriter(writer);
	blueDto.setTitle(title);
	blueDto.setContent(content);
	if(multipart.getFile("filename") == null){
		blueDto.setFilename("");
	}else{
		
		blueDto.setFilename(multipart.getFilesystemName("filename"));
	}
	
	int result = BlueDao.getInstance().insert(blueDto);
	
			
	
%>  

<script>
	var result = <%=result%>
	if(result > 0){
		alert('게시글이 등록되었습니다.');
		location.href='/11_DBCP/blue/listPage.jsp';
	}else{
		alert('게시글이 등록되지 않았습니다.');
		history.back();
	}
</script>  
