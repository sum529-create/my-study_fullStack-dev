<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="게시판목록" name="title" />
</jsp:include>

<script>
</script>

<%-- 1. 게시판 검색 --%>
<form>
	<select name="column">
		<option value="BTITLE">제목</option>
		<option value="BCONTENT">내용</option>
		<option value="MID">작성자</option>
		<option value="BOTH">제목+내용</option>
	</select>
	<input type="text" name="query" />
	<input type="button" value="검색" onclick="" />
</form>
<br/><br/>

<%-- 2. 게시판 작성(로그인 유저만 보인다.) --%>
<form>
	<input type="button" value="전체목록보기" onclick="" />
	<c:if test="${loginDto ne null}">
		<input type="button" value="내 게시글 보기" onclick="" />
		<input type="button" value="새 게시글 작성하기" onclick="location.href='/MyHome/boardInsertPage.board'" />
	</c:if>
</form>
<br/><br/>

<%-- 3. 게시판 목록 --%>
전체 ${totalRecord}개<br/>
<table border="1">
	<thead>
		<tr>
			<td>순번</td>
			<td>제목</td>
			<td>작성자</td>
			<td>최종수정일</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5">작성된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="boardDto" items="${list}" varStatus="k">
					<tr>
						<td>${totalRecord - ((page - 1) * recordPerPage + k.index)}</td>
						<td>${boardDto.bTitle}</td>
						<td>${boardDto.mId}</td>
						<td>${boardDto.bLastModify}</td>
						<td>${boardDto.bHit}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">
				${paging}
			</td>
		</tr>
	</tfoot>
</table>

<%@ include file="../template/footer.jsp" %>