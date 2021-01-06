<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/style/red.css">
<script type="text/javascript">
	function fn_signUp(f) {
		if (f.id.value == '' || 
			f.pw.value == '' || 
			f.pw2.value == '' || 
			f.email.value == '') {
			alert('필수 데이터를 입력하세요');
			return;
		}
		if (f.pw.value != f.pw2.value) {
			alert('비밀번호를 확인하세요.');
			return;
		}
		var chk = '${param.chk}';
		if(!chk){
			alert('아이디 중복 체크를 진행하세요.');
		}
		f.action = '/10_DAO/red/insert.jsp';
		f.submit();
	}
	function fn_idCheck(f) {
		if(f.id.value == ''){
			alert('아이디를 먼저 입력하세요.');
			f.id.focus();
			return;
		}
		f.action = "/10_DAO/red/idCheck.jsp";
		f.submit();
	}
</script>
</head>
<body>

	<div class="wrap">
		
		<h1>RED 테이블 데이터 삽입</h1>
		<br/><br/>
		
		<form method="post">
			*은 필수정보입니다.<br/>
			<table>
				<tbody>
					<tr>
						<td>아이디*</td>
						<td>
							<c:if test="${param.id eq null }">
								<input type="text" name="id" autofocus />
							</c:if>
							<c:if test="${param.id ne null }">
								<input type="text" name="id" value="${param.id }" autofocus />
							</c:if>
							<input type="button" value="중복확인" onclick="fn_idCheck(this.form)">
						</td>
						
					</tr>
					<tr>
						<td>비밀번호*</td>
						<td><input type="password" name="pw" /></td>
					</tr>
					<tr>
						<td>비밀번호확인*</td>
						<td><input type="password" name="pw2" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" /></td>
					</tr>
					<tr>
						<td>이메일*</td>
						<td><input type="text" name="email" /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="가입하기" onclick="fn_signUp(this.form)" />
							<input type="reset" value="다시작성" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		
	</div>

</body>
</html>