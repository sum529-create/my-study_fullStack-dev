<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' >= 1){
		alert('댓글이 등록되었습니다.');
		location.href = '/MyHome/boardListPage.board?page=${param.page}';
	}else{
		alert('댓글이 등록되지 않았습니다.');
		history.back();
	}
</script>