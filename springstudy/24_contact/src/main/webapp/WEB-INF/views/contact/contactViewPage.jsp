<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_contactUpdate(f) {
		f.action = 'contactUpdate.do';
		f.submit();
	}
	function fn_contactDelete(f) {
		f.action = 'contactDelete.do';
		f.submit();
	}
</script>
</head>
<body>

	<h3>연락처 보기</h3>
	
	<form method="post">	<!-- 저장하고 보여주고의 기능이 있어 action을 하나만사용할 수 없기에 삭제 -->
		이름<br/>
		<input type="text" name="name" value="${contactDto.name}" readonly/><br/><br/>
		전화<br/>
		<input type="text" name="phone" value="${contactDto.phone}"/><br/><br/>
		주소<br/>
		<input type="text" name="address" value="${contactDto.address }"/><br/><br/>
		이메일<br/>
		<input type="text" name="email" value="${contactDto.email }"/><br/><br/>
		비고<br/>
		<input type="text" name="note" value="${contactDto.note}"/><br/><br/>
		
		<%-- hidden  --%>
		<input type="hidden" name="no" value="${contactDto.no}"/>
		
		<input type="button" value="수정하기" onclick="fn_contactUpdate(this.form)"/> 
		<input type="button" value="삭제하기" onclick="fn_contactDelete(this.form)"/> 
		<input type="button" value="전체연락처" onclick="location.href='contactListPage.do'"/> 
	</form>
	
</body>
</html>