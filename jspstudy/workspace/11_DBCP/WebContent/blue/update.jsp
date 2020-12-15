<%@page import="dao.BlueDao"%>
<%@page import="dto.BlueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTf-8");
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BlueDto blueDto = new BlueDto();
	blueDto.setNo(Integer.parseInt(no));
	blueDto.setTitle(title);
	blueDto.setContent(content);
	
	int result = BlueDao.getInstance().update(blueDto);
	
	
%>  

<script>
	var result = <%=result%>;
	if(result > 0){
		alert('게시글이 수정되었습니다.')
		location.href='/11_DBCP/blue/viewPage.jsp?no=<%=no%>';
	}else{
		alert('게시글이 수정되지 않았습니다.');
		history.back();
	}
</script>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>