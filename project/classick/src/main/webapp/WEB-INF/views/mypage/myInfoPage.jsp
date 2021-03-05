<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	<!-- 회원 정보 -->
	<!-- 이름 / 이메일(인증메일 발송) / 전화(인증번호 불가) / 성별 / 생일 -->
	<!-- ajax로 재구현 -->
	<div class="mypage-right">
	<h1>회원 정보 수정페이지</h1>
	<br/>
	 		<table>
	 		<tbody id="info-table">
	 			<tr>
		 			<th>이름</th>
		 			<td><input type="text" name="mName" value="${memberDto.MName}"></td>
		 		</tr>
		 		<tr>
		 			<th>이메일</th>
		 			<td><input type="text" name="mEmail" value="${memberDto.MEmail}"></td>
		 		</tr>
		 		<tr>
		 			<th>전화</th>
		 			<td><input type="text" name="mPhone" value="${memberDto.MPhone}"></td>
		 		</tr>
		 		<tr>
		 			<th>성별</th>
		 			<td>
		 				<c:if test="${empty memberDto.MGender }">
		 					<input type="radio" name="mGender" value="남" />남
		 					<input type="radio" name="mGender" value="여" />여
		 				</c:if>
		 				<c:if test="${not empty memberDto.MGender }">
		 					<c:if test="${memberDto.MGender == '남'}">
			 					<input type="radio" name="mGender" value="남" checked />남
			 					<input type="radio" name="mGender" value="여" />여
			 				</c:if>
			 				<c:if test="${memberDto.MGender == '여'}">
			 					<input type="radio" name="mGender" value="남" />남
			 					<input type="radio" name="mGender" value="여" checked />여
			 				</c:if>
		 				</c:if>
		 			</td>
		 		</tr>
		 		<tr>
		 			<th>생일</th>
		 			<td>
		 				<c:if test="${empty memberDto.MSno }">
		 					<input type="text" name="mSno" placeholder="2000-01-01">
		 				</c:if>
		 				<c:if test="${not empty memberDto.MSno }">
		 					<input type="text" name="mSno" value="${memberDto.MSno }">
		 				</c:if>
		 			</td>
		 		</tr>
	 		</tbody>
	 		<tfoot>
	 			<tr>
	 				<td class="myInfoFlex" colspan="2">
	 					<input type="hidden" name="mNo" value="${memberDto.MNo }">
	 					<form>
	 						<input type="button" class="btn" id="btn_update" value="회원정보수정"  />
		 					<input type="button" class="btn" value="탈퇴하기" onclick="fn_deleteInfo(this.form)" />
	 					</form>
	 				</td>
	 			</tr>
	 		</tfoot>
	 	</table>
	 </div>
	 	</div>
	 </div><!-- mypage-body-wrap -->
</div>
	 	<script>
	 		$('document').ready(function(){
	 			memberUpdate();
	 		});
	 		function memberUpdate(){
	 			$('#btn_update').click(function(){
	 				var mNo = $('input:hidden[name="mNo"]').val();
	 				var mSno= $('input:text[name="mSno"]').val();
	 				var mGender= $('input:radio[name="mGender"]:checked').val();
	 				var mPhone= $('input:text[name="mPhone"]').val();
	 				var mEmail= $('input:text[name="mEmail"]').val();
	 				var mName= $('input:text[name="mName"]').val();
	 				var sendObj = {
	 					"mNo" : mNo,
	 					"mSno" : mSno,
	 					"mName" : mName,
	 					"mEmail" : mEmail,
	 					"mGender" : mGender,
	 					"mPhone" : mPhone, 
	 				};
	 				$.ajax({
	 					url: 'member',
	 					type: 'post',
	 					data: JSON.stringify(sendObj),
	 					contentType: 'application/json',
	 					dataType: 'json',
	 					success: function(responseObj) {
	 						if (responseObj.result == 1) {
	 							alert('회원 정보가 수정되었습니다.');
	 							memberList();
	 						} else {
	 							alert('회원 정보 수정이 실패했습니다.');
	 						}
	 					},
	 					error: function(){
	 						alert('실패');
	 					}
	 				});
	 				
	 				
	 				
	 			});
	 		}
	 		function fn_deleteInfo(f){
	 			if(confirm('정말 탈퇴하시겠습니까?')){
		 			f.action='memberDelete.do';
		 			f.submit();
	 			}
	 		}
	 		/* function memberDelete(){
	 			$('#btn_delete').click(function (){
	 				var mNo = $('input:hidden[name="mNo"]').val();
	 				$.ajax({
	 					url: 'member/'+mNo,
	 					type: 'delete',
	 					dataType: 'json',
	 					success: function(responseObj) {
	 						if (responseObj.result == 1) {
	 							alert('탈퇴되었습니다.');
	 							location.href="memberListPage.do";
	 						} else {
	 							alert('탈퇴에 실패했습니다.');
	 						}
	 					},
	 					error: function(){
	 						alert('실패');
	 					}
	 				});
	 			});
	 		} */
	 	</script>

<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>