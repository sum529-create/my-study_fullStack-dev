<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Classick | 회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	var chkList1 = false; // 이메일 여부 확인 변수
	var chkList2 = false; // 비밀번호 여부 확인 변수
	var chkList3 = false; // 비밀번호확인 여부 확인 변수
	var chkList4 = false; // 이메일 인증확인 여부 확인 변수
	var chkList5 = false; // 동의 체크 여부 확인 변수
	var chkList6 = false; // 이름 체크 여부 확인 변수
	var chkList7 = false; // 전화번호 체크 여부 확인 변수
	
	// 이메일 정규식
	var EmailCheck = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	// 비밀번호 정규식
	var PwCheck =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	// 전화번호 정규식
	var PhoneCheck = /^\d{3}-\d{3,4}-\d{4}$/;
	
	$(document).ready(function(){
		
		<%-- checkbox 전체선택/해제/일부해제 --%>
		$("#checkAll").click(function() { 
			if($("#checkAll").prop("checked")) {    		  
				$(".check").prop("checked", true);  		   
				$('#resultInfo').text('모두 체크되었습니다.').css('color','limegreen');
				chkList5 = true;
			} else { 										   
				$(".check").prop("checked", false); 		   
				$('#resultInfo').text('이용약관과 개인정보 처리방침은 필수 입니다.').css('color','red');
				chkList5 = false;
			}
		});
		$(".check").click(function(){                          
			if($("input[name='check']:checked").length == 3) { 
				$("#checkAll").prop("checked", true);          
				$("#checkAll").val('y');
				$(".check").val('y');
				$('#resultInfo').text('모두 체크되었습니다.').css('color','limegreen');
				chkList5 = true;
			} else { 										  
				$("#checkAll").prop("checked", false);        
				$('#resultInfo').text('이용약관과 개인정보 처리방침은 필수 입니다.').css('color','red');
				chkList5 = false;
			}
		});
		<%-- 전화번호 하이픈 자동추가 --%>
		$('input[name=mPhone]').on("keyup", function() {
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		
		<%-- 이메일 중복 확인 / 정규식 패턴 여부 확인--%>
		$('#btn').click(function(){
			
			$.ajax({
				url : 'emailListCheckGo.do',
				type: 'post',
				data: $('input[name="mEmail"]'),
				dataType: 'json',
				success : function(responseObj) {
					if(responseObj.mailInfo != $('#L1').val() && EmailCheck.test($('#L1').val() )) {
						$('#r1').text('사용가능합니다.').css('color','limegreen');
						chkList1 = true;
						var email = $('input[name="mEmail"]').val();
						$('L5').val(email);
					}
					if(!EmailCheck.test($('#L1').val() )) {
						$('#r1').text('유효하지 않은 E-Mail주소입니다.').css('color','red');
						chkList1 = false;
					}
				},
				error : function() {
					$('#r1').text('이미 존재하는 이메일입니다.').css('color','red');
					chkList1 = false;
				}
			});
		});
		<%-- 이메일 인증 여부 확인 --%>
		$('#btn1').click(function(){
			$('#Mailchk').show();
			$.ajax({
				url : 'emailCheckGo.do',
				type: 'post',
				data: $('input[name="mailCheck"]'),
			dataType: 'json',
			success : function(responseObj) {
				$('#btn2').click(function(){
					if(responseObj.authkey == $('#userkey').val() ) {
						$('#r5').text('인증되었습니다.').css('color','limegreen');
						chkList4 = true;
					} else {
						$('#r5').text('입력한 값이 일치하지 않습니다.').css('color','red');
						$('#userkey').focus();
						chkList4 = false;
					}
					if($('#userkey').val() == '') {
						$('#r5').text('필수 항목입니다.').css('color','red');
						chkList4 = false;
					}
				});
			},
			error : function() {
				alert('데이터 없음');
				chkList4 = false;
			}
			});
		});
	});
	
	<%-- 비밀번호 확인 --%>
	function fn_pwCheck(f) {
		if($('#L2').val() == '') {
			$('#r2').text('필수 사항입니다.').css('color','red');
			chkList2 = false;
		} else if(PwCheck.test($('#L2').val()) ) {
			$('#r2').text('사용 가능 합니다.').css('color','limegreen');
			chkList2 = true;
		} else {
			$('#r2').text('영문,숫자,특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.').css('color','red');
			chkList2 = false;
		}
	}
	
	<%-- 비밀번호 확인2 --%>
	function fn_pwCheck2(f) {
		if($('#L3').val() == '') {
			$('#r3').text('필수 사항입니다.').css('color','red');
			chkList3 = false;
		} else if($('#L3').val() == $('#L2').val()) {
			$('#r3').text('비밀번호가 일치합니다.').css('color','limegreen');
			chkList3 = true;
		} else {
			$('#r3').text('입력한 값이 다릅니다.다시 입력해주세요.').css('color','red');
			chkList3 = false;
		}
	}
	
	<%-- 이름 확인 --%>
	function fn_nameCheck(f) {
		if($('#L4').val() == '') {
			$('#r4').text('필수 항목입니다.').css('color','red');
			chkList6 = false;
		} else {
			$('#r4').css('color','white');
			chkList6 = true;
		}
	}
	
	<%-- 전화번호 확인 --%>
	function fn_phoneCheck(f) {
		if($('#L6').val() == '') {
			$('#r6').show();
			$('#r6').text('필수 항목입니다.').css('color','red');
			chkList7 = false;
		} else if(PhoneCheck.test($('#L6').val()) ) {
			$('#r6').css('display','none');
			chkList7 = true;
		} else {
			$('#r6').show();
			$('#r6').text('다시 입력해주세요.').css('color','red');
			chkList7 = false;
		}
	}
	
	function fn_signUp(f) {
		
		<%-- 회원가입 전 유효성 체크 --%>
		
		if($('#L1').val() == '' && $('#L2').val() == '' && $('#L3').val() == '' && $('#L4').val() == '' && $('#L5').val() == '' && $('#L6').val() == '') {
			$('#r1').text('필수 항목입니다.').css('color','red');
			$('#r2').text('필수 항목입니다.').css('color','red');
			$('#r3').text('필수 항목입니다.').css('color','red');
			$('#r4').text('필수 항목입니다.').css('color','red');
			$('#r5').text('필수 항목입니다.').css('color','red');
			$('#r6').text('필수 항목입니다.').css('color','red');
		}
		if($('#L1').val() == '') {
			$('#r1').text('필수 항목입니다.').css('color','red');
			chkList1 = false;
		}
		if($('#L5').val() == '') {
			$('#r5').text('필수 항목입니다.').css('color','red');
			chkList1 = false;
		}
		<%-- 체크박스 설정 --%>
		if($('#checkAll').prop("checked",false) && $('.check').prop("checked",false)) {
				$('#resultInfo').text('이용약관과 개인정보 처리방침은 필수 입니다.').css('color','red');
		}
		$("#checkAll").click(function() { 
			if($("#checkAll").prop("checked")) {    		  
				$(".check").prop("checked", true);  		   
				$('#resultInfo').text('모두 체크되었습니다.').css('color','limegreen');
				chkList5 = true;
			} else { 										  
				$(".check").prop("checked", false); 		  
				$('#resultInfo').text('이용약관과 개인정보 처리방침은 필수 입니다.').css('color','red');
				chkList5 = false;
			}
		});
		$(".check").click(function(){                         
			if($("input[name='check']:checked").length == 3) { 
				$("#checkAll").prop("checked", true);         
				$('#resultInfo').text('모두 체크되었습니다.').css('color','limegreen');
				chkList5 = true;
			} else { 										  
				$("#checkAll").prop("checked", false);        
				$('#resultInfo').text('이용약관과 개인정보 처리방침은 필수 입니다.').css('color','red');
				chkList5 = false;
			}
		});
		if(chkList1 == true && chkList2 == true && chkList3 == true && chkList4 == true && chkList5 == true && chkList6 == true && chkList7 == true) {
			<%-- 체크리스트가 모두 true일때 회원가입 진행 --%>
			if(confirm('완료하시겠습니까?')) {
				f.action = "memberSignUp.do";
				f.submit();
			}
		}
	}
</script>
<style>
	#Mailchk {
		display : none;
	}
	#info {
		font-size: 12px;
		text-align : center;
		margin : auto;
		margin-top : 5px;
		font-weight: bold;
	}
	#container {
		width  : 600px;
		margin : auto;
		margin-top : 30px;
		display : flex;
		justify-content: space-between;
	}
	form {
		margin : auto;
	}
	input {
		font-size: 18px;
		border-radius: 5px;
	}
	.list {
		margin-top : 10px;
		width  : 450px;
		height : 50px;
	}
	input[name=mCode] {
		margin-top : 10px;
		width  : 450px;
		height : 50px;
	}
	#L5 {
		width : 350px;
	}
	#userkey{
		margin-top : 10px;
		width : 350px;
		height: 50px;
	}
	#L1 {
		width : 350px;
		height: 50px;
	}
	#signUp {
		width : 462px;
		height: 50px;
		background-color : #ff7b30;
		border-color: #ff7b30;
		color : white;
		font-weight: bold;
		cursor:pointer;
	}
	#signUp:hover {
		background : #ff6730;
	}
	.req {
		width : 94px;
		height : 56px;
		background-color : #ff7b30;
		border : 0px solid #ff7b30;
		color : white;
		font-weight: bold;
		cursor:pointer;
	}
	input[type=checkbox] {
		zoom: 1.5;
	}
	input[name="mPw2"] {
		margin-top : -40px;
	}
	.mInfo{
		font-weight: bold;
	}
	.check, .req, label {
		cursor:pointer;
	}
	#memberInfo{
		text-align : center;
		margin-bottom : 50px;
		font-size : 20px;
		font-weight: bold;
	}
	.result {
		font-size : 15px;
	}
	#img1 {
		margin-top : 40px;
		text-align : center;
	}
	#img2 {
		text-align: center;
	}
	input[type=button]:hover {
		background : #ff6730;
	}
	span {
		color : red;
	}
</style>
</head>
<body>
		<div id="img1"><a href="index"><img alt="img1" src="assets/images/classickLogo.png"></a></div>
<div id="container">
	<form method="post">
		<%-- 회원가입 정보 --%>
		<div id="img2"><img alt="img2" src="assets/images/List2.PNG"></div>
		
		<div id="memberInfo">가입 정보 입력하기</div>
		<div class="mInfo"><span>* </span><b>이메일</b></div>
		<input type="text" name="mEmail" class="list" id="L1" placeholder="이메일을 입력해주세요."/>
		<input type="button" value="중복확인" id="btn" class="req"/><br/>
		<span class="result" id="r1"></span><br/><br/>
		
		<div class="mInfo"><span>* </span><b>비밀번호</b></div>
		<input type="password" name="mPw" class="list" id="L2" placeholder="비밀번호 (영문+숫자+특수문자 8자 이상)" onkeyup="fn_pwCheck(this.form)"/><br/>
		<span class="result" id="r2"></span><br/><br/>
		
		<input type="password" name="mPw2" class="list" id="L3" placeholder="비밀번호 확인" onkeyup="fn_pwCheck2(this.form)"/><br/>
		<span class="result" id="r3"></span><br/><br/>
		
		<div class="mInfo"><span>* </span><b>이름</b></div>
		<input type="text" name="mName" class="list" id="L4" placeholder="이름을 입력해주세요." onkeyup="fn_nameCheck(this.form)"/><br/>
		<span class="result" id="r4"></span><br/><br/>
		
		<div class="mInfo"><span>* </span><b>전화번호</b></div>
		<input type="text" name="mPhone" class="list" id="L6" placeholder="핸드폰번호를 입력해주세요." onkeyup="fn_phoneCheck(this.form)"/><br/>
		<span class="result" id="r6"></span><br/><br/>
		
		<div class="mInfo"><span>* </span><b>이메일</b></div>
		<input type="text" name="mailCheck" class="list" id="L5" placeholder="이메일을 입력해주세요.">
		<input type="button" id ="btn1" class="req" value="인증요청"/><br/>
		
		<div id="Mailchk">
			<input type="text" name="userkey" id="userkey" placeholder="인증번호를 입력해주세요."/>
			<input type="button" id="btn2" class="req" value="인증" />
		</div>
		<span class="result" id="r5"></span><br/><br/>
		
		<div class="mInfo">추천인코드</div>
		<input type="text" name="mCode"placeholder="선택사항" /><br/><br/>
		
		<div class="mInfo">
		<input type="checkbox" name="checkAll" class="check" id="checkAll" value="n"/>
		<label for="checkAll">모두 동의합니다.</label><br/>
		<hr></hr>
		<input type="checkbox" name="check" class="check" id="chk1" value="n" />
		<label for="chk1">이용약관 필수 동의</label><br/>
		<input type="checkbox" name="check" class="check" id="chk2"  value="n" />
		<label for="chk2">개인정보 처리방침 필수 동의</label><br/>
		<input type="checkbox" name="check" class="check" id="chk3" value="n" />
		<label for="chk3">쿠폰 / 이벤트 알림 필수 동의</label><br/>
		</div>
		<hr></hr>
		<span class="result" id="resultInfo"></span><br/><br/>
		
		<input type="button" value="회원가입하기" id="signUp" onclick="fn_signUp(this.form)"/><br/><br/>
		<div class="result" id="info">단, 14세 미만은 회원가입 할 수 없습니다.</div>
	</form>
</div><br/>
</body>
</html>