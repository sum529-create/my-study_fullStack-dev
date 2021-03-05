<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	 <div class="mypage-right">
	 <h1>주소(배송지) 관리페이지</h1>
	 <br/>
		<form>
			<table id="addr-table"> 
				<tbody>
					<tr> 
						<th>받는분 <span>*</span></th> 
						<td><input type="text" name="mName" value="${memberDto.MName }" /></td> 
					</tr> 
					<tr> 
						<th>전화번호 <span>*</span></th> 
						<td>
							<input type="text" name="mPhone" value="${memberDto.MPhone}" />
						</td> 
					</tr>
					<tr> 
						<th>주소</th> 
						<td> 
							<input type="text" name="mPno" class="zip_code" id="zipNo" readonly> 
							<button type="button" class="zip_code_btn btn" onclick="javascript:goPopup();">우편번호</button><br/> 
							<input type="text" name="mAddr" placeholder="기본 주소를 입력해 주세요" id="addr"><br/> 
							<input type="text" name="mLastAddr" placeholder="나머지 주소를 입력해 주세요" id="addrDetail">
						</td> 
					</tr>
				</tbody> 
				<tfoot>
					<tr>
						<td></td>
						<td>
							<input type="hidden" name="mNo" value="${memberDto.MNo}">
							<input type="button" class="btn" id="btn_addrUpdate" value="주소저장" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<script> 
		 	var goPopup = function(){
			var pop = window.open("jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); } 
		 	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){
		 		document.getElementById("zipNo").value = zipNo; document.getElementById("addr").value = roadAddrPart1;
		 		if(addrDetail.length>30){ 
		 			alert('상세주소가 너무 길어 다시 입력해야 합니다.');
		 			return; 
		 		}
		 		document.getElementById("addrDetail").value = addrDetail;
			} 
	 	</script>
	 	<script>
	 		$('document').ready(function(){
	 			addrUpdate();
	 		});
	 		function addrUpdate(){
	 			$('#btn_addrUpdate').click(function(){
	 				var mNo = $('input:hidden[name="mNo"]').val();
	 				var mPno= $('input:text[name="mPno"]').val();
	 				var mPhone= $('input:text[name="mPhone"]').val();
	 				var mAddr= $('input:text[name="mAddr"]').val();
	 				var mLastAddr= $('input:text[name="mLastAddr"]').val();
	 				var mName= $('input:text[name="mName"]').val();
	 				var sendObj = {
	 					"mNo" : mNo,
	 					"mPno" : mPno,
	 					"mName" : mName,
	 					"mAddr" : mAddr,
	 					"mLastAddr" : mLastAddr,
	 					"mPhone" : mPhone, 
	 				};
	 				$.ajax({
	 					url: 'addr',
	 					type: 'post',
	 					data: JSON.stringify(sendObj),
	 					contentType: 'application/json',
	 					dataType: 'json',
	 					success: function(responseObj) {
	 						if (responseObj.result == 1) {
	 							alert('배송지 정보가 수정되었습니다.');
	 							memberList();
	 						} else {
	 							alert('배송지 정보가 수정되지 않았습니다.');
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
</div>
</div>
<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>