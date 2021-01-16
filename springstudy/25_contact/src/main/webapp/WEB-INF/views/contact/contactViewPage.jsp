<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_contactUpdate(f) {
		f.action = "contactUpdate.do";
		f.submit();
	}
	function fn_contactDelete(f) {
		if(confirm('삭제하시겠습니까?')){
			f.action="contactDelete.do";
			f.submit();
		}
	}
</script>
</head>
<body>
	<h3>입력란</h3>

	<form method="post">
		이름<br/>
		<input type="text" name="name" value="${contactDto.name}"/><br/><br/>
		핸드폰번호<br/>
		<input type="text" name="phone" value="${contactDto.phone}"/><br/><br/>
		주소<br/>
		<input type="text" name="address" value="${contactDto.address}"/><br/><br/>
		이메일<br/>
		<input type="text" name="email" value="${contactDto.email}"/><br/><br/>
		내용<br/>
		<input type="text" name="note" value="${contactDto.note}"/><br/><br/>
		<input type="button" value="수정하기" onclick="fn_contactUpdate(this.form)"/>
		<input type="button" value="삭제하기" onclick="fn_contactDelete(this.form)"/>
	</form>
</body>
</html>