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
	제목<br/>
	<input type="text" name="gTitle" value="${guestDto.gTitle}"/><br/><br/>
	작성자<br/>
	<input type="text" name="gWriter" value="${guestDto.gWriter }"/><br/><br/>
	파일첨부<br/>
	<c:if test="${guestDto.gFilename eq null }">
		없음
	</c:if>
	<c:if test="${guestDto.gFilename ne null }">
		<a href="/MyHome/download.guest?gFilename=${guestDto.gFilename}">${guestDto.gFilename }</a>
		&nbsp;&nbsp;
		<input type="button" value="삭제" onclick="fn_deleteFile(this.form)"/>
	</c:if><br/><br/>
	내용<br/>
	<textarea rows="10" cols="40" name="gContent">${guestDto.gContent }</textarea><br/><br/>
	<input type="button" value="방명록수정하기" onclick="fn_guestUpdatePage(this.form)"/>
	<input type="button" value="방명록삭제하기" onclick="fn_guestDeletePage(this.form)"/>
	<input type="button" value="방명록목록으로이동하기" onclick="location.href='/MyHome/guestListPage.guest'"/>
</form>


<%@ include file="../template/footer.jsp" %>