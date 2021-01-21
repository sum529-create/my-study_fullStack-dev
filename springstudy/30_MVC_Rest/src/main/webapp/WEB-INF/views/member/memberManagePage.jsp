<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	
	/*
		REST : URI + HTTP Method
		
				URI			method
		목록	member		GET
		보기	member/{no}	GET
		삽입	member		POST	// 목록방식하고는 다르다
		수정	member		PUT
		삭제	member/{no}	DELETE
		
	*/
	
	
	// 페이지 로드 이벤트
	$(document).ready(function () {
		memberList();
		memberView();
		memberInsert();
		memberUpdate();
		memberDelete();
		init();
	});
	
	/***** 1. 회원 목록 *****/
	function memberList() {
		// URI : member, Method: GET
		$.ajax({
			url:'member',
			type:'get',
			dataType:'json',
			success: function(responseList) {
				/*
					responseList={
						"list" : [ //list
							{
								// member
								"no":1,
								"id":"user",
								"name":"제임스",
								"gender":"남",
								"address": "서울"
							}
							...
						],
						"result": true
						=> result를 먼저 빼서 true인지 먼저 판별한다.
					}
				
				*/
				if(responseList.result == true){
					memberListTable(responseList.list);	// 서브 함수 호출
					// list만 필요하니 list값만 넘겨준다. (명단만 넘기기)
				}
			},
			error: function () {
				alert('실패');
			}
			
		});
	}
	// 서브 함수 : 회원 목록을 테이블로 만들어 주는 함수
	function memberListTable(list) {	// responseList.list
		// 그대로 responseList값을 받음
		// html memberList영역
		$('#memberList').empty();	// 기존 목록을 제거합니다.
		$.each(list, function(idx, member) { // for문 list에서 하나씩 빼서 idx로 뺀다.
			$('<tr>')
			// text, append, html 다 가능. 비고에 button을 만들것이기에
			// .html을 사용함, 아무거나 상관은 없음
			.append($('<td>').html(member.no)) 
			.append($('<td>').html(member.id)) 
			.append($('<td>').html(member.name)) 
			.append($('<td>').html(member.gender)) 
			.append($('<td>').html(member.address))
			// view를 할때 no를 보내야하는데 no에 따로 태그가 없기에 hidden값으로 보내야함다.
			// value값이 없다. $()값으로 묶어준다. -> 추가로 호출할 메소드가 필요함으로 (.val, .html.. 같은거?)
			// value=${member.no} el사용도 안되고 보내줄 값도 없다.
			// .val('') : 값을 채워준다.
			.append($('<input type="hidden" name="no" />').val(member.no))// member변수를 채워준다. 
			.append($('<td>').html('<input type="button" value="조회" id="btnView"/>'))
			.append($('<td>').html('<input type="button" value="삭제" id="btnDelete"/>'))
			.appendTo('#memberList');
		});
	}
	
	
	
	/***** 2. 회원 정보 *****/
	function memberView() {
		// jquery의 append() 등의 메소드를 이용해서 생성한 버튼은
		// $('#btnView').click(function(){}) 와 같은 click 이벤트 처리가 불가능합니다.
		
		// 정적 요소 : 미리 만들어 놓은 것
		// 동적 요소 : append()나 html() 메소드로 만든 요소 -> insert만들어서?
		// 동적 요소의 이벤트 연결(바인딩)은 on()메소드를 사용해야 합니다.
		
		// 누군가에게 어떤 이벤트를 붙여주세요. : on
		$('body').on('click', '#btnView', function() {
			// <input type="hidden"" name="no" /> 태그의 value를 알아내야 합니다.
			// 현재는 6개 데이터가 있다는 가정하에 6개의 값이 나온다.
			// $('input:hidden[name="no"]).val()로 쓰면 6개 값을 어떻게 알아낼수없음
			// 이거는 사용 못함
		});
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert() {
		// 입력 데이터 -> JSON데이터로 만듭니다.
		// 만들어진 JSON데이터를 컨트롤러로 넘겨줍니다.
		// POST 방식은 파라미터를 본문(Body)에 실어줍니다. (JSON 데이터를 body에 실어 줍니다.)
		// 그래서 컨트롤러는 요청 파라미터(request)를 본문에서 꺼내야 합니다. -> @RequestBody[HTTP 요청의 body 내용을 자바 객체로 매핑하는 역할] 애너테이션이 필요하다는 의미입니다.
		// 주소창에 ?를 보내는 것이 아니다.
		
		$('#btnInsert').click(function() {
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var gender = $('input:radio[name="gender"]:checked').val(); // value가 두개임
			var address = $('select[name="address"]').val();
			var sendObj = { // 보내주기 위한 객체
					"id" : id,
					"name" : name,
					"gender" : gender,
					"address" : address
			};
			// sendObj로 자바스크립트 객체로 만들어줌
			$.ajax({
				url : 'member', // url이 같다고 같은 형식은 아님
				type: 'post',	// post방식이기에
				data: JSON.stringify(sendObj), // 자바스크립트의 값을 JSON문자열로 변환, 컨트롤러로 보내는 JSON 데이터(신규회원 정보)
				contentType: 'application/json', 	// 컨트롤러로 보낼때의 데이터의 타입
				dataType: 'json', // map을 받아오지만 map을 어떤 타입으로 가져오나 json, jackson이 map을 json으로 바꿔줌
				success: function(responseObj) {
					/*
						responseObj = {
							"result" : 1 (성공)
							또는
							"result" : 0 (실패)
						}
					*/
					if(responseObj.result == 1){
						alert('신규회원이 등록되었습니다.');
						// 성공 후에 새로 명단을 출력해야함
						memberList(); // 새로고침
					}else{
						alert('신규 회원 등록에 실패했습니다.');
					}
					
				},
				error: function () {
					alert('실패');
				}
			});
		});
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate() {
		
	}
	
	/***** 5. 회원 삭제 *****/
	function memberDelete() {
		
	}
	
	/***** 6. 초기화 *****/
	function init() {
		$('#btnInit').click(function () {
			$('input:text[name="id"]').val(''); // 빈 문자를 채워준다. input 태그의 name이 id인거
			$('input:text[name="name"]').val('');
			// $('input:radio[name="gender"]').prop('checked'); // checked 같은 것을 property라고 하며
			// $('input:radio[name="gender"]').prop('checked', 'dddd'); // 내용을 바꿔주려면 뒤에 추가한다.
			$('input:radio[name="gender"]').prop('checked', false);	// 빈칸처리
			$('select[name="address"]').val('');
			memberList();	// 목록 새로 고침. 다시 불러온다.
		});
	}
	
</script>
<title>Insert title here</title>
<style type="text/css">
	.wrap{
		display:flex;	<!-- 아래 박스 수평배치 -->
	}
	.left{
		width: 500px;
	}
	.right{
		width: 1000px;
	}
	table{
		border-collapse : collapse;
	}
	td, th{
		border-top: 1px solid black;
		border-bottom : 1px solid black;
		padding: 5px 10px;
		text-align: center;
	}
	th{
		background: silver;
	}
</style>
</head>
<body>
	
	<div class="wrap">
		
		<div class="left">
			<!-- 등록/수정/보기 페이지 -->
			<h3>회원 등록/수정/보기</h3>
			아이디<br/>
			<input type="text" name="id"/><br/><br/>
			이름<br/>
			<input type="text" name="name"/><br/><br/>
			성별<br/>
			<input type="radio" name="gender" value="남" checked/>남
			<input type="radio" name="gender" value="여"/>여<br/><br/>
			주소<br/>
			<select name="address">
				<option value="">지역 선택</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
			</select><br/><br/>
			<input type="button" value="등록" id="btnInsert"/>
			<input type="button" value="수정" id="btnUpdate"/>
			<input type="button" value="초기화" id="btnInit"/> <!-- reset안하고 직접구현 -->
			
		</div>
		
		<div class="right">
			<!-- 목록/삭제 페이지 -->
			<h3>회원 목록</h3>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>주소</th>
						<th colspan="2">비고</th>
					</tr>
				</thead>
				<tbody id="memberList"></tbody>
			</table>
		</div>
		
	</div>
	
</body>
</html>