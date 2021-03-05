<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - Notice Page" name="title" />
</jsp:include>

<div class="notice-title inner-w">
	<h2 class="txt">공지사항</h2>
</div>
<div class="notice-content inner-w">
	<nav class="notice-list">
		<c:if test="${empty list}">
			<div>
				<span>등록된 공지사항이 없습니다.</span>
			</div>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="noticeDto" items="${list}">
				<div>
					<a href="noticeViewPage.do?no=${noticeDto.NNo}&page=${page}">
						<span>❑&nbsp; <strong>${noticeDto.NTitle}</strong></span>
					</a>
				</div>
			</c:forEach>
		</c:if>
	</nav>
	
	<div class="paging">
	    ${paging}
	    
	    <%-- TODO : 세션 확인해서 관리자 권한을 가진 사용자에게만 보이게 해야 함 (세션 구현후 진행예정)  --%>
	    <br/>
	    <c:if test="${loginDto.role eq 'ADMIN'}">
			<a href="noticeInsertPage.do">새 글 작성하기</a>
	    </c:if>
	</div>
</div>

<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>