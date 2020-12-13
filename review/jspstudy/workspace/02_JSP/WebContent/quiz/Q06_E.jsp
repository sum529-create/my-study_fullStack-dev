<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String filename = request.getParameter("filename");
	String realPath = application.getRealPath("quiz/" + filename);
	
	boolean isDelete = false;
	File file = new File(realPath);
	
	if(file.exists()){
		file.delete();
		isDelete = true;
	}
	
%>
<script>
	if(<%=isDelete%>){
		alert('탈퇴되었습니다.');
		location.href="Q06_A.jsp";
	}else{
		alert('탈퇴죄지 않았습니다.');
		history.back();
	}

</script>