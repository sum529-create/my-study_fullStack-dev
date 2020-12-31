<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="게시물수정" name="title" />
</jsp:include>

<script>
	function fn_bbsUpdate(f) {
		if('${bbsDto.bbs_pw}' != f.bbs_pw.value){
			alert('비밀번호를 확인하세요.');
			return;
		}
		f.action = '/MyHome/bbsUpdate.bbs';
		f.submit();
	}
</script>

<form method="get">
	
	작성자<br>
	${bbsDto.bbs_writer}<br/><br/>

	작성IP<br>
	${bbsDto.bbs_ip}<br/><br/>

	작성일<br>
	${bbsDto.bbs_date}<br/><br/>
	
	제목<br/>
	<input type="text" name="bbs_title" value="${bbsDto.bbs_title}"/><br/><br/>

	내용<br/>
	<textarea rows="3" cols="40" name="bbs_content">${bbsDto.bbs_content}</textarea><br/><br/>
	
	수정비밀번호
	<input type="password" name="bbs_pw"/>
	
	<%-- hidden --%>
	<input type="hidden" name="bbs_no" value="${bbsDto.bbs_no}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	
	<input type="button" value="게시물수정하기" onclick="fn_bbsUpdate(this.form)">
		<input type="button" value="목록으로이동하기" onclick="location.href='/MyHome/bbsListPage.bbs?page=${param.page}'"/>
</form>


<%@ include file="../template/footer.jsp" %>