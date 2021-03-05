<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - 장바구니" name="title" />
</jsp:include>

<script type="text/javascript">

	$(function(){
		fn_loginCheck();
		fn_amountInputChanged();
		fn_checkboxEvent();
	});
	
	function fn_loginCheck(){
		var loginDto = '${loginDto}';
		if(loginDto == null || loginDto == ''){
			alert('로그인이 필요한 페이지입니다.');
			location.href = 'loginPage.do';
			return;
		}
	}
	
	function fn_cartDelete(cNo){
		
		$.ajax({
			url : 'cartDelete.do?cNo=' + cNo,
			type: 'post',
			dataType: 'text',
			success: function(responseText){
				console.log(responseText);
				if((responseText*1) > 0){
					console.log('삭제되었습니다.');
					location.reload();
				}
			},
			error : function(){
				alert('실패');
			}
		});
	}
	function fn_decrement(count1, count2){
		var target = $('.item-count-'+count1 + '.row-'+count2 + ' input[type=number]');
		var current_val = target.val() * 1;
		
		console.log(current_val);
		
		if(current_val == 1 || current_val < 1){
			target.val(1);
		} else{
			target.val(current_val-1);
		}
		fn_calPrice(count1);
	}

	function fn_increment(count1, count2){
		var target = $('.item-count-'+count1 + '.row-'+count2 + ' input[type=number]');
		var current_val = target.val() * 1;
		if(current_val == 999){
			target.val(999);
		} else{
			target.val(current_val+1);
		}
		fn_calPrice(count1);
	}
	
	function fn_calPrice(count1){
		var count = $(".item-count-"+count1 + " input[name=cAmount]").length;
		var totalPrice = 0;
		for(var i=0; i<count; i++){                          
			totalPrice += $(".item-count-"+count1 + " input[name=cAmount]").eq(i).val() * $(".item-count-"+count1 + " input[name=unitPrice]").eq(i).val();
			var dFree = $("#dCostBox-" + count1 + " input[name=dFree]").eq(0).val() * 1;
			if(dFree > totalPrice){
				var dCost = $("#dCostBox-"+count1 + " input[name=dCost]").eq(0).val() * 1;
				console.log('dCost:' +dCost);
				$('#dCostBox-'+ count1).empty();
				var str = '<span data-delivery-info="desc">' + dCost.toLocaleString() + '원<br/>' 
				str += '<span class="delivery-desc">' + dFree.toLocaleString() + '원 이상 구매 시 무료배송</span></span>';
				str += '<input type="hidden" name="dCost" value="' + dCost + '" />';
				str += '<input type="hidden" name="dFree" value="' + dFree + '" />';
				str += '<input type="hidden" name="rowDFree" value="' + dCost + '" />';
				$('#dCostBox-'+ count1).html(str);
			}else{
				$('#dCostBox-'+ count1).empty();
				var str = '<span data-delivery-info="desc">무료배송</span>';
				str += '<input type="hidden" name="dCost" value="' + dCost + '" />';
				str += '<input type="hidden" name="dFree" value="' + dFree + '" />';
				str += '<input type="hidden" name="rowDFree" value="0" />';
				$('#dCostBox-'+ count1).html(str);
			}
	    }
		
		var str = '<input type="hidden" name="rowPrice" value="' + totalPrice + '" />';
		str += totalPrice.toLocaleString() + '원';
		$('#itemTotalPrice-'+ count1).html(str);
		fn_calTotalPrice();
	}
	
	function fn_calTotalPrice(){
		var count1 = $("input[name=rowPrice]").length;
		var count2 = $("input[name=rowDFree]").length;
		var priceSum = 0;
		var totalPrice = 0;
		var totalDCost = 0;
		
		for (var i = 0; i < count1; i++) {
			totalPrice += $("input[name=rowPrice]").eq(i).val() * 1;
		}
		for (var i = 0; i < count2; i++) {
			totalDCost += $("input[name=rowDFree]").eq(i).val() * 1;
		}
		priceSum = totalPrice + totalDCost;
		
		$('#totalPrice-wrap').html(totalPrice.toLocaleString() + '<p>원</p>');
		$('#totalDCost-wrap').html(totalDCost.toLocaleString() + '<p>원</p>');
		var str = '<input type="hidden" name="totalPrice" value="'+ priceSum +'"/>';
		$('#priceSum-wrap').html(str + priceSum.toLocaleString() + '<p>원</p>');
		
	}
	
	function fn_amountInputChanged(){
		
		$(document).on('keyup', '#cAmountInput', function(){
			var targetDiv = $(this).parent().parent();
			var itemCount = ((targetDiv.attr('class')).split('item-count-')[1]).split('row-')[0] * 1;
			fn_calPrice(itemCount);
		});
	}
	
	function fn_checkboxEvent(){
		
		$(document).on('click', 'input[type=checkbox].bp', function(){
			var id = $(this).attr('id');
			var count = $('input[type=checkbox].bp').length;
			
			if(id == 'checkAll'){
				var isChecked = ($(this).is(":checked"));
				$('input[type=checkbox].bp').attr("checked", isChecked);
				
			}else{
				var isChecked = ($(this).is(":checked"));
				$('input[type=checkbox]#' + id).attr("checked", isChecked);
			}
			count = $('input[type=checkbox].bp:checked').length-1;

			$('em[data-ui=check-all-count]').text(parseInt(count/2));
			
		});
	}
	
	function fn_order(f){
		if(f.totalPrice.value == 0){
			alert('구매 할 제품을 선택해주세요!');
			return;
		}
		
		f.action = "orderInsertPage.do";
		f.submit(); 
	}

</script>


<div class="inner-w800" data-page="shoppingBag">
	<div class="title-style clf">
		<h2 class="txt fl">장바구니</h2>
		<ol class="page-location fr">
             <li class="active">
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
	<%-- 
	${cListDtoLists}
	--%>
	<form method="post"> 
<c:if test="${empty cListDtoLists}">
	<div class="banner-empty" style="width: 100%; margin-bottom: 40px">
        <span class="ico-blank">
        	<i class="idus-icon-logo-empty"></i>
        </span>
        <p>장바구니가 비었습니다.<br>작가님들의 다양한 작품을 담아보세요.</p>
        <a href="/classick/" class="btn btn-l btn-point">작품 구경하러 가기</a>
    </div>
</c:if>
<c:if test="${not empty cListDtoLists}">
	<c:set var="pNo" value="0"/>
	<c:set var="totalPrice" value="0"/>
	<c:set var="totalDCost" value="0"/>
	<c:forEach var="cartListDto" items="${cListDtoLists}" varStatus="k">
		<%-- 
		${cartListDto.OAddPrices}
		 --%>
			<c:set var="pNo" value="${cartListDto.PNo}"/>
		
			<div class="inner-w800">
				<table class="cartCard">
					<caption class="hidden">${cartListDto.AName} 작가님</caption>
					<colgroup>
		                <col width="125px">
		                <col width="*">
		            </colgroup>
					<thead>
						<tr>
							<th class="cart-card-head" colspan="2">
								<div>
									<input type="hidden" name="pPrice" value="${optionPrice}">
									<label> 
										<input class="bp" data-ui="check-linked" type="checkbox" id="itemCheck-${k.count}" checked="">
										<div class="txt-group">
											<b class="bold">${cartListDto.AName} 작가님</b>
										</div>
									</label>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="list-item">
							<td class="area-img" width="125">
				                <input class="bp" data-ui="check-linked" type="checkbox" id="itemCheck-${k.count}" checked="">
				                <c:set var="pImgList" value="${fn:split(cartListDto.PImage,'&')}"/>
				                <div class="img-bg" style="background-image: url(/classick/resources/storage/product/${pImgList[0]})"></div>
				            </td>
				            <td class="area-txt">
				                <div class="txt-group">
				                    <a class="bold" href="productViewPage.do?pNo=${cartListDto.PNo}" target="_blank">
				                        <label for="prd-name">${cartListDto.PName}</label>
				                    </a>
				                    <em class="light" style="color: #666; font-style: normal;">주문시 제작</em>
				                </div>
				            </td>
						</tr>
						
						<c:set var="itemPrice" value="0"/>
						<c:set var="oAddPrices" value="${fn:split(cartListDto.OAddPrices,'&')}"/>
						<c:set var="cNos" value="${fn:split(cartListDto.CNos,'&')}"/>
						<c:set var="sNos" value="${fn:split(cartListDto.SNos,'&')}"/>
						<c:set var="cAmounts" value="${fn:split(cartListDto.CAmounts,'&')}"/>
						<c:set var="cOptions" value="${fn:split(cartListDto.COptions,'&')}"/>
						<%-- 
						<c:set var="stocks" value="${fn:split(cartListDto.Stocks,';')}"/>
						--%>
						<c:forEach var="oAddPrice" items="${oAddPrices}" varStatus="j">
						<tr>
							<td colspan="2" class="flexible">
								<ul class="list-options">
									<li>
										<div class="table-layout">
											<div class="split">
												<span class="option-txt">${cOptions[j.index]}</span>
												<div class="input-number item-count-${k.count} row-${j.count}" data-ui="input-number" data-state="">
													<!-- input hidden area -->
													<input type="hidden" name="unitPrice" value="${oAddPrice + cartListDto.PPrice}">
													<input type="hidden" name="pNo" value="${cartListDto.PNo}">
													<input type="hidden" name="cNo" value="${cNos[j.index]}">
													<input type="hidden" name="sNo" value="${sNos[j.index]}">
													<input type="hidden" name="cOption" value="${cOptions[j.index]}">
													<input type="hidden" name="oAddPrice" value="${oAddPrice}">
													
													<input type="button" id="decrementBtn" data-type="decrement" value="-" onclick="fn_decrement(${k.count}, ${j.count})"/>
													<div class="input-area">
														<input class="prd-count" name="cAmount" id="cAmountInput" type="number" value="${cAmounts[j.index]}" min="1" max="999" autocomplete="off">
													</div>
													<input type="button" id="incrementBtn" data-type="increment" value="+" onclick="fn_increment(${k.count}, ${j.count})"/>
												</div>
											</div>
											<div class="split">
												<strong>
													<em class="cost-text">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${oAddPrice + cartListDto.PPrice}"/>원
														<c:set var="itemPrice" value="${itemPrice + (oAddPrice + cartListDto.PPrice)*cAmounts[j.index]}"/>
													</em>
												</strong>
												<span class="btn-group-one">
													<input id="ui_delete_btn" type="button" value="삭제" id="cartDeleteBtn" onclick="fn_cartDelete(${cNos[j.index]})"/>
												</span>
											</div>
										</div>
									</li>
								</ul>
							</td>
						</tr>
						</c:forEach>
						<tr class="static-row price-segment" data-state="active">
						    <th colspan="2">
						        <div class="wrapper">
						            <div class="title">작품 가격</div>
						            <div class="contents">
										<c:set var="totalPrice" value="${totalPrice + itemPrice}"/>
						                <span data-price-info="total" id="itemTotalPrice-${k.count}">
											<input type="hidden" name="rowPrice" value="${itemPrice}" />
						                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${itemPrice}"/>원
						                </span>
					                </div>
					            </div>
						    </th>
						</tr>
						<tr class="static-row delivery-segment">
						    <th class="delivery-charge-info" colspan="2">
						        <div class="wrapper">
						            <div class="title">배송비</div>
						            <div class="contents">
						            	<c:set var="partStr1" value="${fn:substringAfter(cartListDto.PASDesc,'배송비\":\"')}"/>
										<c:set var="dCost" value="${fn:substringBefore(partStr1,'\",\"')}"/>
										<c:set var="partStr2" value="${fn:substringAfter(cartListDto.PASDesc,'무료배송\":\"')}"/>
										<c:set var="dFree" value="${fn:substringBefore(partStr2,'\"')}"/>
										<div id="dCostBox-${k.count}">
											<input type="hidden" name="dCost" value="${dCost}">
											<input type="hidden" name="dFree" value="${dFree}">
											<c:if test="${dCost == 0 || itemPrice > dFree}">
												<span data-delivery-info="desc">무료배송</span>
												<input type="hidden" name="rowDFree" value="0">
											</c:if>
											<c:if test="${dCost > 0 && itemPrice < dFree}">
												<c:set var="totalDCost" value="${totalDCost + dCost}"/>
												<span data-delivery-info="desc">
													<input type="hidden" name="rowDFree" value="${dCost}">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${dCost}"/>원<br>
								            		<span class="delivery-desc">
								            		<fmt:formatNumber type="number" maxFractionDigits="3" value="${dFree}"/>원 이상 구매 시 무료배송
								            		</span>
								            	</span>
											</c:if>
										</div>
						        	</div>
							    </div>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
	</c:forEach>
		<div class="scroll-detector-desktop" data-ui="sticky" data-state="disabled">
		    <div class="mobile-row inner-w800 dfixed">
		        <!-- Desktop 플로팅 선택 영역 -->
		        <div class="check-control mobile-hide">
		            <label>
		                <input class="bp" type="checkbox" data-ui="check-all" id="checkAll" checked="">
		                <span>
		                    전체선택 (<em data-ui="check-all-count">${listSize}</em>/<em class="check-count-total">${listSize}</em>)
		                </span>
		            </label>
		            <%--
		            <input class="ui_btn--mini" type="button" data-action="delete_checked_list" data-endpoint="/w/cart/delete" value="선택 삭제"/>
		             --%>
		        </div>
		        <div class="scroll-detector mfixed" data-ui="sticky" data-state="active">
		            <div class="fixed-section">
		                <div class="product-cart-total-cost-box">
		                	
		                    <div class="border-wrapper price-display-box">
		                        <table class="table-cost inline-float">
		                            <thead>
		                                <tr>
		                                    <th>
		                                        <span >작품금액</span>
		                                    </th>
		                                    <th class="">
		                                        <span >배송비</span>
		                                    </th>
		                                    <th>
		                                        <span >결제 예정금액</span>
		                                    </th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <td>
		                                        <strong class="mobile-title">작품 금액</strong>
		                                        <strong id="totalPrice-wrap">
		                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice > 0? totalPrice: 0}"/>
		                                            <p>원</p>
		                                        </strong>
		                                    </td>
		                                    <td class="">
		                                        <span >+</span>
		                                        <strong class="mobile-title">배송비</strong>
		                                        <div class="cart-delivery-price-label" >
		                                            <strong id="totalDCost-wrap">
		                                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalDCost != null ? totalDCost: 0}"/>
		                                                <p>원</p>
		                                            </strong>
		                                        </div>
		                                    </td>
		                                    <td class="hilight red">
		                                        <span >=</span>
		                                        <strong id="priceSum-wrap">
		                                        	<input type="hidden" name="totalPrice" value="${totalPrice + totalDCost}" />
		                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice + totalDCost}"/>
		                                            <p>원</p>
		                                        </strong>
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		                <fieldset class="area-btn full">
		                    <input type="button" class="ui_btn--red--large submit" data-type="payment" data-ui="price-total-btn" value="주문하기" onclick="fn_order(this.form)"/>
		                </fieldset>
		            </div>
		        </div>
		    </div>
		</div>
</c:if>
	</form>
</div>



	<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>