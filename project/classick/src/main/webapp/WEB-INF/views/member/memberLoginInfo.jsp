<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Classick | 이메일 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		<%-- 전화번호 정규식 체크 --%>
		$('input[name=mPhone]').on("keyup", function() {
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		<%-- 전화번호 입력 시 btn1 버튼 활성화 --%>
		$('input[name=mPhone]').on("keyup", function() {
			if($(this).val() == '') {
			   $('#btn1').attr('disabled',true);
			} else {
				$('#btn1').attr('disabled',false);
				$('#btn1').css('background','#ff7b30').css('border-color','#ff7b30');
				$('#btn1').css('color','white');
			}
		});
		<%-- mCode1 코드번호 입력 시 btn2 버튼 활성화 --%>
		$('input[name=mCode1]').on("keyup", function() {
			$('#btn2').css('background','#ff7b30').css('border-color','#ff7b30').css('color','white');
			$('#btn2').attr('disabled',false);
		});
		<%-- 이메일 입력 시 btn3 버튼 활성화 --%>
		var EmailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 정규식
		$('input[name=mEmail]').on("keyup", function() {
			if($(this).val() == '') {
				$('#btn3').attr('disabled',true);
			} else if (EmailCheck.test($(this).val()) ){
				$('#btn3').attr('disabled',false);
				$('#btn3').css('background','#ff7b30').css('border-color','#ff7b30').css('color','white');
			} else {
				$('#btn3').attr('disabled',true);
			}
		});
		<%-- mCode1 코드번호 입력 시 btn4 버튼 활성화 --%>
		$('input[name=mCode2]').on("keyup", function() {
			$('#btn4').css('background','#ff7b30').css('border-color','#ff7b30').css('color','white');
			$('#btn4').attr('disabled',false);
		});
		
		<%-- 이메일 찾기  --%>
		$('#btn1').click(function(){
			alert('입력하신 번호로 인증코드가 전송되었습니다.');
			$.ajax({
				url : 'userPhoneCheck.do',
				type: 'post',
				data: $('input[name="mPhone"]'),
			dataType: 'json',
			success : function(responseObj) {
				$('#btn2').click(function(){
					if(responseObj.authkey == $('input[name="mCode1"]').val()) {
					var email = responseObj.usermail; // 에이작스로 받은 이메일 주소
					alert('인증되었습니다.');
					alert('회원님의 이메일은 ' + '['+ email +']' +' 입니다.');
					if(confirm('로그인 하시겠습니까?')) {
						location.href='loginPage.do';
					}
					
					} else {
						alert('인증코드가 일치하지 않습니다. 다시 시도해주세요.');
						$('input[name="mCode1"]').focus();
					}
				});
			}, 
			error : function() {
				alert('데이터 없음');
			}
			});
		});
		
		<%-- 비밀번호 찾기 --%>
		$('#btn3').click(function(){
			alert('입력하신 메일주소로 인증코드가 전송되었습니다.');
			$.ajax({
				url : 'userPwCheck.do',
				type: 'post',
				data: $('input[name="mEmail"]'),
				dataType: 'json',
				success : function(responseObj) {
					$('#btn4').click(function(){
						if(responseObj.authkey == $('input[name="mCode2"]').val()) {
							alert('인증되었습니다.');
							alert('회원님의 비밀번호는 ' + '['+ responseObj.userpw +']' +' 입니다.');
							if(confirm('로그인 하시겠습니까?')) {
								location.href='loginPage.do';
							}
							
							} else {
								alert('인증코드가 일치하지 않습니다. 다시 시도해주세요.');
								$('input[name="mCode2"]').focus();
							}
					});
				}, 
				error : function() {
					alert('일치하는 내용이 존재하지 않습니다.');
				}
			});			
		});
		
	});
</script>
<style>
	#container {
		width  : 500px;
		margin : auto;
		text-align: center;
	}
	#logo1 {
		margin-top : 100px; 
		margin-bottom : 50px;
		width : 200px;
		heigth: 100px;
	}
	#choice {
		display : flex;
		padding-bottom: 80px;
	}
	hr {
		width : 33%;
		border-bottom : 0px;
		border-left : 0px;
		border-right : 0px;
	}
	b {
		font-size: 20px;
	}
	.btn {
		padding-top : 40px;
		padding-bottom: 200px;
		
	}
	
	input {
		width : 70%;
		height: 50px;
		float : left;
		margin-bottom : 10px;
		font-size: 15px;
		border-radius: 5px;
	}
	input[type="button"] {
		float : right;
		height: 55px;
		width : 25%;
		font-weight: bold;
		font-size : 15px;
		cursor:pointer;
		border-radius: 5px;
	}
  	input[value="로그인하러 가기"] {
		width : 48%;
		background: #ff7b30;
		border-color: #ff7b30;
		color : white;
		font-size: 20px;
		float : left;
	}
	input[value="비밀번호 변경하러 가기"] {
		width : 48%;
		background: #ff7b30;
		border-color: #ff7b30;
		color : white;
		font-size: 20px;
		float : right;
	}
	input[value="로그인하러 가기"]:hover, input[value="비밀번호 변경하러 가기"]:hover {
		background: #ff6730;
	}
	box {
		display : flex;
	}
</style>
</head>
<body>

	<div id="container">
		<div><a href="index"><img id="logo1" alt="로고" src="assets/images/classickLogo.png"></a></div>
		<div id="choice">
			<hr>이메일 / 비밀번호 찾기<hr>
		</div>
		<b>이메일 찾기</b>
		<div class="btn">
			<input type="text" name="mPhone" placeholder="핸드폰번호를 입력해주세요."/><input type="button" value="인증요청" id="btn1" disabled>
			<input type="text" name="mCode1" placeholder="인증코드를 입력해주세요."/><input type="button" value="인 증" id="btn2" disabled>
		</div>
		<b>비밀번호 찾기</b>
		<div class="btn">
			<input type="text" name="mEmail" placeholder="이메일을 입력해주세요."/><input type="button" value="인증요청" id="btn3" disabled>
			<input type="text" name="mCode2" placeholder="인증코드를 입력해주세요."/><input type="button" value="인 증" id="btn4" disabled>
		</div>
		
		<div id="box">
			<input type="button" value="비밀번호 변경하러 가기" onclick="location.href='PwChange.do'"/>
			<input type="button" value="로그인하러 가기" onclick="location.href='loginPage.do'"/>
		</div>
	</div>
</body>
</html>