<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	/* 로그인의 성공 실패 여부는 session의 loginDto 존재를 확인하면 된다. */
	if(${loginDto} != null){
		alert(${mId} + '님 환영합니다.');
		href.location = '/MyHome/index.member';
	}else{
		alert('제출된 정보와 일치하는 회원이 없습니다.');
		href.location = '/MyHome/loginPage.member';
		// history.back() -> 이동방식이 맞지않는다.
	}
	
</script>