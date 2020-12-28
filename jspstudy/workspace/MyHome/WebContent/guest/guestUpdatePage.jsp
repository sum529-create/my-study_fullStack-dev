<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
</jsp:include>
<script>
	function fn_guestUpdatePage(f) {
		if(f.gTitle.value == ''){
			alert('제목은 필수입니다.');
			f.gTitle.focus();
			return;
		}
		if('${param.gTitle}' == f.gTitle.value && 
				'${param.gContent}' == f.gContent.value){
			alert('수정할 내용이 없습니다.');
			return;
		}
		f.action = '/MyHome/guestUpdate.guest';
		f.submit();
	}
	
</script>
<form method = "post" enctype="multipart/form-data">
	제목<br/>
	<input type="text" name="gTitle" value="${param.gTitle}"/><br/><br/>
	작성자<br/>
	<input type="text" name="gWriter" value="${param.gWriter }"/><br/><br/>
	파일첨부<br/>
	<input type="file" name="gFilename"/><br/><br/>
	&nbsp;&nbsp;
	<c:if test="${empty param.gFilename}">
		[기존 첨부파일: 없음]<br/><br/>
	</c:if>
	<c:if test="${not empty param.gFilename}">
		[기존 첨부파일: ${param.gFilename}]<br/><br/>
	</c:if>
	내용<br/>
	<textarea rows="10" cols="40" name="gContent">${param.gContent }</textarea><br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="gNo" value="${param.gNo}"/>
	
	<input type="button" value="변경내용수정하기" onclick="fn_guestUpdatePage(this.form)"/>
	<input type="reset" value="다시작성하기"/>
	<input type="button" value="방명록목록으로이동하기" onclick="location.href='/MyHome/guestListPage.guest'"/>
</form>


<%@ include file="../template/footer.jsp" %>