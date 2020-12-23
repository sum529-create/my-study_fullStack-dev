<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

<form>

	아이디<br/>
	${loginDto.mId}<br/><br/>
	
	현재 비밀번호<br/>
	<input type="password" name="mPw0" /><br/><br/>
	
	비밀번호 변경<br/>
	<input type="password" name="mPw" /><br/><br/>
	
	비밀번호 확인<br/>
	<input type="password" name="mPw2" />
	<input type="button" value="비밀번호 변경" id="updatePwBtn"/><br/><br/>
	
	성명<br/>
	<input type="text" name="mName" value="${loginDto.mName}" /><br/><br/>
	
	이메일<br/>
	<input type="text" name="mEmail" value="${loginDto.mEmail}" /><br/><br/>
	
	전화번호<br/>
	<input type="text" name="mPhone" value="${loginDto.mPhone}" /><br/><br/>
	
	주소<br/>
	<input type="text" name="mAddress" value="${loginDto.mAddress}" /><br/><br/>
	
	가입일<br/>
	${loginDto.mRegDate}<br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" value="${loginDto.mNo}" />
	<input type="hidden" name="mId" value="${loginDto.mId}" />
	<input type="hidden" name="mRegDate" value="${loginDto.mRegDate}" />
	
	<input type="button" value="정보 수정하기" id="updateBtn" />
	
</form>
<%@ include file="../template/footer.jsp" %>