<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0){
		alert('방명록이 삭제되었습니다.');
		location.href = '/MyHome/guestListPage.guest';
		
	}else{
		alert('방명록이 삭제되지 않았습니다.');
		history.go(-2);	// guestDelete.jsp -> guestViewPage.jsp
	}
</script>