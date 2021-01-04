<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원탈퇴페이지" name="title" />
</jsp:include>

<script>
	
	$(function(){
		$('#signOutBtn').click(fn_signOut);
	});
	
	function fn_signOut() {
		if(confirm('정말 탈퇴하시겠습니까?')){
			$.ajax({
				url : '/MyHome/SignOut',
				type: 'post',
				data: $('#f').serialize(),
				dataType: 'json',
				success: function(responseObj) {
					if(responseObj.result){
						
						alert('탈퇴되었습니다. 이용해 주셔서 감사합니다.');
						location.href='/MyHome/index.member';
					}else{
						alert('탈퇴되지 않았습니다. 회원 정보를 확인해 주세요.');
					}
				},
				error: function() {
					alert('실패');
				}
			
			});
		}
	}
	
	
</script>

<form id="f">

	<h1>회원을 탈퇴하면 아래 아이디는 더 이상 사용할 수 없습니다.</h1>

	아이디<br/>
	${loginDto.mId}<br/><br/>

	성명<br/>
	${loginDto.mName}<br/><br/>
	
	가입일<br/>
	${loginDto.mRegDate}<br/><br/>
	
	
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" value="${loginDto.mNo}" />
	
	<input type="button" value="회원탈퇴하기" id="signOutBtn" />
	<input type="button" value="되돌아가기" onclick="location.href='/MyHome/index.member'"/>
	
</form>
<%@ include file="../template/footer.jsp" %>