<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - FaqInsert" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(document).ready(function(){
		init();
	});
	
	function fn_insert(f) {
		if ($('#fTitle').val() == '' || $('#fContent').val() == '') {
			alert('제목과 내용을 입력하세요.');
			return;
		}
		f.action = 'faqInsert.do';
		f.submit();
	} 
	
	function init() {
		$('#btnInit').click(function(){
			$('input:text[name="fTitle"]').val('');
			$('textarea[name="fContent"]').val('');
			$('input:text[name="fWriter"]').val('');
		});
	}
	

</script>

<style>
	.faqInsertBox {
		border: 1px solid lightgray;
		width : 55%;
		margin-top: 50px;
		margin-left: 25%;
		height: 500px;
		padding-top: 20px;
	}
	.fInsert {
		font-size: 20px;
		font-weight: 900;
		color: gray;
		margin-left: 20px;
		padding-bottom: 20px;
	}
	.faqInsertBox > #fTitle, #fWriter, #writefix, #btnInit, label[for="fTitle"], label[for="fContent"], label[for="fWriter"], textarea {
		margin-left: 20px;
	}
	textarea {
		padding: 10px;
		box-sizing: border-box;
		resize: none;
		border: 1px solid black;
	}
	input[name="fTitle"] {
		padding: 5px;
		width: 300px;
		border: 1px solid black;
	}
	#writefix, #btnInit {
		margin-top: 20px;
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
	#fWriter {
		border: 1px solid black;
		width: 150px;
		padding: 5px;
	}
	.divBtn {
		text-align: center;
		margin-top: 10px;
	}
</style>


<form class="faqInsertBox">
	
	<div Class="fInsert">FAQ 등록</div>
	<label for="fTitle">제목</label><br/>
	<input type="text" name="fTitle" id="fTitle" autofocus="autofocus"/><br/><br/>
	<label for="fContent">내용</label><br/>
	<textarea rows="10" cols="60" name="fContent" id="fContent"></textarea><br/><br/>
	<label for="fWriter">작성자</label>
	<input type="text" name="fWriter" id="fWriter" value="관리자"/><br/><br/>
	<div class="divBtn">
		<input type="button" value="작성완료" id="writefix" onclick="fn_insert(this.form)"/>
		<input type="button" value="다시 작성" id="btnInit" />
	</div>
	
</form>


<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>