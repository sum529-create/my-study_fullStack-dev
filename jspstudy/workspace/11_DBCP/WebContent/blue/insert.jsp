<%@page import="dao.BlueDao"%>
<%@page import="dto.BlueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BlueDto blueDto = new BlueDto();
	blueDto.setWriter(writer);
	blueDto.setTitle(title);
	blueDto.setContent(content);
	
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
