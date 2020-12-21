<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if(${result}){	// result -> boolean값
		alert('성공입니다.');
		// 이동하는 코드가 필요하다.
		location.href= '/18_CAPTCHA/index.do';
	}else{
		alert('실패입니다.');
		// 이동하는 코드가 필요하다.
		// history.back(); 새로 이미지를 받아서 
		// 다시 시도할 수 있도록 새로 캡차 이미지를 받아야 한다.
		location.href= '/18_CAPTCHA/getImageCaptcha.do';
	}
</script>