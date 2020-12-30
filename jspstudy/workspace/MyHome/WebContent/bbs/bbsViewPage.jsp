<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<jsp:include page="../template/header.jsp">
	<jsp:param value="BBS게시판" name="title" />
</jsp:include>

<script>
	
</script>
<%-- session에 저장된 bbsDto를 사용하는 방법 --%>
<%-- 1. ${bbsDto} --%>
<%-- 2. ${sessionScope.bbsDto} --%>

<div>
	<input type="button" value="수정하기" onclick="location.href='/MyHome/bbsUpdatePage.bbs?page=${param.page}'"/>
	<input type="button" value="삭제하기" onclick="location.href='/MyHome/bbsDeletePage.bbs?page=${param.page}'"/>
	<input type="button" value="목록으로이동하기" onclick="location.href='/MyHome/bbsListPage.bbs?page=${param.page}'"/>
	<br/><br/>
	
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
	
	<br/><hr/><br/>
	
	<%-- 댓글 작성 창 --%>
	<div>
		<form action="/MyHome/replyInsert.reply" method="post">
			<%-- hidden --%>
			<input type="hidden" name="bbs_no" value="${bbsDto.bbs_no}" />
			<input type="hidden" name="page" value="${param.page}" />
			<button>댓글 등록하기</button><br/><br/>
			작성자<br/>
			<input type="text" name="rWriter"/> <br/><br/>
			비밀번호<br/>
			<input type="password" name="rPw"/><br/><br/>
			<textarea rows="3" cols="40" name="rContent" placeholder="댓글의 마음의 창입니다. 고운말을 씁시다."></textarea>
		</form>
	</div>
	<br/><hr/><br>

	<%-- 댓글 목록 --%>
	<%-- session에 replyList가 저장되어 있다. --%>
	<table>
		<tbody> 
			<c:if test = "${empty replyList}">
				<tr>
					<td colspan="4">첫 댓글을 남겨주세요.</td>
				</tr>
			</c:if>
			<c:if test = "${not empty replyList}">
				<c:forEach var="replyDto" items="${replyList}">
					<tr>
						<td>${replyDto.rWriter}</td>
						<td>${replyDto.rContent }</td>
						<td>${replyDto.rDate}</td>
						<td><a href="/MyHome/replyDelete.reply?rNo=${replyDto.rNo}&bbs_no=${replyDto.bbs_no}&page=${param.page}">X</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
<%@ include file="../template/footer.jsp" %>