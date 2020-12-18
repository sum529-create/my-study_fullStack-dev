<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_update(f) {
		if(f.title.value == ''){
			alert('제목은 필수입니다.');
			f.title.focus();
			return;
		}
		if('${param.title}' == f.title.value && '${param.content}' == f.content.value){
			alert('수정할 내용이 없습니다.');
			 return;
		}
		f.action = '/16_MYBATIS/update.lime';
		f.submit();
		
	}
</script>
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
		<textarea rows="5" cols="50" name="content">${param.content}</textarea><br/><br/>
		
		작성일<br/>
		${param.postDate}<br/>
		
		<input type="hidden" name="no" value="${param.no}"/>
		
		<input type="button" value="수정하기" onclick = "fn_update(this.form)"/>
		<input type="reset" value="다시작성하기"/>
		<input type="button" value="취소하기" onclick = "alert('취소합니다.'); history.back();"/>
		<input type="button" value="목록으로이동" onclick = "location.href='/16_MYBATIS/listPage.lime'"/>
	</form>
	
</body>
</html>