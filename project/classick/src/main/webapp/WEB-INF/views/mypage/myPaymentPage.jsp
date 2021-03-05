<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	 <div class="mypage-right">
	 <h1>결제 방법 관리페이지</h1>
	 	<form>
	 		<select name="mPayment">
				<option value="kakao">카카오페이</option>
				<option value="naver">네이버페이</option>
				<option value="credit">신용카드</option>
			</select>
			<input type="hidden" value="${memberDto.MNo}" name="mNo" />
			<input type="button" class="btn" value="결제방법저장" id="btn_mPayment" />
	 	</form>
	 	<script>
		 	$('document').ready(function(){
	 			paymentUpdate();
	 		});
		 	function paymentUpdate(){
	 			$('#btn_mPayment').click(function(){
	 				var mNo = $('input:hidden[name="mNo"]').val();
	 				var mPayment= $('select[name="mPayment"]').val();
	 				var sendObj = {
	 					"mNo" : mNo,
	 					"mPayment" : mPayment
	 				};
	 				$.ajax({
	 					url: 'payment',
	 					type: 'put',
	 					data: JSON.stringify(sendObj),
	 					contentType: 'application/json',
	 					dataType: 'json',
	 					success: function(responseObj) {
	 						if (responseObj.result == 1) {
	 							alert('결제 수단이 등록되었습니다.');
	 						} else {
	 							alert('결제수단 등록에 실패했습니다.');
	 						}
	 					},
	 					error: function(){
	 						alert('실패');
	 					}
	 				});
	 			});
	 		}
	 	</script>
	 </div>
	 </div>
	 </div><!-- mypage-body-wrap -->
</div>
	<!-- 신용카드 API 사용불가로 인하여 어떤 결제 방법을 사용할 것인지만 선택가능 -->
	<!-- 네이버페이 / 카카오페이 / 신용카드 등 선택만할 수 있게 설정 -->
	<!-- 선택 시 DB에 저장해둠 -->
<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>