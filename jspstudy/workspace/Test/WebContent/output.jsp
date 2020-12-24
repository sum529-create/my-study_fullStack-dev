<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset style="width:200px;">
		<ul>
			<li>성명 : ${result.name}</li>
			<li>나이 : ${result.age}</li>
			<li>결혼여부 : ${result.isMarried}</li>
		</ul>
	</fieldset>
</body>
</html>