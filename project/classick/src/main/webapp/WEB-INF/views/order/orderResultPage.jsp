<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick | 주문 완료" name="title" />
</jsp:include>

<script type="text/javascript">

	$(function(){
		//fn_loginCheck();
	});
	
	function fn_loginCheck(){
		var loginDto = '${loginDto}';
		if(loginDto == null || loginDto == ''){
			alert('로그인이 필요한 페이지입니다.');
			location.href = 'loginPage.do';
			return;
		}
	}

</script>

<c:if test="${result > 0}">
	<div class="inner-w800" data-page="payment">
		<div class="title-style clf">
			<h2 class="txt fl">주문 완료</h2>
			<ol class="page-location fr">
	             <li>
	                 <span>1. 장바구니</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li>
	                 <span>2. 주문결제</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li class="active">
	                 <span>3. 주문완료</span>
	             </li>
	         </ol>
		</div>
		
		<div class="banner-empty" style="width: 100%; margin-bottom: 40px">
	        <span class="ico-blank">
	        	<i class="idus-icon-logo-empty"></i>
	        </span>
	        <p>감사합니다! 주문이 완료 되었습니다!</p>
	        <a href="index.do" class="btn btn-l btn-point">주문내역 확인하러 가기</a>
<!-- 	        <a href="orderListPage.do" class="btn btn-l btn-point">주문내역 확인하러 가기</a> -->
	    </div>
	</div>
</c:if>
<c:if test="${result == 0}">
	<div class="inner-w800" data-page="payment">
		<div class="title-style clf">
			<h2 class="txt fl">주문 실패</h2>
			<ol class="page-location fr">
	             <li>
	                 <span>1. 장바구니</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li>
	                 <span>2. 주문결제</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li>
	                 <span>3. 주문완료</span>
	             </li>
	         </ol>
		</div>
		
		<div class="banner-empty" style="width: 100%; margin-bottom: 40px">
	        <span class="ico-blank">
	        	<i class="idus-icon-logo-empty"></i>
	        </span>
	        <p>죄송합니다! 주문이 실패했습니다. 다시 시도해주세요!</p>
	        <a href="cartListPage.do" class="btn btn-l btn-point">장바구니 가기</a>
	    </div>
	</div>
</c:if>

	<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>