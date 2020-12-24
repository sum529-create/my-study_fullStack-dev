<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

<script>
	
	$(function(){
		$('#updatePwBtn').click(fn_updatePw);
	});
	
	function fn_updatePw() {
		if('${loginDto.mPw}' != $('#mPw0').val()){	// 현재 비밀번호
			alert('비밀번호를 확인하세요.');
			$('#mPw0').focus();
			return;
		}
		if('${loginDto.mPw}' == $('#mPw').val()){ 	// 	mPw -> 변경하려는 비밀번호
			alert('같은 비밀번호롤 변경할 수 없습니다.');
			return;
		}
		if($('#mPw').val() == ''){
			alert('비밀번호를 입력하세요.');
			$('#mPw').focus();
			return;
		} // mPw2는 따로 공백검사를 할 필요가 없다.
		else if($('#mPw').val() != $('#mPw2').val()){
			alert('비밀번호를 확인하세요.');
			return;
		}
		$.ajax({
			url: '/MyHome/MemberChangePw',
			type: 'post',
			// data: 'mPw=' + $('#mPw').val() + '&mNo=' + $('#mNo').val(),
			data: $('#f').serialize(),	// serialize()직렬화 하시오. 폼에 있는 요소들을 줄세워서 보낸다.
			dataType: 'text',
			success: function(responseText) {
				if (responseText.trim() == 'no') {
					$('#updatePwResult').text('비밀번호가 변경되지 않았습니다.').css('color', 'red');
				} else {
					$('#updatePwResult').text('비밀번호가 변경되었습니다.').css('color', 'green');
					$('mPw0').val('');
					$('mPw').val('');
					$('mPw2').val('');
				}
			},
			error: function(){ alert('실패'); }
		});
	}
	
	
</script>

<form id="f">

	아이디<br/>
	${loginDto.mId}<br/><br/>
	
	현재 비밀번호<br/>
	<input type="password" name="mPw0" id="mPw0"/><br/><br/>
	
	비밀번호 변경<br/>
	<input type="password" name="mPw" id="mPw" /><br/><br/>
	
	비밀번호 확인<br/>
	<input type="password" name="mPw2" id="mPw2"/>
	<input type="button" value="비밀번호 변경" id="updatePwBtn"/>
	<span id="updatePwResult"></span><br/><br/>
	
	성명<br/>
	<input type="text" name="mName" value="${loginDto.mName}" /><br/><br/>
	
	이메일<br/>
	<input type="text" name="mEmail" value="${loginDto.mEmail}" /><br/><br/>
	
	전화번호<br/>
	<input type="text" name="mPhone" value="${loginDto.mPhone}" /><br/><br/>
	
	주소<br/>
	<input type="text" name="mAddress" value="${loginDto.mAddress}" /><br/><br/>
	
	가입일<br/>
	${loginDto.mRegDate}<br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" value="${loginDto.mNo}" />
	<input type="hidden" name="mId" value="${loginDto.mId}" />
	<input type="hidden" name="mRegDate" value="${loginDto.mRegDate}" />
	
	<input type="button" value="정보 수정하기" id="updateBtn" />
	
</form>
<%@ include file="../template/footer.jsp" %>