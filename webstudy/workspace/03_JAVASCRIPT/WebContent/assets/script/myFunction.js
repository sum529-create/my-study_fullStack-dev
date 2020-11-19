/**
 * 
 */


/* 	console.log(Math.round(123.456 * 1/100)/(1/100));	// 십의 자리 반올림
	console.log(Math.round(123.456 * 1/10)/(1/10));	// 일의 자리 반올림
	console.log(Math.round(123.456 * 1)/1);			// 정수 반올림
	console.log(Math.round(123.456 * 10)/10);		// 소수 1자리 반올림
	console.log(Math.round(123.456 * 100)/100);		// 소수 2자리 반올림
	console.log(Math.round(123.456 * 1000)/1000);	// 소수 3자리 반올림 */

	// n 자리로 반올림 값을 반환하는 myRound 함수
	function myRound(n, digits){
		digits || (digits= 0);	// default 처리,   digits의 전달이 없으면 digits은 0으로 처리
		return Math.round(n * Math.pow(10, digits))/Math.pow(10, digits);
	}
	// n 자리로 올림 값을 반환하는 myRound 함수
	function myCeil(n, digits){
		digits || (digits= 0);	// default 처리,   digits의 전달이 없으면 digits은 0으로 처리
		return Math.ceil(n * Math.pow(10, digits))/Math.pow(10, digits);
	}
	// n 자리로 내림 값을 반환하는 myRound 함수
	function myFloor(n, digits){
		digits || (digits= 0);	// default 처리,   digits의 전달이 없으면 digits은 0으로 처리
		return Math.floor(n * Math.pow(10, digits))/Math.pow(10, digits);
	}

	// 04_함수/quiz01.html
	function watch(){
			setTimeout(function(){
				var now = new Date();
				document.getElementById('year').textContent = now.getFullYear();
				document.getElementById('month').textContent = fillZero(now.getMonth()+1, 2); // 두자리 맞춘다.
				document.getElementById('date').textContent = fillZero(now.getDate(),2);
				document.getElementById('hour').textContent = now.getHours();
				document.getElementById('minute').textContent = fillZero(now.getMinutes(),2);
				document.getElementById('second').textContent = fillZero(now.getSeconds(),2);
			
				// 재귀 호출
				watch();
			}, 1000);
	};	
	

	// 04_함수/quiz02.html
	function fillZero(n, digits){
		digits || (digits = 0);
		var strN = '' + n;
		
		while(strN.length != digits){
			strN = '0' + strN;
		}
		return strN;
	}


	// 04_함수/quiz03.html
	function dDay(){
		setTimeout(function(){
			var d_day = new Date(2020, 11, 3);
			var today = new Date();
			var restTime = d_day.getTime() - today.getTime();
			var result = '';
			
			if(restTime <= 0){
				document.getElementById('d-day').textContent = '입니다.';
				return;
			}
			// 남은 시간 계산
			restTime = parseInt(restTime / 1000);	// restTime이 초 단위로 변경
			var second = restTime % 60;
			var minute = parseInt(restTime/60)%60; 
			var hour = parseInt(restTime/3600)%24;
			var day = parseInt(restTime/3600/24);
			
			if(day > 0){
				result += (day + '일 ');
			}
			result += (hour + '시 ' + minute + '분 ' + second + '초');
			
			document.getElementById('d-day').textContent = result;
			
			if(day == 0){
				document.getElementById('d-day').style.color = 'red';
			}
			
			// 재귀호출
			dDay();
		}, 1000);
	}




