<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 
		원래 전 프로젝트에서는 업데이트하기 위해 인코딩을 해줬지만
		지금은 Controllor로 이동하면서 해줄 필요가 없다. -->
	<h3>${param.no}번 게시글을 수정합니다.</h3>
	<form method="post">
		작성자<br/>
		${param.writer}<br/><br/>
		
		제목<br/>
		<input type="text" name="title" value="${param.title}"/><br/><br/>
		
		내용<br/>
		<textarea rows="5" cols="50" name="content">${param.conten}</textarea><br/><br/>
		
		조회수<br/>
		${param.hit}<br/>
		
		작성일<br/>
		${param.postDate}<br/>
		
		<input type="button" value="수정하기" onclick = ""/>
		<input type="reset" value="다시작성하기"/>
		<input type="button" value="취소하기" onclick = "alert('취소합니다.'); history.back();"/>
		<input type="button" value="목록으로이동" onclick = "location.href='/15_DBCP/listPage.do'"/>
	</form>
	
</body>
</html>