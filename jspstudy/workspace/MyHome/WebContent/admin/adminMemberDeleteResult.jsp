<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0){
		alert('삭제되었습니다.');
		location.href='/MyHome/adminMemberListPage.admin?page=${param.page}';
	}else{
		alert('실패했습니다.');
		history.back();
	}
</script>