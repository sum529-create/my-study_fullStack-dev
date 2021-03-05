<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	 <div class="mypage-right">
	 	<div class="greeting">
	 		<h1>환영합니다 ${memberDto.MName}님</h1>
	 		<br/><br/>
	 	</div>
	 	<div class="sub-title">
	 		내 정보
	 	</div>
	 	
	 	<div class="info-list">
	 		<ul>
	 			<li>
	 				<label>적립포인트</label><br/>
	 				<a href="">${memberDto.MPoint }</a>
	 			</li>
	 			<li id="totalOrders">
	 				<label>주문한 상품 수</label><br/>
	 			</li>
	 			<li>
	 				<label>가입일</label><br/>
	 				<a href="">${memberDto.MRegDate}</a>
	 			</li>
	 		</ul>
	 	</div>
	 	
	 	<div class="mGrade-info">
	 		
	 		<h3>등급별 혜택 알아보기</h3>
	 	
	 		<div>
	 			<div>
		 			<i class="fas fa-medal fa-4x"></i>
	 			</div>
	 			<div>
	 				<ul>
	 					<li>작품 구매시 적립률</li>
	 					<li>0.5%</li>
	 					<li>등급조건</li>
	 					<li>10만원 미만 구매시</li>
	 				</ul>
	 			</div>
	 		</div>
	 		<div>
	 			<div>
		 			<i class="fas fa-medal fa-4x"></i>
	 			</div>
	 			<div>
	 				<ul>
	 					<li>작품 구매시 적립률</li>
	 					<li>1.5%</li>
	 					<li>등급조건</li>
	 					<li>10만원 이상 구매시</li>
	 				</ul>
	 			</div>
	 		</div>
	 		<div>
	 			<div>
			 		<i class="fas fa-medal fa-4x"></i>
	 			</div>
	 			<div>
	 				<ul>
	 					<li>작품 구매시 적립률</li>
	 					<li>3.0%</li>
	 					<li>등급조건</li>
	 					<li>30만원 이상 구매시</li>
	 				</ul>
	 			</div>
	 		</div>
	 	</div>
	 	
	 </div>
	 </div>
	 </div><!-- mypage-body-wrap -->
</div> <!-- /body-wrap -->
 
<script>
	$('body').ready(function(){
		getTotalOrder();
	});
	
	function getTotalOrder(){
		var mNo = ${memberDto.MNo};
		$.ajax({
			url: 'order/'+mNo,
			type: 'get',
			dataType: 'json',
			success:function(responseObj){
				$('#totalOrders').append('<a href="myOrdersPage.do?mNo=${memberDto.MNo}">'+responseObj.result+'</a>')
			},
			error:function(){
				alert('ajax실패');
			}
		});
		
	}
	
</script>


<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>