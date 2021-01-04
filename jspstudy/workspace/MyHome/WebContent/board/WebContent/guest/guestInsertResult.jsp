<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0){
		alert('방명록이 작성되었습니다.')
	}else{
		alert('방명록이 작성되지 않았습니다.');
	}
		location.href = '/MyHome/guestListPage.guest';
</script>