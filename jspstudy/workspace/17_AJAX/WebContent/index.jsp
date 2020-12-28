<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">


<%-- $.ajax({}) -> 는 input 타입에서 보내주기도 하고 받기도 하겠다는 뜻. --%>

	// 페이지 로드 이벤트 (페이지 다 읽어서 id 먼저 파악하기)
	// 1. $(document).ready(function(){});
	// 2. $(function(){});
	$(document).ready(function(){
		fn_getString();
		fn_getJSON();
	});
	
	// 처리 함수
	function fn_getString() {
		
		// id="btn1"을 클릭하면 function(){} 실행
		// 1. $('#btn1').click(function(){});
		// 2. $('body').on('click', '#btn1', function(){});
		
		// 동작 확인 예제
		/*
		$('#btn1').click(function(){
			var str = '<tr><td colspan="5">동작확인예제입니다.</td></tr>';
			$('#content').append(str);  // 기존 요소를 살리고 추가
			$('#content').html(str);    // 기존 요소를 지우고 추가
		});
		*/
		
		$('#btn1').click(function(){
			$.ajax({
				url: '/17_AJAX/getString.black',  // 요청URL: BlackStringCommand를 호출한다.
				type: 'get',  // 요청방식: get, post
				dataType: 'text',  // 받는(응답) 결과의 타입
				success: function(responseText) {  // responseText: BlackStringCommand의 반환 값이 저장된다.
					$('#content').empty();  // content 비우기
					$('#content').append(responseText);
				},
				error: function(){
					alert('AJAX 통신 실패');
				}
			});
		});
		
	} // end fn_getString()
	
	function fn_getJSON() {
		$('#btn2').click(function(){
			$.ajax({
				url: '/17_AJAX/getJSON.black',
				type: 'get',
				dataType: 'json',  // 받는(응답) 결과의 타입(실제로는 JSON을 String으로 바꾼 결과를 받아온다.)
				success: function(responseJSONArray) {
					var result = '';
					$.each(responseJSONArray, function(index, responseJSON){
						result += '<tr>';
						result += '<td>' + responseJSON.name + '</td>';
						result += '<td>' + responseJSON.age + '</td>';
						result += '<td>' + responseJSON.gender + '</td>';
						result += '<td>' + responseJSON.phone + '</td>';
						result += '<td>' + responseJSON.address + '</td>';
						result += '</tr>';						
					});
					$('#content').empty();
					$('#content').append(result);
				},
				error: function() {
					alert('AJAX 통신 실패');
				}
			});
		});
	}
	
</script>
</head>
<body>

	<h3>AJAX통신버튼</h3>
	<input type="button" value="문자열" id="btn1" />
	<input type="button" value="JSON" id="btn2" />

	<h3>Black 테이블</h3>
	<table border="1">
		<thead>
			<tr>
				<td>이름</td>
				<td>나이</td>
				<td>성별</td>
				<td>전화</td>
				<td>주소</td>
			</tr>
		</thead>
		<tbody id="content">
		
		</tbody>
	</table>

</body>
</html>