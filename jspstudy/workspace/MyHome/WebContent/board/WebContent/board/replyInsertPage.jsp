<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="댓글삽입" name="title" />
</jsp:include>

<script>
	function fn_replyInsert(f) {
		if(f.bTitle.value == ''){
			alert('제목은 필수입니다.');
			f.bTitle.focus();
			return;
		}
		f.action = '/MyHome/replyInsert.board';
		f.submit();
	}
</script>

<form method="post">
	<h3>새 댓글 작성</h3>
	작성자 <br/>
	${loginDto.mName}<br/><br/>

	제목 <br/>
	<input type="text" name="bTitle"/><br/><br/>

	내용 <br/>
	<textarea rows="3" cols="30" name="bContent"></textarea><br/><br/>
	
	
	<%-- hidden --%>
	<input type="hidden" name="mId" value="${loginDto.mId}"/>
	<input type="hidden" name="bNo" value="${param.bNo}"/>		<%-- 댓글이 달릴 게시글의 번호(댓글의 그룹 번호로 사용) --%>
	<input type="hidden" name="page" value="${param.page}"/>	<%-- 댓글 삽입 후 boardListPage로 넘어갈 때 필요한 정보 --%>
	
	<input type="button" value="댓글작성완료" onclick="fn_replyInsert(this.form)"/>
	<input type="reset" value="다시작성"/>
	<input type="button" value="목록으로이동" onclick="location.href='/MyHome/boardListPage.board?page=${param.page}'">
</form>

<%@ include file="../template/footer.jsp" %>