<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	b{
		color:red;
	}
</style>
<script type="text/javascript">
	function fn_update(f) {
		var checkPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9~!@#$%^&*-_?]{8,16}$/;
		var pw = '${param.pw}';
		var cpw = f.cpw.value;
		var npw = f.npw.value;
		var ckpw = f.ckpw.value;
		// 이전에 넘어온 정보 중 변경된 정보가 있는 경우만 수정
		if(cpw == ''){
			alert('현재 비밀번호를 적어주세요,');
			f.cpw.focus();
		}
		else if(npw == ''){
			alert('새 비밀번호를 적어주세요,');
			f.npw.focus();
		}
		else if(ckpw == ''){
			alert('새 비밀번호 확인란을 적어주세요,');
			f.ckpw.focus();
		}
		
		if(cpw != null && npw != null && ckpw != null){
			if(cpw == pw && cpw != npw && npw == ckpw){
				if(checkPW.test(npw)){
					f.action = "/10_DAO/red/change.jsp";
					f.submit();
				}else{
					alert('사용 불가능한 비밀번호 입니다.');
					f.npw.focus();
					
				}
			}
			if(cpw != pw){
				alert('현재 사용중인 비밀번호가 다릅니다.');
				f.cpw.focus();
			}
		}
	}
</script>
</head>
<body>
	<h3>비밀번호 변경</h3>
	<form method="post">
		<ul>
			<li><b>다른 아이디/사이트에서 사용한 적 없는 비밀번호</b></li>
			<li><b>이전에 사용한 적 없는 비밀번호</b>가 안전합니다.</li>
			<li>비밀번호는 <b>8~16자의 대문자, 소문자, 특수문자(?=.*)</b>가 포함되어야 합니다.</li>
		</ul>
		<input type="password" name="cpw" placeholder="현재 비밀번호" /><br>
		<input type="password" name="npw" placeholder="새 비밀번호"/><br>
		<input type="password" name="ckpw" placeholder="새 비밀번호 확인"/><br><br>
		<input type="button" value="비밀번호수정하기" onclick="fn_update(this.form)"/>
		<input type="button" value="수정취소하기" onclick="history.back()"/>
		<input type="button" value="목록으로이동하기" onclick="location.href='/10_DAO/red/listPage.jsp'"/>
		<input type="hidden" name="no" value="${param.no}">
	</form>
</body>
</html>