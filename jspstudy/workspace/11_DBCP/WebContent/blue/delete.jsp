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
	
	int result = BlueDao.getInstance().delete(no);
	
%>    
<script>
	var result = '<%=result%>';
	if(result > 0){
		alert('삭제되었습니다.');
		location.href='/11_DBCP/blue/listPage.jsp';
	}
</script>