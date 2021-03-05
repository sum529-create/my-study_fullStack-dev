<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${loginDto}' != '') {
		location.href='index.do';
	} else {
		alert('이메일/패스워드를 다시 입력해주세요.');
		history.back();
	}
</script>
</head>
<body>

</body>
</html>