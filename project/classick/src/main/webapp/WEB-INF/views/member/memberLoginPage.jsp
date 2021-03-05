<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">

var chkList1 = false; // 이메일 여부 확인 변수
var chkList2 = false; // 비밀번호 여부 확인 변수

<%-- 이메일 정규식 --%>
var EmailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
<%-- 비밀번호 정규식 --%>
var PwCheck =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

$(document).ready(function(){
	$('#listUp').click(function(){
		$('#container2').show();
	});
});

<%-- 이메일 유효성 검사 --%>
function fn_emailCheck(f) {
	var mEmail = $('input[name=mEmail]').val();
	if(EmailCheck.test(mEmail)) {
		$('#r1').css('display','none');
		chkList1 = true;			
	}
	if(!EmailCheck.test(mEmail)) {
		$('#r1').show();
		$('#r1').text('유효하지 않은 eMail주소입니다.').css('color','red');
		chkList1 = false;
	}
	if(mEmail == '') {
		$('#r1').text('필수 항목입니다.').css('color','red');
		chkList1 = false;
	}
}

<%-- 비밀번호 유효성 검사 --%>
function fn_pwCheck(f) {
	var mPw = $('input[name=mPw]').val();
	if(mPw == '') {
		$('#r2').show();
		$('#r2').text('필수 항목입니다.').css('color','red');
		chkList2 = false;
	} else if(PwCheck.test(mPw)) {
		$('#r2').css('display','none');
		chkList2 = true;
	} else {
		$('#r2').show();
		$('#r2').text('영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.').css('color','red');
		chkList2 = false;
	}
	
}
function fn_login(f) {
	
	var mEmail = $('input[name=mEmail]').val();
	var mPw = $('input[name=mPw]').val();
	if(mEmail == '' && mPw == '') {
		$('#r1').text('필수 항목입니다.').css('color','red');
		$('#r2').text('필수 항목입니다.').css('color','red');
	}
	if(mEmail == '') {
		$('#r1').text('필수 항목입니다.').css('color','red');
		chkList1 = false;
	}
	if(mPw == '') {
		$('#r2').text('필수 항목입니다.').css('color','red');
		chkList2 = false;
	}
	
	if(chkList1 == true && chkList2 == true) {
		f.action = "memberlogin.do";
		f.submit();
	}
}
function enterPress(e, f){ 
	if(e.keyCode == 13){ 
		fn_login(f);
	} 
}

</script>
<title>Classick | 로그인</title>
<style type="text/css">
	#container {
		width  : 500px;
		margin : auto;
	}
	div {
		margin : auto;
		margin-top : 10px; 
		text-align : center;
	}
	#logo1 {
		margin-top : 30px; 
		width : 200px;
		heigth: 100px;
	}
	#logo2 {
		width : 80%;
		heigth: 20px;
	}
	.choice {
		font-size: 20px;
		font-weight: bold;
		display: flex;
		margin-top : 20px;
		margin-bottom : 30px;
	}
	#SignUpList {
		padding-top: 5px;
		padding-bottom: 30px;
	}
	#container > input {
		margin-bottom : 30px;
	}
	.btn {
		border-radius: 5px;
		width : 100%;
		margin-top : 10px;
		height : 50px;
		background: white;
		font-size: 18px;
		font-weight: bold;
		border : 0.5px solid silver;
		cursor:pointer;
	}
	hr {
		width : 35%;
		border-bottom : 0px;
		border-left : 0px;
		border-right : 0px;
	}
	#container2 {
		display : none;
	}
	input[type=checkbox],label,span {
		float: left;
	}
	form > input[type=button] {
		border-color : #ff7b30;
		background: #ff7b30;
		color: white;
	}
	form > input[type=button]:hover {
		background : #ff6730;
	}
	#SignUpList > input[type=button]:first-child {
		border-color: #F7E600;
		background: #F7E600;
	}
	input[value="회원가입"] {
		border-color: #ff7b30;
		color :  #ff7b30;
	}
	input[type=checkbox] {
		zoom: 1.5;
	}
	#info > a {
		float:right;
	}
</style>
</head>
<body>
<div id="container">
	
		<div><a href="index"><img id="logo1" alt="로고" src="assets/images/classickLogo.png"></a></div>
		<div><img id="logo2" alt="회원가입쿠폰" src="assets/images/coupon.png"></div><br/>
		<input type="button" value="회원가입" class="btn" onclick="location.href='memberSignListUp.do'"/>
		
		<div class="choice">
			<hr>로그인<hr>
		</div>
		
		<div id="SignUpList">
			<input type="button" value="카카오톡으로 로그인하기" class="btn"/>
			<input type="button" value="이메일로 로그인 하기" class="btn" id="listUp" />
		</div>
	
	<div id="container2">
		<div class="choice">
			<hr>이메일<hr>
		</div>
		
		<div id="innercontainer">
			<form method="post">
				<input type="text" name="mEmail" class="btn" id="L1" placeholder="E-mail" style="padding-left: 10px;" onkeyup="fn_emailCheck(this.form)"/><br/>
				<span id="r1"></span>
				<input type="password" name="mPw" class="btn" id="L2" placeholder="Password" style="padding-left: 10px;" onkeyup="fn_pwCheck(this.form)" onkeypress="enterPress(event,this.form)"/><br/>
				<span id="r2"></span><br/><br/>
				<div id="info" style="height: 25px; line-height: 25px;">
					<input type="checkbox" id="chkbox" style="margin: 0 5px 0 0; height: 15px;"/><label for="chkbox">이메일 저장하기</label>
					<a href="memberLoginInfo.do" style="text-decoration: none;">이메일/비밀번호를 잃어버리셨나요?</a>
				</div>
				<input type="button" class="btn" value="로그인" onclick="fn_login(this.form)"/>
			</form>
		</div>
	</div>
		
</div>
</body>
</html>