<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="게시판" name="title" />
</jsp:include>

<script>
	if (${result} == false){
		alert('게시글의 정보를 확인할 수 없습니다.');
		history.back();
	}
</script>

${boardDto.bNo}번 게시글입니다. <br/>

작성자<br/>
${boardDto.mId}<br/><br/>

작성일자<br/>
${boardDto.bDate}<br/><br/>

최종수정일<br/>
${boardDto.bLastModify}<br/><br/>

IP<br/>
${boardDto.bIp}<br/><br/>

내용<br/>
<pre>${boardDto.bContent}</pre><br/><br/>

<input type="button" value="전체목록으로이동"  onclick="location.href='/MyHome/boardListPage.board?page=${page}'"/>
<%@ include file="../template/footer.jsp" %>