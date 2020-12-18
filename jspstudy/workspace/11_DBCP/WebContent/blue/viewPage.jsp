<%@page import="dto.BlueDto"%>
<%@page import="dao.BlueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
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
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_updatePage(f) {
		f.action = '/11_DBCP/blue/updatePage.jsp';
		f.submit();
	}
</script>
</head>
<body>

	<h3>${blueDto.no}번 게시글입니다.</h3>
	<div>
		작성자<br/>
		<pre>${blueDto.writer}</pre>
		
		제목<br/>
		<pre>${blueDto.title }</pre>
		
		내용<br/>
		<pre>${blueDto.content}</pre>
		
		작성일<br/>
		<pre>${blueDto.postDate}</pre>
		
		<c:if test="${not empty blueDto.filename }">
			첨부 이미지<br/>
			<img alt="이미지아님" src="${realPath}/${blueDto.filename}"/>
			<!-- insertpage에서 session에 올려놓은 realPath -->
			<pre>${blueDto.filename}</pre>
		</c:if>
	</div>
	<br/><br/>
	
	
	<form action="/11_DBCP/blue/delete.jsp" method="post" onsubmit="return confirm('삭제하시겠습니까?')">
		<input type="button" value="목록으로 이동하기" onclick="location.href='/11_DBCP/blue/listPage.jsp'"/>
		<button>삭제하기</button>
		<input type="button" value="수정하기" onclick = "fn_updatePage(this.form)"/>
		<input type="hidden" name="no" value="${blueDto.no}"/>
		<input type="hidden" name="writer" value="${blueDto.writer}"/>
		<input type="hidden" name="title" value="${blueDto.title}"/>
		<input type="hidden" name="content" value="${blueDto.content}"/>
		<input type="hidden" name="postDate" value="${blueDto.postDate}"/>
		
		<%-- 추가1. delete.jsp 로 넘겨서 첨부파일 삭제하려고 함 --%>
		<input type="hidden" name="realPath" value="<%=realPath%>" />
		<input type="hidden" name="filename" value="${blueDto.filename}" />
	</form>
</body>
</html>