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
	<form action="/Test/JSONHandler" method="get">
		<label for="name">성명</label>
		<input type="text" size="5" id="name" name="name"/><br/>
		<label for="age">나이</label>
		<input type="text" size="5" id="age" name="age"/><br/>
		결혼여부<input type="radio" id="yes" name="isMarried" value="true"/><label for="yes">기혼</label>
		<input type="radio" id="no" name="isMarried" value="false"/><label for="no">미혼</label><br/><br/>
		<!--  <input type="button" value="전송" onclick="location.href='/Test/JSONHandler'"/>-->
		<button>전송</button>
		</form>
	</fieldset>
</body>
</html>