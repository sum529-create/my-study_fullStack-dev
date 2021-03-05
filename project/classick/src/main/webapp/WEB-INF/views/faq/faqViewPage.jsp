<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - FaqView" name="title"/>
</jsp:include>

<script type="text/javascript">
	function fn_faqDelete(f) {
		if (confirm('삭제할까요?')) {
			f.action = 'faqDelete.do';
			f.submit();
		}
	}
</script>

<style>
	.faxbox {
		border: 1px solid black;
		width : 55%;
		margin-top: 50px;
		margin-left: 25%;
		border-collapse: collapse;
		border: 1px solid lightgray;
	}	
	.faqTitle {
		font-size: 20px;
		font-weight: 900;
		color: gray;
		display: inline-block;
		padding: 20px;
	}
	.ftitle_t {
		display: inline-block;
		padding-left: 0px;
		padding-top: 5px;
		padding-bottom : 10px;
		text-decoration: none;
		color: black;
		font-size: 10px;
		vertical-align: middle;
	}
	.fwriter_w1 {
		text-align: center;
		font-size: 10px;
		font-weight: 900;
		border-top: 1px solid lightgray;
	}
	.fwriter_w2 {
		text-align: center;
		font-size: 10px;
		border-top: 1px solid lightgray;
		border-right: 1px solid lightgray;
	}
	.faqview {
		border-top: 1px solid lightgray;
		padding-left: 15px;
		list-style-type: disc;
		list-style-position: inside;
	}
	.fContent_c {
		padding-left: 15px;
		padding-bottom: 20px;
		padding-top: 20px;
		font-size: 10px;
		border-right: 1px solid lightgray;
	}
	.upBtn {
		width: 55%;	
		margin: auto;
		text-align: center;
	}
	#insertBtn, #deleteBtn, #recall {
		margin-top: 20px;
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
</style>

<form>
	<table class="faxbox">
		<thead>
			<tr>
				<td colspan="4"><span class="faqTitle">자주 묻는 질문</span></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<ul class="faqview">
						<li>
							<span class="ftitle_t">${faqDto.FTitle}</span>
						</li>
					</ul>
				</td>
				<td class="fwriter_w1"><span>작성자</span></td>
				<td class="fwriter_w2">${faqDto.FWriter}</td>
			</tr>
			<tr>
				<td colspan="3" class="fContent_c"><pre>${faqDto.FContent}</pre></td>
			</tr>
		</tbody>
	</table>
	
	<!-- hidden -->
	<input type="hidden" name="fNo" value="${faqDto.FNo}" />
	
	<c:if test="${loginDto.role eq 'ADMIN'}">
		<div class="upBtn">
			<input type="button" name="insertBtn" id="insertBtn" value="수정하기" onclick="location.href='faqUpdatePage.do?FNo=${faqDto.FNo}'">
			<input type="button" name="deleteBtn" id="deleteBtn" value="삭제하기" onclick="fn_faqDelete(this.form)" />
			<input type="button" value="목록으로 이동" id="recall" onclick="location.href='faqListPage.do'" />
		</div>
	</c:if>

</form>







<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>