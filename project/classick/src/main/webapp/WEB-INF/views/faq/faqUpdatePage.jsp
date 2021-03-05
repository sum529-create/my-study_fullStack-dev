<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - FaqInsert" name="title"/>
</jsp:include>

<script>
	$(document).ready(function(){
		init();
		fn_updateCheck();
	});
	
	function init() {
		$('#btnInit').click(function(){
			$('input:text[name="fTitle"]').val('');
			$('textarea[name="fContent"]').val('');
			$('input:text[name="fWriter"]').val('');
		});
	}
	
	function fn_updateCheck() {
		$('#updateBtn').click(function() {
			if ($('#fTitle').val() == '' || $('#fContent').val() == '') {
				alert('제목과 내용을 입력해주세요.');
				return false;
			}
			f.submit();
			f.action = 'faqUpdate.do';
		});
	}
	
	
</script>


<style>
	.faqUdateBox {
		border: 1px solid lightgray;
		width : 55%;
		margin-top: 50px;
		margin-left: 25%;
		height: 450px;
		padding-top: 20px;
		box-sizing: border-box;
	}
	.fUpdate {
		font-size: 20px;
		font-weight: 900;
		color: gray;
		margin-left: 20px;
		padding-bottom: 20px;
	}
	.faqUdateBox > #fTitle, #btnInit, #recall, label[for="fTitle"], label[for="fContent"], label[for="fWriter"], textarea {
		margin-left: 20px;
	}
	.upWriter {
		margin-left: 20px;
	}
	#updateBtn {
		margin-left: 20px;
		width: 100px;
		height: 30px;
	}
	textarea {
		padding: 10px;
		box-sizing: border-box;
		resize: none;
		border : 1px solid black;
	}
	input[name="fTitle"] {
		padding: 5px;
		width: 300px;
		border : 1px solid black;
	}
	#btnInit, #recall {
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
	#updateBtn {
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
	.divBtn {
		text-align: center;
	}
	.foot-wrap {
		margin-top: 20px;
	}
</style>


<form action="faqUpdate.do">

<div class="faqUdateBox">
	
	<div Class="fUpdate">FAQ 수정</div>
	
	<label for="fTitle">제목</label><br/>
	<input type="text" name="fTitle" id="fTitle" value="${faqDto.FTitle}"/><br/><br/>
	<label for="fContent">내용</label><br/>
	<textarea rows="10" cols="60" name="fContent" id="fContent" autofocus="autofocus">${faqDto.FContent}</textarea><br/><br/>
	<label for="fWriter">작성자</label>
	<span class="upWriter">${faqDto.FWriter}</span><br/><br/>
	
	<!-- hidden -->
	<input type="hidden" name="fNo" value="${faqDto.FNo}" />
	
	<div class="divBtn">
		<button id="updateBtn">수정완료</button>
		<input type="button" value="다시 작성" id="btnInit" />
		<input type="button" value="목록으로 이동" id="recall" onclick="location.href='faqListPage.do'" /><br/><br/>
	</div>
	
</div>
	
	
	
</form>


<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>