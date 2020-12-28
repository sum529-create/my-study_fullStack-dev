<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="방명록" name="title"/>
</jsp:include>
    
<h1>방명록</h1>
<a href="">방명록 작성하기</a>
<br/><br/><br/>
<form action="">
	<input type="text" name="query" placeholder="제목 + 내용"/>
	<button>검색</button>
</form>
<br/><br/>
<table border="1">
	<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list }">
			<tr>
				<td colspan="4">작성된 방명록이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="guestDto" items="${list}">
				<tr>
					<td>${guestDto.gNo}</td>
					<td>${guestDto.gTitle}</td>
					<td>${guestDto.gWriter}</td>
					<td>${guestDto.gPostDate}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>

<%@ include file="../template/footer.jsp" %>