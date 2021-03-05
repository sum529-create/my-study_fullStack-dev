<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - Add Notice Page" name="title" />
</jsp:include>

<script type="text/javascript">
	function fn_goList(f){
		location.href = "noticeListPage.do"
	}
</script>

<style>
	#title, #writer, #content {
		border: 1px solid black;
	} 
	
	.register, #noticeBtn {
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
</style>

<div class="notice-title inner-w">
	<h2 class="txt">공지사항</h2>
</div>
<div class="notice-content inner-w">
	<div class="notice-insert">
		<form action="noticeInsert.do" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title" required/></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" id="writer" required/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" cols="30" rows="5"></textarea></td>
					</tr>
					<tr>
						<td>첨부 파일/이미지</td>
						<td><input type="file" name="filename" id="filename"/></td>
					</tr>
				</tbody>
			</table>
			<div class="button-list">
				<button class="register">등록 하기</button>
				<input type="button" value="목록으로" id="noticeBtn" onclick="fn_goList()"/>
			</div>
		</form>
	</div>
</div>

<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>