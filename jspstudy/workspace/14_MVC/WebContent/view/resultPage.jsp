<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>제목</td>
				<td>작성자</td>
				<td>내용</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardList}" varStatus="k">
				<tr>
					<td>${k.index + 1} ${k.count}</td> <!-- 자동 인덱스 -->
					<td>${board.title}</td>
					<td>${board.writer}</td>
					<td>${board.content}</td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>