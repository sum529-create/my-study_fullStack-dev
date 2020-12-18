<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_delete(f) {
		if(confirm('게시글을 삭제할까요?')){
			f.action = "/16_MYBATIS/delete.lime";
			f.submit();
		}else{
			alert('취소되었습니다.');
			history.back();
		}
	}
	function fn_updatePage(f) {
		f.action = '/16_MYBATIS/updatePage.lime';
		f.submit();
	}
</script>
</head>
<body>
	
	<h3>${limeDto.no}번 게시글입니다.</h3>
	<form>
		작성자<br/>
		<pre>${limeDto.writer }</pre><br/><br/>
		제목<br/>
		<pre>${limeDto.title }</pre><br/><br/>
		내용<br/>
		<pre>${limeDto.content }</pre><br/><br/>
		작성일<br/>
		<pre>${limeDto.postDate }</pre><br/><br/>
		
		<input type="hidden" name="no" value="${limeDto.no }"/>
		<input type="hidden" name="writer" value="${limeDto.writer }"/>
		<input type="hidden" name="title" value="${limeDto.title }"/>
		<input type="hidden" name="content" value="${limeDto.content }"/>
		<input type="hidden" name="postDate" value="${limeDto.postDate }"/>
		
		<input type="button" value="수정하기" onclick="fn_updatePage(this.form)"/>
		<input type="button" value="삭제하기" onclick="fn_delete(this.form)"/>
		<input type="button" value="목록으로이동" onclick="location.href='/16_MYBATIS/listPage.lime'"/>
		
	</form>
</body>
</html>