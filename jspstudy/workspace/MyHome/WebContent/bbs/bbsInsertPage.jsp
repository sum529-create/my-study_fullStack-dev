<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="BBS게시판" name="title" />
</jsp:include>
<script>
	function fn_bbsInsert(f) {
		if(f.bbs_title.value == '' || 
			f.bbs_writer.value == '' ||
			f.bbs_pw.value == ''){
			alert('필수 항목이 누락되었습니다.');
			return;
		}
		f.action = '/MyHome/bbsInsert.bbs';
		f.submit();
	}
</script>

*: 필수<br/>
<form method="post">
	제목<br/>
	<input type="text" name="bbs_title"/> <br/><br/>
	작성자<br/>
	<input type="text" name="bbs_writer"/> <br/><br/>
	비밀번호<br/>
	<input type="password" name="bbs_pw"/> <br/><br/>
	내용<br/>
	<textarea rows="10" cols="40" name="bbs_content"></textarea>
	<input type="button" value="작성완료" onclick="fn_bbsInsert(this.form)"/>
	<input type="reset" value="다시작성"/>
	<input type="button" value="목록으로이동" onclick="location.href='/MyHome/bbsListPage.bbs'"/>
</form>

<%@ include file="../template/footer.jsp" %>