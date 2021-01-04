<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
</jsp:include>
<script>
	function fn_guestInsert(f) {
		if (f.gTitle.value == '' || f.gPw.value == '') {
			alert('제목과 비밀번호는 필수입니다.');
			return;
		}
		f.action = '/MyHome/guestInsert.guest';
		f.submit();
	}
</script>
<form method = "post" enctype="multipart/form-data">
	<h3>방명록 작성하기</h3>
	제목<br/>
	<input type="text" name="gTitle"/><br/><br/>
	작성자<br/>
	<c:if test="${loginDto eq null }">
		<input type="text" name="gWriter"/><br/><br/>
	</c:if>
	<c:if test="${loginDto ne null }">
		<input type="text" name="gWriter" value="${loginDto.mName }"/><br/><br/>
	</c:if>
	비밀번호<br/>
	<input type="password" name="gPw"><br/><br/>
	파일첨부<br/>
	<input type="file" name="gFilename"/><br/><br/>
	내용<br/>
	<textarea rows="10" cols="40" name="gContent"></textarea><br/><br/>
	<input type="button" value="작성완료하기" onclick="fn_guestInsert(this.form)"/>
	<input type="reset" value="다시작성하기"/>
	<input type="button" value="방명록목록으로이동하기" onclick="location.href='/MyHome/guestListPage.guest'"/>
</form>


<%@ include file="../template/footer.jsp" %>