<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_insert() {
		var f = doucument.forms.f;
		if(f.title.value == ''){
			alert('제목은 필수입니다.');
			f.title.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	
	<h1>새 게시글 작성하기</h1>
	
	<form name="f" method="post" action="/11_DBCP/blue/insert.jsp" onsubmit="return fn_insert()">
		제목<br/>
		<input type="text" name="title" /> <br><br>
		작성자 <br/>
		<input type="text" name="writer" /> <br><br>
		내용 <br/>
		<textarea rows="5" cols="80" name="content"></textarea><br/><br/>
		<button>작성하기</button>
		<input type="reset" value="다시 작성하기"/>
		<input type="button" value="목록으로 이동하기" onclick="location.href='/11_DBCP/blue/listPage.jsp'"/>		
	</form>
	
</body>
</html>