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
	// 게시글 삭제
	function fn_boardDelete(f) {
		if(confirm('삭제할까요?')){
			f.action= '/MyHome/boardDelete.board';
			f.submit();
		}
	}
	
	// 댓글 작성 창으로 이동
	function fn_replyInsertPage(f) {
		f.action = '/MyHome/replyInsertPage.board';
		f.submit();
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


<form method="post">	<!-- method 상관없음 -->

	<%-- hidden --%>
	<input type="hidden" name="bNo" value="${boardDto.bNo}"/>
	<input type="hidden" name="page" value="${page}"/>

	<input type="button" value="전체목록으로이동"  onclick="location.href='/MyHome/boardListPage.board?page=${page}'"/>
	<%-- 작성자만 삭제 할 수 있다. --%>
	<c:if test="${boardDto.mId eq loginDto.mId}">
		<input type="button"/ value="삭제하기" onclick="fn_boardDelete(this.form)"/>
	</c:if>
	
	<%-- 로그인을 해야만 댓글을 작성할 수 있다. --%>
	<c:if test="${loginDto ne null }">
		<input type="button" value="댓글달기" onclick="fn_replyInsertPage(this.form)"/>
	</c:if>
</form>
<%@ include file="../template/footer.jsp" %>