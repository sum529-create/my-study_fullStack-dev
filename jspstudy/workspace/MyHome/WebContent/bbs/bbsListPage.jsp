<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="BBS게시판" name="title" />
</jsp:include>

<style>
	tfoot.paging {
		color: silver;
	}
	tfoot > a {
		text-decoration: none;
		color: silver;
	}
	tfoot > a:hover {
		color: limegreen;
	}
	span.disable {
		font-weight: 900;
		color: limegreen;
	}
</style>

<input type="button" value="새 글 작성하기" onclick="location.href='/MyHome/bbsInsertPage.bbs'" /><br/><br/>

<table border="1">
	<caption>BBS게시판</caption>
	<thead>
		<tr>
			<td>순번</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="5">작성된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="bbsDto" items="${list}" varStatus="k">
				<tr>
					<td>${pageVo.totalRecord - ((pageVo.page - 1) * pageVo.recordPerPage + k.index)}</td>
					<td><a href="/MyHome/bbsViewPage.bbs?bbs_no=${bbsDto.bbs_no }">${bbsDto.bbs_title}</a></td>
					<td>${bbsDto.bbs_writer}</td>
					<td>${bbsDto.bbs_date}</td>
					<td>${bbsDto.bbs_hit}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot class="paging">
		<tr>
			<td colspan="5">
				<%-- 1. 이전 버튼(이전 블록으로 이동) --%>
				<c:if test="${pageVo.beginPage <= pageVo.pagePerBlock}">
					이전&nbsp;
				</c:if>
				<c:if test="${pageVo.beginPage > pageVo.pagePerBlock}">
					<a href="/MyHome/bbsListPage.bbs?page=${pageVo.beginPage - 1}">이전&nbsp;</a>
				</c:if>
				<%-- 2. 페이지 번호 --%>
				<c:forEach var="page" begin="${pageVo.beginPage}" end="${pageVo.endPage}" step="1">
					<%-- 1) 현재 페이지는 링크가 안 걸린다. --%>
					<c:if test="${page eq pageVo.page}">
						<span class="disable">${page}&nbsp;</span>
					</c:if>
					<%-- 2) 다른 페이지는 링크가 걸린다. --%>
					<c:if test="${page ne pageVo.page}">
						<a href="/MyHome/bbsListPage.bbs?page=${page}">${page}&nbsp;</a>
					</c:if>
				</c:forEach>
				<%-- 3. 다음 버튼(다음 블록으로 이동) --%>
				<c:if test="${pageVo.endPage >= pageVo.totalPage}">
					다음
				</c:if>
				<c:if test="${pageVo.endPage < pageVo.totalPage}">
					<a href="/MyHome/bbsListPage.bbs?page=${pageVo.endPage + 1}">다음</a>
				</c:if>
			</td>
		</tr>
	</tfoot>
</table>

<%@ include file="../template/footer.jsp" %>