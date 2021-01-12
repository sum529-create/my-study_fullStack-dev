<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- 작업할 script는 따로 -->
<script type="text/javascript">
	
	// 페이지 로드 이벤트
	$(function () {
		fn_send1();
		fn_send2();
	});
	
	// controller에서 받아오는 text
	function fn_send1() {
		$('#btn1').click(function() {
			$.ajax({
				url: 'getText', 	// RequestMapping의 value를 작성합니다.
				type: 'get',		// RequestMapping의 method를 작성합니다.
				data: 'send='+$('#send').val(),	// controller로 보내는 값(파라미터)
				dataType: 'text',	// controller에게서 받아오는 값의 타입
				success: function (responseText) {	// responseText: Controller에게서 받아오는 값
					$('#content1').text(responseText.trim());	// trim(): 불필요한 공백 제거
				},
				/*
					$('#content1') == <div id "content1"></div>
					$('#content1').text(responseText) == <div id="content1">responseText<div>
					$('#content1').text() == responseText
				*/
				error: function () {
					alert('실패');
				}
			});
		});
	}
	
	// controller에서 받아오는 json
	function fn_send2() {
		$('#btn2').click(function() {
			$.ajax({
				url: 'getJson',
				type: 'post',
				data: 'send=' + $('#send').val(),	// send=가 날라가면 파라미터가 날라간다.
				dataType: 'json',	// return되는 데이터가 json이다.
				success: function (responseObj) {
					// responseObj는 json데이터이므로,
					// 자바스크립트는 객체로 처리하면 됩니다.
					// 1) 객체.프로퍼티   OR
					// 2) 객체['프로퍼티'] 방법
					
					// html 태그추가방법
					// 1) .html(): 새로 추가
					// 2) .append() : 원래 있던것에 추가
					$('#content2').empty();	// 창 비우기
					$('#content2').append('<ul><li>' + responseObj.send + '</li>');
					$('#content2').append('<li>' + responseObj.exist + '</li></ul>');
				},
				error: function () {
					alert('실패');
				}
			});
		});
		
	}
	
</script>
<title>Insert title here</title>
</head>
<body>

	<!--  ajax를 사용하려면 jquery가 필요하고, cdn으로 내려받는다. -->
	<form action="">
		
		보내는 값<br/>
		<input type="text" id="send"/><br/><br/>
		
		<input type="button" id="btn1" value="일반텍스트"/><br/>
		<div id="content1"></div><br/>

		<input type="button" id="btn2" value="JSON"/><br/>
		<div id="content2"></div><br/>
	</form>
</body>
</html>