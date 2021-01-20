<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	
	// 페이지 로드 이벤트
	$(document).ready(function () {
		memberList();
		memberView();
		memberInsert();
		memberUpdate();
		memberDelete();
	});
	
	/***** 1. 회원 목록 *****/
	function memberList() {
		
	}
	
	/***** 2. 회원 정보 *****/
	function memberView() {
		
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert() {
		
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate() {
		
	}
	
	/***** 5. 회원 삭제 *****/
	function memberDelete() {
		
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
			<input type="radio" name="gender" value="남"/>남
			<input type="radio" name="gender" value="여"/>여<br/><br/>
			주소<br/>
			<section name="address">
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
			</section><br/><br/>
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
						<td>회원번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>성별</td>
						<td>주소</td>
						<td>비고</td>
					</tr>
				</thead>
				<tbody id="memberList"></tbody>
			</table>
		</div>
		
	</div>
	
</body>
</html>