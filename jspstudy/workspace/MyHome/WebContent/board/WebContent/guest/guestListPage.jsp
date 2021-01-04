<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />


<jsp:include page="../template/header.jsp">
	<jsp:param value="방명록" name="title"/>
</jsp:include>
    
<h1>방명록</h1>
<a href="/MyHome/guestInsertPage.guest">방명록 작성하기</a>
<br/><br/><br/>
<form action="/MyHome/queryList.guest">
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
			<td>첨부</td>
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
					<td><a href="/MyHome/guestViewPage.guest?gNo=${guestDto.gNo}">${guestDto.gTitle}</a></td>
					<td>${guestDto.gWriter}</td>
					<td>${guestDto.gPostDate}</td>
					<td>
						<c:if test="${guestDto.gFilename ne null}">
							<a href="/MyHome/download.guest?gFilename=${guestDto.gFilename}"><i class="fas fa-paperclip"></i></a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>

<%@ include file="../template/footer.jsp" %>