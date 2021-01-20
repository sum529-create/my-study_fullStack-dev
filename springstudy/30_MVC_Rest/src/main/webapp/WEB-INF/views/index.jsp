<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	// 페이지 로드 이벤트 19_mvc_ajax 참조
	$(document).ready(function () {
		$('#btn1').click(fn_getText);	// btn1을 클릭하면 fn_getText 함수가 실행됩니다.
		$('#btn2').click(fn_getJSON);
		$('#btn3').click(fn_getXML);
		$('#btn4').click(fn_getJSONList);
		$('#btn5').click(fn_getXMLList);
		$('#btn6').click(fn_sendJSON);
		
	});
	
	// 함수
	function fn_getText() {
		$.ajax({
			url: 'getText', 	// @RequestMapping(value="getText")
			type: 'get',		// @RequestMapping( method=RequestMethod.GET)
			dataType: 'text',		// @RequestMapping(produces = "text/plain") + @ResponseBody
			success: function (responseText) {
				// responseText는 응답 받은 결과입니다.
				$('#content1').text(responseText.trim());
			},
			error: function () {
				alert('실패');
			}
		});
	}
	
	function fn_getJSON() {
		$.ajax({
			url:'getJSON',
			type: 'get',
			dateType: 'json',	// new PersonDto가 들어옴 중간에 jackson이 json으로 변환해줌
			success: function(responseObj) {
				// JSON 데이터는 JavaScript의 객체입니다.
				$('#content2').text("이름 : " + responseObj.name + ', 나이 :' + responseObj.age + '살');
				// $('#content2').text("이름 : " + responseObj['name'] + ', 나이 :' + responseObj['age'] + '살');
			},
			error: function() {
				alert('실패');
			}
		});
	}
	
	function fn_getXML() {
		$.ajax({
			url:'getXML',
			type:'get',
			dataType:'xml',
			success: function (responseXML) {
				// responseXML 					<name>앨리스</name><age>30</age>
				// $(responseXML).find('name'); <name>앨리스</name>
				// $(responseXML).find('age');  <age>30</age>
				// $(responseXML).find('name').text(); 앨리스
				// $(responseXML).find('age').text();   30
				$('#content3').text("이름 : " + responseXML.name + ', 나이 :' + responseXML.age + '살');
				
			},
			error: function() {
				alert('실패');
			}
		});
	}
	
	function fn_getJSONList() {
		$.ajax({
			url: 'getJSONList',
			type: 'get',
			dataType: 'json',
			success: function (responseList) {
				// 자바의 ArrayList는 jackson에 의해서
				// 자바 스크립트의 배열로 변환됩니다.
				/*
					 responseList = [
						{"name" : '사용자', "age" : 20},
						{"name" : '사용자', "age" : 21},
						{"name" : '사용자', "age" : 22} -> 하나하나가 person 
					 	...
					 ]
				*/
				$('#content4').empty();
				$.each(responseList, function (idx, person) {
					$('<tr>')
					.append($('<td>').html(idx + 1))
					.append($('<td>').html(person.name))
					.append($('<td>').html(person.age))
					.appendTo('tbody') //어디에 넣을까요
				}); // 반복문 알아서 반복됨 idx로  |  person -> json -> person.name, person.age
			},
			error: function() {
				alert('실패');
			}
		});
	}
	
	function fn_getXMLList() {
		$.ajax({
			url : 'getXMLList',
			type: 'get',
			dateType: 'xml',
			success: function(responseList) {
				/*                                                                                        
					responseList는 아래와 같습니다.
					확인하려면 "http://localhost:9090/rest/getXMLList" 실행 후 주소를 입력합니다..
					
					<item>
						<name>사용자1</name><age>20</age>
					</item>
					<item>
						<name>사용자2</name><age>21</age>
					</item>
					<item>
						<name>사용자3</name><age>22</age>
					</item>
						...
				*/
				$('#content5').empty();	// 반복문
				$(responseList).find('item').each(function(idx) {
					// $(responseList).find('item') == $(this)
					$('<tr>')
					.append($('<td>').html(idx + 1))
					.append($('<td>').html(person.find('name').text()))
					.append($('<td>').html(person.find('age').text()))
					.appendTo('tbody');
				})
			},
			error: function () {
				alert('실패');
			}
		});
	}
	
	function fn_sendJSON() {
		var name = $('#name').val();
		var age = $('#age').val();
		var sendObj = {
				'name':name,
				'age' : age
				// 아직은 자바스크립트의 객체입니다. JSON이 아닙니다.
		};
		$.ajax({
			url : 'sendJSON',
			type: 'post', // @PostMapping
			// 자바스크립트는 제이쿼리를 직접 처리할 수 있다.
			data: JSON.stringify(sendObj), // 컨트롤러로 보내는 데이터 (JSON문자열로 바꿔서 보냅니다.)
			contentType: 'application/json',	// 컨트롤러로 보내는 데이터의 타입입니다.
			dataType: 'json',				// 컨트롤러에서 받아오는 데이터의 타입입니다. type과는 다른 것임 
			success: function (responseObj) {
				$('#content6').text('이름: ' + responseObj.name + ', 나이: ' + responseObj.age + '살');
			},
			error: function () {
				alert('실패');
			}
		});
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	
	<input type="button" value="텍스트가져오기" id="btn1"/><br/>
	<div id="content1"></div>
	
	<br/>
	
	<input type="button" value="JSON가져오기" id="btn2"/><br/>
	<div id="content2"></div>

	<br/>
	
	<input type="button" value="XML가져오기" id="btn3"/><br/>
	<div id="content3"></div>

	<br/>
	
	<input type="button" value="JSON list 가져오기" id="btn4"/><br/>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>성명</td>
				<td>나이</td>
			</tr>
		</thead>
		<tbody id="content4">
			
		</tbody>
	</table>

	<br/>

	<input type="button" value="XML list 가져오기" id="btn5"/><br/>
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>성명</td>
				<td>나이</td>
			</tr>
		</thead>
		<tbody id="content5">
			
		</tbody>
	</table>
	
	<br/>
	
	<form>
		<input type="text" id="name" placeholder = "이름" /> <br/>
		<input type="text" id="age" placeholder = "나이" /> <br/>
		<input type="button" value="정보보내기" id="btn6" /><br/>
	</form>
	<div id="content6"></div>
</body>
</html>