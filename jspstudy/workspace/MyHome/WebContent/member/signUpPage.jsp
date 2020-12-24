  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>

<script>
	
	$(function(){
		fn_idCheck();
		
	});
	
	function fn_idCheck() {
		$('#mId').keyup(function () {
			// 아이디: 5~20자 사이의 소문자나 숫자를 사용하고, 반드시 첫 글자는 소문자이다.
			var redId = /^[a-z][0-9a-z]{4,19}$/;
			$('#mId').keyup(function () {
				if(redId.test($('#mId').val())){	// 정규식 패턴을 만족한다.
						$.ajax({
							url: "/MyHome/IdCheck",
							type: 'post',
							data: 'mId=' + $('#mId').val(),
							dataType: 'json',
							success: function(responseObj) {
								if(responseObj.result){
									$('#idCheckResult').text('사용할 수 있는 아이디입니다.').css('color', 'blue');
								}else{
									$('#idCheckResult').text('이미 가입된 아이디입니다.').css('color', 'red');
								}
							},
							error:function() {alert('실패');}
						});
				}else{	// 정규식 패턴을 만족하지 않으면
					$('#idCheckResult').text('5 ~ 20자 사이의 소문자나 숫자 사용, 소문자로 시작').css('color', 'red');					
				}
			});
		});
	}
	
</script>

<form id="f" method="post">
	<label for="mId">아이디</label><br/>
	<input type="text" id="mId" name="mId"/><br/>
	<span id="idCheckResult"></span><br/>

	<label for="mPw">비밀번호</label><br/>
	<input type="password" id="mPw" name="mPw"/><br/>
	<span id="pwCheckResult"></span><br/>
	
	<label for="mPw2">비밀번호 확인</label><br/>
	<input type="password" id="mPw2" name="mPw2"/><br/>
	<span id="pwConfirmResult"></span><br/>

	<label for="mName">성명</label><br/>
	<input type="text" id="mName" name="mName"/><br/>
	
	<label for="mEmail">이메일</label><br/>
	<input type="text" id="mEmail" name="mEmail"/><br/>
	<span id="emailCheckResult"></span><br/>
	
	<label for="mPhone">전화번호</label><br/>
	<input type="text" id="mPhone" name="mPhone"/><br/>
	
	<label for="mAddress">주소</label><br/>
	<input type="text" id="mAddress" name="mAddress"/><br/><br/>
	
	<input type="button" value="가입하기" id="signUpBtn"/>
	<input type="button" value="입력취소" id="clearBtn"/>
	
</form>

<%@ include file="../template/footer.jsp" %>