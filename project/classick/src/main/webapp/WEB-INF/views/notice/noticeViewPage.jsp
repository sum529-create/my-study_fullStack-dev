<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - Notice View Page" name="title" />
</jsp:include>

<script type="text/javascript">
	function fn_updatePage(f){
		f.action = "noticeUpdatePage.do";
		f.submit();
	}
	function fn_delete(f){
		if(confirm('삭제할까요?')){
			f.action = "noticeDelete.do";
			f.submit();
		}
	}
	function fn_goList(f){
		location.href = "noticeListPage.do?page=${page}"
	}
</script>

<style>
	#noticeUpBtn, #noticeDelBtn, #backBtn {
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
</style>

<div class="notice-title inner-w">
	<h2 class="txt">공지사항</h2>
</div>
<div class="notice-content inner-w">
	<div class="notice-view">
		<span>❑&nbsp; <strong>${noticeDto.NTitle}</strong></span>
		<br/><br/>
		<pre>${noticeDto.NContent}</pre>
		<img src="resources/storage/notice/${noticeDto.NFilename}" alt="${noticeDto.NFilename}" /><br/> 
	</div>
	<div class="button-list">
		<c:if test="${loginDto.role eq 'ADMIN'}">
			<form method="post">
				<%-- TODO : 세션 확인해서 관리자 권한을 가진 사용자에게만 보이게 해야 함 (세션 구현 후 진행예정)  --%>
				<input type="button" value="수정하기" id="noticeUpBtn" onclick="fn_updatePage(this.form)"/>
				<input type="button" value="삭제하기" id="noticeDelBtn" onclick="fn_delete(this.form)"/>
				<input type="hidden" name="nNo" value="${noticeDto.NNo}" />
				<input type="hidden" name="nTitle" value="${noticeDto.NTitle}" />
				<input type="hidden" name="nContent" value="${noticeDto.NContent}" />
				<input type="hidden" name="nWriter" value="${noticeDto.NWriter}" />
				<input type="hidden" name="nFilename" value="${noticeDto.NFilename}" />
				<input type="hidden" name="nRegDate" value="${noticeDto.NRegDate}" />
				<%-- 공통 권한  --%>
				<input type="button" value="목록으로" id="backBtn" onclick="fn_goList()"/>
			</form>
		</c:if>
	</div>
</div>

<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>