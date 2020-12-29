<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
</jsp:include>
<script>
	function fn_deleteFile(f) {
		if(f.gPw.value == ''){
			alert('삭제비밀번호를 입력하세요.');
			return;
		}else if(f.gPw.value != '${guestDto.gPw}'){
			alert('삭제비밀번호를 확인하세요.');
			return;
		}
		f.action = '/MyHome/guestDeleteFile.guest';
		f.submit();
	}
	function fn_guestUpdatePage(f) {
		f.action = '/MyHome/guestUpdatePage.guest';
		f.submit();
	}
	
	function fn_guestDeletePage(f) {
		f.action = '/MyHome/guestDeletePage.guest';
		f.submit();
	}
</script>

	<form method = "post">
		제목<br/>
		${guestDto.gTitle}<br/><br/>
		작성자<br/>
		${guestDto.gWriter }<br/><br/>
		파일첨부<br/>
		<c:if test="${guestDto.gFilename eq null }">
			없음
		</c:if>
		<c:if test="${guestDto.gFilename ne null }">
			<a href="/MyHome/download.guest?gFilename=${guestDto.gFilename}">${guestDto.gFilename}</a>
			&nbsp;&nbsp;
				<input type="password" name="gPw" placeholder="삭제비밀번호"/>
				<%-- hidden --%>
				<input type="hidden" name="gNo" value="${guestDto.gNo}"/>
				<input type="hidden" name="gFilename" value="${guestDto.gFilename}"/>
				<input type="button" value="삭제" onclick="fn_deleteFile(this.form)"/>
		</c:if><br/><br/>
		내용<br/>
		<pre>${guestDto.gContent }</pre><br/><br/>
	</form>
	
	<%-- hidden에 담아 둘 것들 --%>
	<form method="post">
		<input type="hidden" name="gNo" value="${guestDto.gNo}"/> 
		<input type="hidden" name="gWriter" value="${guestDto.gWriter}"/> 
		<input type="hidden" name="gTitle" value="${guestDto.gTitle}"/> 
		<input type="hidden" name="gContent" value="${guestDto.gContent}"/> 
		<input type="hidden" name="gFilename" value="${guestDto.gFilename}"/>
		<input type="hidden" name="gPw" value="${guestDto.gPw}"/>
		 
		<input type="button" value="방명록수정하기" onclick="fn_guestUpdatePage(this.form)"/>
		<input type="button" value="방명록삭제하기" onclick="fn_guestDeletePage(this.form)"/>
		<input type="button" value="방명록목록으로이동하기" onclick="location.href='/MyHome/guestListPage.guest'"/>
	</form>


<%@ include file="../template/footer.jsp" %>