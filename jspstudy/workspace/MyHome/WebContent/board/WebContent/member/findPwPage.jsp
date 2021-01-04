<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호찾기" name="title" />
</jsp:include>

<script>
	
	// 페이지 로드 이벤트 처리
	$(function(){
		$('#findPwBtn').click(fn_findPw);
	});
	
	function fn_findPw() {
		$.ajax({
			url: '/MyHome/MemberFindPw',
			type: 'post',
			data: 'mEmail=' + $('#mEmail').val(),
			dataType: 'text',
			success: function(responseText) {
				if (responseText.trim() == 'no') {
					alert('해당하는 회원 정보가 없습니다.');
				} else {
					alert('회원 정보가 확인되었습니다. 새로운 비밀번호를 설정하세요.');
					location.href = '/MyHome/changePwPage.member?mNo=' + responseText.trim();
				}
			},
			error: function(){ alert('실패'); }
		});
	}
	
</script>

	<h3>이메일 인증</h3>
	<%-- 스프링에서 구글 메일로 이메일을 보내 주는 라이브러리를 사용합니다. --%>
	<form>
		가입 당시 이메일을 입력하세요.<br/><br/>
		<input type="text" name="mEmail" id="mEmail" />
		<input type="button" value="비밀번호 찾기" id="findPwBtn" />
		<input type="button" value="로그인 하러 가기" onclick="location.href='/MyHome/loginPage.member'" />
	</form>
	
	<h3>전화번호 인증</h3>
	<%-- 문자(SMS)를 보내 주는 라이브러리 사용은 돈이 듭니다. --%>
	
<br/><br/>

<%-- 아이디 찾기 결과가 나타날 위치 --%>
<div id="findIdResult"></div>

<%@ include file="../template/footer.jsp" %>