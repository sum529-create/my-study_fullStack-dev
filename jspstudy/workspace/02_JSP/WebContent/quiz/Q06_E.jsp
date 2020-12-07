<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String filename = request.getParameter("filename");
	String realPath = application.getRealPath("quiz/" + filename);
	
	// 파일이 정상적으로 삭제되었는지 판단하는 플래그 변수 isDelete
	boolean isDelete = false;
	File file = new File(realPath);
	if ( file.exists() ) {  // 파일이 존재하면
		file.delete();  // 그 파일을 지웁니다.
		isDelete = true;
	}
%>

<script type="text/javascript">
	if ( <%=isDelete%> ) {
		alert('탈퇴되었습니다.');
		location.href = '/02_JSP/quiz/Q06_A.jsp';
	} else {
		alert('탈퇴되지 않았습니다.');
		history.back();
	}
</script>