<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/14_MVC/person.do" method="post" >
		이름<br/>
		<input type="text" name="name"/><br/><br/>
		
		나이<br/>
		<input type="text" name="age"/><br/><br/>
		
		주소<br/>
		<input type="text" name="address"/><br/><br/>
		
		성별<br/>
		<label><input type="radio" name="gender" value="남"/>남</label>
		<label><input type="radio" name="gender" value="여"/>여</label><br/><br/>
		
		관심사<br/>
		<label><input type="checkbox" name="interest" value="주식"/>주식</label>
		<label><input type="checkbox" name="interest" value="육아"/>육아</label>
		<label><input type="checkbox" name="interest" value="취업"/>취업</label>><br/><br/>
		
		<button>전송</button>
	</form>
</body>
</html>