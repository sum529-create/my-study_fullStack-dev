<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Classick | 비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">

	var chkList1 = false; // 이메일 
	var chkList2 = false; // 현재 비밀번호
	var chkList3 = false; // 새로 변경할 비밀번호
	var chkList4 = false; // 비밀번호 확인
	
	<%-- 이메일 정규식 --%>
	var EmailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	<%-- 비밀번호 정규식 --%>
	var PwCheck =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

	function fn_EmailCheck() {
		var mEmail = $('input[name="mEmail"]').val();
		if(mEmail == '') {
			$('#result1').show();
			$('#result1').text('필수 사항입니다.').css('color','red');
			chkList1 = false;
		} else if (EmailCheck.test(mEmail)){
			$('#result1').css('display','none');
			chkList1 = true;
		} else {
			$('#result1').show();
			$('#result1').text('유효하지 않은 E-Mail주소입니다.').css('color','red');
			chkList1 = false;
		}
	}
	<%-- 현재 비밀번호 체크 --%>
	function fn_PwCheck() {
		var mPw = $('input[name=mPw]').val();
		if(mPw == '') {
			$('#result2').show();
			$('#result2').text('필수 사항입니다.').css('color','red');
			chkList2 = false;
		} else {
			$('#result2').css('display','none');
			chkList2 = true;
		}
	}
	<%-- 새로 변경할 비밀번호 체크 --%>
	function fn_PwCheck1() {
		var ChPw = $('input[name=ChPw]').val();
		if(ChPw == '') {
			$('#result3').show();
			$('#result3').text('필수 사항입니다.').css('color','red');
			chkList3 = false;
		} else if (PwCheck.test(ChPw)){
			$('#result3').css('display','none');
			chkList3 = true;
		} else {
			$('#result3').show();
			$('#result3').text('영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.').css('color','red');
			chkList3 = false;
		}
	}
	<%-- 비밀번호 확인 --%>
	function fn_PwCheck2() {
		var ChPw1 = $('input[name=ChPw1]').val();
		if(ChPw1 == '') {
			$('#result4').show();
			$('#result4').text('필수 사항입니다.').css('color','red');
			chkList4 = false;
		} else if ($('input[name=ChPw]').val() == ChPw1) {
			$('#result4').css('display','none');
			chkList4 = true;
		} else {
			$('#result4').show();
			$('#result4').text('비밀번호가 일치하지 않습니다.').css('color','red');
			chkList4 = false;
		}
	}
	
	function fn_PwChange(f) {
		if($('input[name=mEmail]').val() == '' && $('input[name=mEmail]').val() == '' && $('input[name=mEmail]').val() == '' && $('input[name=mEmail]').val() == '') {
			$('#result1').text('필수 사항입니다.').css('color','red');
			$('#result2').text('필수 사항입니다.').css('color','red');
			$('#result3').text('필수 사항입니다.').css('color','red');
			$('#result4').text('필수 사항입니다.').css('color','red');
		}
		
		if(chkList1 == true && chkList2 == true && chkList3 == true && chkList4 == true) {
			if(confirm('변경하시겠습니까?')) {
				f.action = 'memberPwChange.do';
				f.submit();
			}
		}
		
	}
</script>
<style type="text/css">
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
		width : 39%;
		border-bottom : 0px;
		border-left : 0px;
		border-right : 0px;
	}
	input {
		margin-top : 10px;
		width : 490px;
		height: 50px;
		font-size: 15px;
		border-radius: 5px;
	}
	b {
		float: left;
	}
	form > div {
		padding-top : 20px;
		padding-bottom : 20px;
	}
	input[type=button] {
		margin-top : 40px;
		width : 48%;
		background: #ff7b30;
		border-color: #ff7b30;
		color : white;
		font-weight: bold;
		font-size : 20px;
		border-radius: 5px;
	}
	input[type="button"]:hover {
		background: #ff6730;
		cursor:pointer;
	}
	input[value="변경하기"] {
		float : left;
	}
	input[value="취 소"] {
		float : right;
	}
	span {
		float: left;
	}
</style>
</head>
<body>
	<div id="container">
		<div><a href="index"><img id="logo1" alt="로고" src="assets/images/classickLogo.png"></a></div>
		<div id="choice">
			<hr>비밀번호 변경<hr>
		</div>
		<form method="post">
			<div>
				<b>이메일</b>
				<input type="text" name="mEmail" placeholder="이메일을 입력해주세요." onkeyup="fn_EmailCheck()">
				<span id="result1"></span>
			</div>
			<div>
				<b>현재 비밀번호</b>
				<input type="password" name="mPw" placeholder="현재 비밀번호를 입력해주세요." onkeyup="fn_PwCheck()">
				<span id="result2"></span>
			</div>
			<div>
				<b>새 비밀번호</b>
				<input type="password" name="ChPw" placeholder="새로 변경할 비밀번호를 입력해주세요." onkeyup="fn_PwCheck1()">
				<span id="result3"></span>
			</div>
			<div>
				<b>새 비밀번호 확인</b>
				<input type="password" name="ChPw1" placeholder="변경할 비밀번호와 동일하게 입력해주세요." onkeyup="fn_PwCheck2()">
				<span id="result4"></span>
			</div>
			<div>
				<input type="button" value="변경하기" onclick="fn_PwChange(this.form)">
				<input type="button" value="취 소" onclick="location.href='loginPage.do'">
			</div>
		</form>
	</div>
</body>
</html>