<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="아이디찾기" name="title"/>
</jsp:include>    

<script>
	<%--function fn_findId(f) {
		if(f.mEmail.value == ''){	// 정규식 검사로 대체할 수 있음.
			alert('이메일을 입력하세요.');
			f.mEmail.focus();
			return;
		}			
			f.action = '/MyHome/findId.member';
			f.submit();
	}--%>
	$(document).ready(function () {
		$('#findIdBtn').click(fn_findId);
	});
	function fn_findId() {
		$.ajax({
			url : '/MyHome//MemberFindId',		// 매핑(/MemberFindId)을 가진 별도 Servlet으로 간다.
			type: 'post',
			data: 'mEmail=' + $('#mEmail').val(), // url로 보내는 파라미터
			dataType: 'text',	// 받아오는 데이터의 타입
			success: function (responseText) {	// responseText: 받아오는 데이터
				if(responseText.trim() == 'no'){
					$('#findIdResult').text('해당하는 회원정보가 없습니다.');
					$('#findIdResult').css('color', 'red');
				}else{
					$('#findIdResult').text('회원님의 아이디는 "' + responseText + '"입니다');
					$('#findIdResult').css('color', 'green');
				}
		
			},
			error: function () {
				alert('실패');
			}
		});
	}
</script>

<form>
	가입 당시 이메일을 입력하세요.<br/><br/>
	<input type="text" name="mEmail" id = "mEmail"/>
	<input type="button" value="아이디 찾기" id="findIdBtn"/> <!-- onclick="fn_findId(this.form)" -->
	<input type="button" value="로그인 하러 가기" onclick="location.href='/MyHome/loginPage.member'"/>
</form>	

<%-- 아이디 찾기 결과가 나타날 위치 --%>
<div id="findIdResult"></div>

<%@ include file="../template/footer.jsp" %>