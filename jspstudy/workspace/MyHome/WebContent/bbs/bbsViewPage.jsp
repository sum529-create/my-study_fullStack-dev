<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BBS게시판" name="title" />
</jsp:include>

<script>
	
</script>
<%-- session에 저장된 bbsDto를 사용하는 방법 --%>
<%-- 1. ${bbsDto} --%>
<%-- 2. ${sessionScope.bbsDto} --%>

<div>
	제목<br/>
	${bbsDto.bbs_title}<br/><br/>
	
	작성자<br/>
	${bbsDto.bbs_writer}<br/><br/>
	
	작성IP<br/>
	${bbsDto.bbs_ip}<br/><br/>
	
	작성일자<br/>
	${bbsDto.bbs_date }<br/><br/>

	내용<br/>
	<pre>${bbsDto.bbs_content }</pre><br/><br/>
	
	<input type="button" value="수정하기" onclick="location.href='/MyHome/'"/>
	<input type="button" value="삭제하기" onclick="location.href='/MyHome/'"/>
	<input type="button" value="목록으로이동하기" onclick="location.href='/MyHome/bbsListPage.bbs?page=${param.page}'"/>
</div>
	<br/><hr/><br/>
	
	<%-- 댓글 작성 창 --%>
	<div>
		<form action="/MyHome/replyInsert.reply" method="post">
			<input type="hidden" name="bbs_no" value="${bbsDto.bbs_no}" />
			<button>댓글 등록하기</button><br/><br/>
			작성자<br/>
			<input type="text" name="rWriter"/> <br/><br/>
			비밀번호<br/>
			<input type="password" name="rPw"/><br/><br/>
			<textarea rows="3" cols="40" name="rContent" placeholder="댓글의 마음의 창입니다. 고운말을 씁시다."></textarea>
		</form>
	</div>
	<br/><hr/><br>

<%@ include file="../template/footer.jsp" %>