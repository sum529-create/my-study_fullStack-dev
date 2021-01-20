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
		$('#btn3').click(fn_getJSONList);
		
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
						{"name" : '사용자', "age" : 22}
					 	...
					 ]
				*/
			},
			error: function() {
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
	<div id="content4"></div>
</body>
</html>