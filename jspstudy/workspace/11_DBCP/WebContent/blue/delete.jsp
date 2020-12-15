<%@page import="java.io.File"%>
<%@page import="dto.BlueDto"%>
<%@page import="dao.BlueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = 0;
	if(strNo != null && !strNo.isEmpty()){
		no = Integer.parseInt(strNo);
	}
	
	BlueDto blueDto = BlueDao.getInstance().view(no);
	pageContext.setAttribute("blueDto", blueDto);
	
	String directory = "storage";
	String realPath = request.getServletContext().getRealPath(directory);
	pageContext.setAttribute("realPath", realPath);
	String deleteFile = blueDto.getFilename();
	realPath += deleteFile;
	
	File f = new File(realPath);
	int result = 0;
	if(f.exists()){
		f.delete();
		result = BlueDao.getInstance().delete(no);
	}else{
		result = BlueDao.getInstance().delete(no);
	}
	
	
%>    
<script>
	var result = '<%=result%>';
	if(result > 0){
		alert('삭제되었습니다.');
		location.href='/11_DBCP/blue/listPage.jsp';
	}
</script>
