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
	
	<a href="/16_MYBATIS/insertPage.lime">새 글 작성하기</a><br/><br/>
	
	<table border="1">
		<thead>
			<tr>
				<td>게시글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="limeDto" items="${list }">
					<tr>
						<td>${limeDto.no }</td>
						<td><a href="/16_MYBATIS/viewPage.lime?no=${limeDto.no }">${limeDto.title }</a></td>
						<td>${limeDto.writer }</td>
						<td>${limeDto.postDate }</td>
					</tr>
				</c:forEach>
			</c:if>
			
		</tbody>
	</table>
</body>
</html>