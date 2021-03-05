<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	if('${result}' > 0) {
		alert('입력하신 비밀번호로 변경되었습니다.');
		location.href='loginPage.do';
	} else {
		alert('잘못된 이메일 또는 패스워드를 입력하셨습니다. 다시 입력해주세요.');
		history.back();
	}
</script>
</head>
<body>

</body>
</html>