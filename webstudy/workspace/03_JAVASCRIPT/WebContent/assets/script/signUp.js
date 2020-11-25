/**
 * 
 */

function fn_idCheck(f) {
	var regExpID = /^[a-z][a-z0-9_-]{4,15}$/;
	var id = f.id.value;
	var result = document.getElementById('id-result');
	if (id == '') {
		result.textContent = '필수 입력입니다.';
		return false;
	} else {
		if (regExpID.test(id)) {
			result.textContent = '사용 가능한 아이디입니다.';
			return true;
		} else {
			result.textContent = '사용할 수 없는 아이디입니다.';
			return false;
		}
	}
}

function fn_pwCheck(f) {
	var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9~!@#$%^&*-_?]{8,16}$/;
	var pw = f.pw.value;
	var result = document.getElementById('pw-result');
	if (pw == '') {
		result.textContent = '필수 입력입니다.';
		return false;
	} else {
		if (regExpPW.test(pw)) {
			result.textContent = '사용 가능한 비밀번호입니다.';
			return true;
		} else {
			result.textContent = '사용할 수 없는 비밀번호입니다.';
			return false;
		}
	}
}

function fn_pwCheck2(f) {
	
	if (!fn_pwCheck(f)) {
		alert('비밀번호를 확인하세요.');
		f.pw.focus();
		return false;
	}
	
	var result = document.getElementById('pw-result2');
	if (f.pw.value == f.pw2.value) {
		result.textContent = '비밀번호가 일치합니다.';
		return true;
	} else {
		result.textContent = '비밀번호를 확인하세요.';
		return false;
	}
	
}

function fn_emailCheck(f) {
	var regExpEmail = /^[a-z][a-z0-9-_]+@[a-zA-Z0-9]{3,}(\.[a-zA-Z]{2,6}){1,2}$/;
	var email = f.email.value;
	var result = document.getElementById('email-result');
	if (email == '') {
		result.textContent = '필수 입력입니다.';
		return false;
	} else {
		if (regExpEmail.test(email)) {
			result.textContent = '올바른 이메일입니다.';
			return true;
		} else {
			result.textContent = '잘못된 이메일입니다.';
			return false;
		}
	}
}

function fn_mobile2Check(f) {
	var regExpMobile2 = /^[0-9]{3,4}$/;
	var mobile2 = f.mobile2.value;
	if (regExpMobile2.test(mobile2) && mobile2.length == 4) {
		f.mobile3.focus();
		return true;
	} else if (regExpMobile2.test(mobile2)) {
		return true;
	} else {
		return false;
	}
}

function fn_mobile3Check(f) {
	var regExpMobile3 = /^[0-9]{4}$/;
	var mobile3 = f.mobile3.value;
	if (regExpMobile3.test(mobile3)) {
		return true;
	} else {
		return false;
	}
}

function fn_mobile(f) {
	var mobile = f.mobile;
	f.mobile.value = f.mobile1.value + '-' +
					 f.mobile2.value + '-' +
					 f.mobile3.value;
}

function fn_personalIdCheck(f) {
	var regExp1 = /^[0-9]{6}$/;
	var regExp2 = /^[0-9]{7}$/;
	var p1 = f['personal-id1'].value;
	var p2 = f['personal-id2'].value;
	if (regExp1.test(p1) && regExp2.test(p2)) {
		return fn_personalIdCheck2(f);
	} else {
		document.getElementById('personal-id-result').textContent = '잘못된 주민등록번호입니다.'
		return false;
	}
}

function fn_personalIdCheck2(f) {
	
	// 주민등록번호 검증 방법
	
	// 주민등록번호: 801212-123456 7
	//     검증번호: 234567 892345
	
	// 1. 주민등록번호와 검증번호를 1:1로 매칭해서 곱한다. 그 결과를 모두 더한다.(total)
	//    total = 8*2 + 0*3 + 1*4 + ... + 6*5
	// 2. 주민등록번호 마지막 숫자 == (11 - total % 11) % 10 이면 정상 주민등록번호이다.
	
	var p1 = f['personal-id1'].value;
	var p2 = f['personal-id2'].value;
	
	var total = 0;
	for (let i = 0; i < p1.length; i++) {
		total += (p1.charAt(i) * (i + 2));
	}
	for (let i = 0; i < p2.length - 1; i++) {
		if (i < 2) {
			total += (p2.charAt(i) * (i + 8));
		} else {
			total += (p2.charAt(i) * i);
		}
	}
	var result = document.getElementById('personal-id-result');
	if ((11 - (total % 11)) % 10 == p2.charAt(6)) {
		// 생일 채우기
		switch (p2.charAt(0)) {
		case '1':
		case '2': f.year.value = '19' + p1.substring(0, 2);
				  break;
		case '3':
		case '4': f.year.value = '20' + p1.substring(0, 2);
				  break;
		}
		f.month.value = p1.substring(2, 4);
		f.day.value = p1.substring(4);
		// 성별 채우기
		switch (p2.charAt(0)) {
		case '1':
		case '3': f.gender.value = 'm';
				  break;
		case '2':
		case '4': f.gender.value = 'f';
				  break;
		}
		result.textContent = '올바른 주민등록번호입니다.';
		return true;
	} else {
		result.textContent = '잘못된 주민등록번호입니다.';
		return false;
	}
	
}

function fn_signUp(f) {
	
	if (!fn_idCheck(f)) {
		alert('아이디를 확인하세요.');
		f.id.focus();
		return;
	}
	if (!fn_pwCheck(f) || !fn_pwCheck2(f)) {
		alert('비밀번호를 확인하세요.');
		f.pw.focus();
		return;
	}
	if (!fn_emailCheck(f)) {
		alert('이메일을 확인하세요.');
		f.email.focus();
		return;
	}
	if (!fn_mobile2Check(f) || !fn_mobile3Check(f)) {
		alert('모바일 번호를 확인하세요.');
		f.mobile2.focus();
		return;
	}
	if (!fn_personalIdCheck(f)) {
		alert('올바른 주민등록번호를 입력하세요.');
		f['personal-id1'].focus();
		return;
	}
	
	fn_mobile(f);
	
	f.action = '#';
	f.submit();
	
}