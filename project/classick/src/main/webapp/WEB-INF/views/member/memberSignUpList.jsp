<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">

	$('document').ready(function(){
			$('#listUp').click(function(){
			$(this).val('이메일로 가입하기');
				$(this).css('border-color',' #ff7b30');
				$(this).css('color',' #ff7b30');
			$(this).click(function(){
				location.href = 'memberEmailSignup.do';
			});
		});
	});
</script>
<title>회원가입</title>
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
	#logo3 {
		margin-top : 30px; 
	}
	#choice {
		font-size: 20px;
		font-weight: bold;
	}
	#SignUpList {
		padding-top: 30px;
		padding-bottom: 30px;
	}
	.btn {
		width : 100%;
		border-radius: 5px;
		margin-top : 10px;
		height : 50px;
		background: white;
		font-size: 18px;
		font-weight : bold;
		border : 0.5px solid silver;
		cursor:pointer;
	}
	a:link {
		color : #828282;
	}
	input[type=button]:first-child {
		border-color: #F7E600;
		background: #F7E600;
	}
	
</style>
</head>
<body>

	<div id="container">
		<div><a href="index"><img id="logo1" alt="로고" src="assets/images/classickLogo.png"></a></div>
		<div><img id="logo2" alt="회원가입쿠폰" src="assets/images/coupon.png"></div><br/>
		<hr>
		
		<div><img id="logo3" alt="List1" src="assets/images/List1.PNG"></div>
		<div id="choice">회원가입 방법 선택하기</div>
		
		<div id="SignUpList">
			<input type="button" value="카카오톡으로 가입하기" class="btn"/>
			<input type="button" value="다른방법으로 가입하기" class="btn" id="listUp" />
		</div>
		
		<div>
			이미 가입하셨다면 <a href="loginPage.do">바로 로그인 하기</a>
		</div>
	</div>

</body>
</html>