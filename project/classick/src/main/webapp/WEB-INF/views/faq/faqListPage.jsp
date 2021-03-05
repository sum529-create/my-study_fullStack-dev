<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - FaqList" name="title"/>
</jsp:include>

<style>
	.faxbox {
		border: 1px solid lightgray;
		width : 55%;
		margin-top: 50px;
		margin-left: 25%;
		border-collapse: collapse;
	}	
	.faqTitle {
		font-size: 20px;
		font-weight: 900;
		color: gray;
		display: inline-block;
		padding: 20px;
	}
	.viewTitle {
		display: inline-block;
		padding-left: 0px;
		padding-top: 5px;
		padding-bottom : 10px;
		text-decoration: none;
		color: black;
		font-size: 10px;
		vertical-align: middle;
	}
	.faqview {
		border-top: 1px solid lightgray;
		padding-left: 15px;
		list-style-type: disc;
		list-style-position: inside;
	}
	
	.paging {
		text-align: center;
	}
	.InsertBtn {
		width: 55%;	
		margin: auto;
		text-align: center;
	}
	.InsertBtn {
		text-decoration: none;
	}
	#InsertBtn {
		margin-top: 20px;
		width: 100px;
		height: 30px;
		border: 1px solid gray;
		font-size: 12px;
		font-weight: 900;
	}
	.paging > tr > td {
		border-top: 1px solid lightgray;
	}
</style>

<table class="faxbox" border="1">
	<thead>
		<tr>
			<td><span class="faqTitle">자주 묻는 질문</span></td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td>작성된 사항이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="faqDto" items="${list}">
				<tr>
					<td>
						<ul class="faqview">
							<li>
								<a href="faqViewPage.do?FNo=${faqDto.FNo}" class="viewTitle">${faqDto.FTitle}</a>
							</li>
						</ul>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
	<tfoot class="paging">
		<tr>
			<td>
				<a href="faqListPage.do?page=2">${paging}</a>
			</td>
		</tr>
	</tfoot>
</table>
<div class="InsertBtn">
	
	<!-- hidden -->
	<input type="hidden" name="FWriter" value="${faqDto.FWriter}" />
	
	<c:if test="${loginDto.role eq 'ADMIN'}">
		<input type="button" name="InsertBtn" id="InsertBtn" value="FAQ 작성하기" onclick="location.href='faqInsertPage.do'" />
	</c:if>
	
</div>




<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>