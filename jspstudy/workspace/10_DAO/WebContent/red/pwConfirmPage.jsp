<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_updatePage(f){
		// 회원의 비밀번호
		var pw = '${param.pw}';	// DB에서 가져온 pw (전 페이지 viewPage hidden) el로 parameter값 가져오기
		// 입력한 비밀번호
		var pw2 = f.pw.value;	// 아래의 pw
		if(pw == pw2){
			alert('회원정보수정 페이지로 이동합니다.');
			f.action = '/10_DAO/red/updatePage.jsp';
			f.submit();
		}else{
			alert('비밀번호를 확인하세요.');
			f.pw.focus();
		}
	}
</script>
</head>
<body>
	<form method="post">
		<h1>회원정보 수정을 위해 비밀번호를 확인합니다.</h1>
		<table>
			<tbody>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw"/></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="회원정보수정하기" onclick="fn_updatePage(this.form)"/>
						<input type="button" value="되돌아가기" onclick="history.back()"/>
					</td>
				</tr>
			</tfoot>
		</table>
			<%-- 회원정보수정, 비밀번호변경 이동시 넘겨 줄 파라미터 --%>
			<input type="hidden" name="no" value="${param.no} }">
			<input type="hidden" name="id" value="${param.id} }">
			<input type="hidden" name="name" value="${param.name} }">
			<input type="hidden" name="age" value="${param.age} }">
			<input type="hidden" name="email" value="${param.email} }">
			<input type="hidden" name="regDate" value="${param.regDate} }">
	</form>
</body>
</html>