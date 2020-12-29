<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0){
		alert('방명록이 수정되었습니다.');
		location.href='/MyHome/guestViewPage.guest?gNo=${param.gNo}';
	}else{
		alert('방명록이 수정되지 않았습니다.');
		history.back();
	}
</script>