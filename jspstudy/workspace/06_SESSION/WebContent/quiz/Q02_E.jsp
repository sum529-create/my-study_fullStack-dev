<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filename = (String)session.getAttribute("filename");
	String realPath = request.getRealPath("/" + filename);
	boolean isDelete = false;
	File file = new File(realPath);
	if(file.exists()) {
		file.delete();
		isDelete = true;
	}
%>

<script>
	if(<%=isDelete%>){
		alert("탈퇴되었습니다.");
		location.href='Q02_A.jsp';
	}else{
		alert('탈퇴되지 않았습니다.');
		history.back();
	}
</script>