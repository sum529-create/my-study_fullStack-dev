<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if ('${foundId}' == 'no') {
		alert('해당하는 회원 정보가 없습니다.');
		location.href = '/MyHome/findIdPage.member';
	} else {
		alert('회원님의 아이디는 "' + '${foundId}' + '"입니다.');
		location.href = '/MyHome/loginPage.member';
	}
</script>