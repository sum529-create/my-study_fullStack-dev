<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인</h3>
	
	<form action="/18_CAPTCHA/login.do">
		<input type="text" name="id" placeholder="아이디"/><br/>
		<input type="password" name="pw" placeholder="비밀번호"/><br/><br/>
		아래 이미지를 보이는 대로 입력하세요.<br/>
		<img alt="캡차이미지" src="${directory}/${filename}" style="width:200px;"/>
		<input type="button" value="새로고침" onclick="location.href='/18_CAPTCHA/getImageCaptcha.do'"/><br/>
		<input type="text" name="input_key" placeholder="자동입력 방지문자"/><br/><br/>
		<button>로그인</button>
	</form>
	
</body>
</html>