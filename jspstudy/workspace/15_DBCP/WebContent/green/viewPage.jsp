<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>${greenDto.no}번 게시글입니다.</h3>
	<form>
		작성자<br/>
		<pre>${greenDto.writer }</pre><br/><br/>
		제목<br/>
		<pre>${greenDto.title }</pre><br/><br/>
		내용<br/>
		<pre>${greenDto.content }</pre><br/><br/>
		조회수<br/>
		<pre>${greenDto.hit }</pre><br/><br/>
		작성일<br/>
		<pre>${greenDto.postDate }</pre><br/><br/>
		<input type="button" value="수정하기" onclick=""/>
		<input type="button" value="삭제하기" onclick=""/>
		<input type="button" value="목록으로이동" onclick="location.href='/15_DBCP/listPage.do'"/>
		
	</form>
</body>
</html>