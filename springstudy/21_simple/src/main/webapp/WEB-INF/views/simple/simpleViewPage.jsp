<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>선택한 ${simpleDto.no}번 게시글입니다.</h3>
	작성자 : ${simpleDto.writer }<br/>
	제목: ${simpleDto.title }<br/>
	내용: ${simpleDto.content}<br/>
	작성일: ${simpleDto.regDate}<br/>
	
	<form method="post">
		<input type="hidden" name="no"	value="${simpleDto.no}"/>
		<input type="hidden" name="title"	value="${simpleDto.title}"/>
		<input type="hidden" name="content"	value="${simpleDto.content}"/>
													<!-- location은 파라미터값을 가져가지않는다. 사용하려면 action값을 두개를 써야함 -->
		<input type="button" value="수정하러가기" onclick="fn_simpleUpdatePage(this.form)"/>
	</form>
	
	<script type="text/javascript">
		function fn_simpleUpdatePage(f) {
			f.action = "simpleUpdatePage.do";
			f.submit();
		}
	</script>
</body>
</html>