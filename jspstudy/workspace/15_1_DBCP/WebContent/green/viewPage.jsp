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
			f.action = "/15_DBCP/delete.do";
			f.submit();
		}else{
			alert('취소되었습니다.');
			history.back();
		}
	}
	function fn_updatePage(f) {
		f.action = '/15_DBCP/updatePage.do';
		f.submit();
	}
</script>
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
		
		<input type="hidden" name="no" value="${greenDto.no }"/>
		<input type="hidden" name="writer" value="${greenDto.writer }"/>
		<input type="hidden" name="title" value="${greenDto.title }"/>
		<input type="hidden" name="content" value="${greenDto.content }"/>
		<input type="hidden" name="hit" value="${greenDto.hit }"/>
		<input type="hidden" name="postDate" value="${greenDto.postDate }"/>
		
		<input type="button" value="수정하기" onclick="fn_updatePage(this.form)"/>
		<input type="button" value="삭제하기" onclick="fn_delete(this.form)"/>
		<input type="button" value="목록으로이동" onclick="location.href='/15_DBCP/listPage.do'"/>
		
	</form>
</body>
</html>