<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<jsp:include page="../template/header.jsp">
	<jsp:param value="방명록" name="title"/>
</jsp:include>

<input type="button" value="새 글 작성하기" onclick=""/><br/><br/>

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
			<c:forEach var="bbsDto" items="${list}">
				<tr>
					<td>${bbsDto.bbs_no}</td>
					<td>${bbsDto.bbs_title}</td>
					<td>${bbsDto.bbs_writer}</td>
					<td>${bbsDto.bbs_date}</td>
					<td>${bbsDto.bbs_hit}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot>
		<tr>
			<td colspan ="5">
				◀ 1 2 3 4 5 ▶
			</td>
		</tr>
	</tfoot>
</table>

<%@ include file="../template/footer.jsp" %>