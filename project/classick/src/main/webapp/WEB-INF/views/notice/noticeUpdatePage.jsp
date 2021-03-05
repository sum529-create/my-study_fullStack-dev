<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - Notice View Page" name="title" />
</jsp:include>

<script type="text/javascript">
	function fn_update(f){
		f.action = "noticeUpdate.do";
		f.submit();
	}
	function fn_goBack(f){
		location.href = 'noticeViewPage.do?no=${noticeDto.NNo}'
	}
</script>

<style>
	#title, #writer, #content {
		border: 1px solid black;
	}
	.noticeUpBtn, #backBtn {
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
	<div class="notice-view">
		<form action="noticeUpdate.do" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title" value="${noticeDto.NTitle}" required/></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" id="writer" value="${noticeDto.NWriter}" readonly/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" cols="30" rows="5">${noticeDto.NContent}</textarea></td>
					</tr>
					<tr>
						<td>첨부 파일/이미지</td>
						<td>
							<input type="file" name="filename" /> 
						</td>
					</tr>
					<c:if test="${not empty noticeDto.NFilename}">
						<tr>
							<td><input type="hidden" name="oldFilename" value="${noticeDto.NFilename}" /></td>
							<td>
								첨부 : ${noticeDto.NFilename}<br/> 
								<img src="resources/storage/notice/${noticeDto.NFilename}" alt="${noticeDto.NFilename}" />
							</td>
						</tr>			
					</c:if> 
					
				</tbody>
			</table>
			<div class="button-list">
				<button class="noticeUpBtn">수정 하기</button>
				<input type="button" value="뒤로가기" id="backBtn" onclick="fn_goBack()"/>
				<input type="hidden" name="no" value="${noticeDto.NNo}" />
			</div>
		</form>
	</div>
</div>

<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>