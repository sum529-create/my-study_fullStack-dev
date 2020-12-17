<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="/15_DBCP/insertPage.do">새 글 작성하기</a><br/><br/>
	
	<table border="1">
		<thead>
			<tr>
				<td>게시글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일자</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="greenDto" items="${list }">
					<tr>
						<td>${greenDto.no }</td>
						<td><a href="/15_DBCP/viewPage.do?no=${greenDto.no}">${greenDto.title }</a></td>
						<!-- controller로 가야하기 때문 -->
						<td>${greenDto.writer }</td>
						<td>${greenDto.hit }</td>
						<td>${greenDto.postDate }</td>
					</tr>
				
				</c:forEach>
			</c:if>
			
		</tbody>
	</table>
</body>
</html>