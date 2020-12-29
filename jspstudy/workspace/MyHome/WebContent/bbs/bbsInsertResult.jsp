<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0){
		alert('게시물이 등록되었습니다.');
		location.href='/MyHome/bbsListPage.bbs';
	}else{
		alert('게시물이 등록되지 않았습니다.');
		history.back();
	}
</script>