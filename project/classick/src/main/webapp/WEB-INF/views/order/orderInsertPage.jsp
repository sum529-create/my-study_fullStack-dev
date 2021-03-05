<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick | 주문 결제하기" name="title" />
</jsp:include>

<script type="text/javascript">

	$(function(){
		//fn_loginCheck();
		fn_orderDetail();
		fn_userDetail();
		fn_agreementDetail();
		fn_radioCheck();
		
		
	});
	
	function fn_loginCheck(){
		var loginDto = '${loginDto}';
		if(loginDto == null || loginDto == ''){
			alert('로그인이 필요한 페이지입니다.');
			location.href = 'loginPage.do';
			return;
		}
	}
	
	function fn_order(f){
		if(f.totalPrice.value == 0){
			alert('구매 할 제품을 선택해주세요!');
			return;
		}
		
		f.action = "orderInsertPage.do";
		f.submit(); 
	}
	
	function fn_userDetail(){
		$('#userDetailHeader').click(function(){
			var status = $('#iconBox-1').attr('class');
			if(status == 'icon-up'){
				$('#iconBox-1').html('<i class="fas fa-chevron-down"></i>');
				$('#iconBox-1').attr('class','icon-down');
				$('#userDetailBody').css('display','block');
			}else{
				$('#iconBox-1').html('<i class="fas fa-chevron-up"></i>');
				$('#iconBox-1').attr('class','icon-up');
				$('#userDetailBody').css('display','none');
			}
			console.log('status: ' + status);
		})
	}
	
	function fn_orderDetail(){
		$('#orderDetailHeader').click(function(){
			var status = $('#iconBox-2').attr('class');
			if(status == 'icon-up'){
				$('#iconBox-2').html('<i class="fas fa-chevron-down"></i>');
				$('#iconBox-2').attr('class','icon-down');
				$('#orderDetailBody').css('display','block');
			}else{
				$('#iconBox-2').html('<i class="fas fa-chevron-up"></i>');
				$('#iconBox-2').attr('class','icon-up');
				$('#orderDetailBody').css('display','none');
			}
			console.log('status: ' + status);
		})
	}

	function fn_agreementDetail(){
		$('#agreementHeader').click(function(){
			var status = $('#iconBox-3').attr('class');
			if(status == 'icon-up'){
				$('#iconBox-3').html('<i class="fas fa-chevron-down"></i>');
				$('#iconBox-3').attr('class','icon-down');
				$('#agreementBody').css('display','block');
			}else{
				$('#iconBox-3').html('<i class="fas fa-chevron-up"></i>');
				$('#iconBox-3').attr('class','icon-up');
				$('#agreementBody').css('display','none');
			}
			console.log('status: ' + status);
		})
	}
	
	function fn_radioCheck(){
		
		$('input[type=radio]').click(function(){
			var checked1 = $('#cardRadio').prop('checked'); 
			var checked2 = $('#cardRadio2').prop('checked'); 
			var checked3 = $('#nPayRadio').prop('checked'); 
			var checked4 = $('#bankRadio').prop('checked'); 
			var checked5 = $('#phoneRadio').prop('checked'); 
			var checked6 = $('#tossRadio').prop('checked'); 
			
			if(checked1){
				$('.card').css('display','block');
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="간편하게 카드 결제"/>간편하게 카드 결제');
			}else{
				$('.card').css('display','none');
			}

			if(checked2){
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="복잡하게 카드 결제"/>복잡하게 카드 결제');
			}

			if(checked3){
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="계좌이체/무통장입금"/>네이버 페이');
			}
			
			if(checked4){
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="계좌이체/무통장입금"/>계좌이체/무통장입금');
			}else{
				$('.vbank').css('display','none');
			}
			
			if(checked5){
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="휴대폰 결제"/>휴대폰 결제');
			}
			
			if(checked6){
				$('#paymentMethod').html('<input type="hidden" name="oPayment" value="토스"/>토스');
			}
			
		});
		
	}
	
	$(function(){
		$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       var width = $(window).width(); // @media width
		       if(width >= 720){		    	   
	    		   console.log(num);
		    	   if(num > 50){  // 스크롤을 60이상 했을 때
			          $("#right-section").css("position","fixed").css("top","60px").css("left","52%");
			       }else{
			          $("#right-section").css("position","absolute").css("top","0px").css("left","55%");
			       }
		       }
		  });
	});
	

</script>

<form method="post" action="orderInsert.do">
	<div class="inner-w800" data-page="payment">
		<div class="title-style clf">
			<h2 class="txt fl">주문 결제하기</h2>
			<ol class="page-location fr">
	             <li>
	                 <span>1. 장바구니</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li class="active">
	                 <span>2. 주문결제</span>
	                 <i class="fa fa-angle-right"></i>
	             </li>
	             <li>
	                 <span>3. 주문완료</span>
	             </li>
	         </ol>
		</div>
		<%-- 
		${cListDtoLists} ${memberDto}
		--%>
		
		
		<div class="layout-split" data-layout-split="payment">
			<section data-ui="toggle-tab">
				<!-- 주문고객 정보 -->
				<div class="segment--nospacing">
					<div class="ui_title--sub tab active" data-ui-id="order_user">
						<span class="ui_title__txt">주문고객</span> 
						<span class="ui_title__txtright--blue user-info-header-right-text" id="userDetailHeader">
							${memberDto.MName}(${memberDto.MPhone})
							<span id="iconBox-1" class="icon-up">
								<i class="fas fa-chevron-up"></i>
							</span>
						</span>
					</div>
					<div class="payment-contents" id="userDetailBody" style="display: none;">
						<table class="table-style-clear orderer-info" data-ui="tab-panel"
							data-panel-id="order_user" style="display: table;">
							<colgroup>
								<col width="90px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>주문자 정보</th>
									<td>${memberDto.MName}</td>
								</tr>
								<tr>
									<th><em class="asterisk red">∗</em> <label>전화번호</label></th>
									<td>
										<div class="body">
											<input type="text" name="cell_phone" class="phonenumber" data-auth="current-phone" readonly="" required="" value="${memberDto.MPhone}">
											<!-- <input type="button" class="ui_btn--small" data-modal-url="/w/me/cellphone" data-modal-id="phonenumber"
												data-modal-type="post" data-modal-trigger="modal-link" value="변경하기"/> -->
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td style="color: #999">주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="segment--nospacing">
					<div class="ui_title--sub">
						<span class="ui_title__txt">주소 (배송지)</span>
					</div>
					<div class="payment-contents">
						<div class="address-section" data-address="root">
							<div class="address-info root">
								<div class="address-info item">
									<div class="address-info head">
										<em class="asterisk red">∗</em> <label for="receiver">받는
											분</label>
									</div>
									<div class="address-info body">
										<div class="input-text">
											<input data-address="delivery_name" name="delivery_name" value="${memberDto.MName}" type="text" placeholder="" required="" autocomplete="off">
										</div>
									</div>
								</div>

								<div class="address-info item">
									<div class="address-info head">
										<em class="asterisk red">∗</em> <label for="receiver">전화번호</label>
									</div>
									<div class="address-info body">
										<div class="input-text">
											<input data-address="delivery_phone" data-phone-type="none"
												value="${memberDto.MPhone}" name="delivery_phone" type="text" required=""
												autocomplete="off">
										</div>
									</div>
								</div>

								<div class="address-info item">
									<div class="address-info head">
										<em class="asterisk red">∗</em> <label for="receiver">주소</label>
									</div>
									<div class="address-info body">
										<div class="address-ui root">
											<div class="address-ui address">
												<div class="address-ui row">
													<div class="input-text address-zip-code">
														<input data-address="delivery_zipcode" type="text"
															name="delivery_zipcode" value="${memberDto.MPno}" placeholder="우편번호"
															required="" autocomplete="off" readonly="">
													</div>
													<button data-address="open" class="btn btn-m btn-white"
														type="button">주소 찾기</button>

													<!-- 다음주소 layer -->
													<div class="daum-post-layer"
														style="display: none; position: relative; width: auto; margin-top: 10px; overflow: auto; -webkit-overflow-scrolling: touch;">
														<img
															src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
															id="btnCloseLayer"
															style="cursor: pointer; position: absolute; right: 0; top: 0; z-index: 1"
															alt="닫기 버튼">
													</div>
												</div>

												<div class="address-ui row">
													<div class="input-text address-address">
														<input data-address="delivery_address1" type="text"
															name="delivery_address1" value="${memberDto.MAddr}" placeholder="기본 주소"
															required="" autocomplete="off" readonly="">
													</div>
												</div>
												<div class="address-ui row">
													<div class="input-text address-address2">
														<input data-address="delivery_address2" type="text"
															name="delivery_address2" value="${memberDto.MLastAddr}" autocomplete="off"
															placeholder="나머지 주소">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- hidden area -->
							<input type="hidden" name="mNo" value="${memberDto.MNo}"/>
							<input type="hidden" name="oAddr" value="${memberDto.MPno}&${memberDto.MAddr}&${memberDto.MLastAddr}"/>
							<input type="hidden" name="oPhone" value="${memberDto.MPhone}"/>
							
							<div class="extra-row">
								<label> 
									<!-- <input id="safe-phone" type="checkbox" name="is_safe_phone" class="bp" checked=""> 1회용 안심번호 사용 -->
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="segment--nospacing" data-ui="order-summary-label">
					<div class="ui_title--sub tab active" data-ui-id="order_cart">
						<span class="ui_title__txt">주문 작품 정보</span>
						<span class="ui_title__txtright" id="orderDetailHeader">
							<em class="hilight blue user-info-header-right-text">
								<span class="ellipsis">${cListDtoLists[0].PName}</span>
								<c:if test="${listSize > 1}">
									<em> 외 ${listSize}건</em>
								</c:if>
							</em>
							<span id="iconBox-2" class="icon-up">
								<i class="fas fa-chevron-up"></i>
							</span>
							<!-- <i class="fas fa-chevron-up"></i> -->
						</span>
					</div>
					<div id="orderDetailBody" data-ui="tab-panel" data-panel-id="order_cart" style="display: none;">
				<c:if test="${not empty cListDtoLists}">
					<c:set var="totalPrice" value="0"/>
					<c:set var="totalDCost" value="0"/>
					<c:forEach var="cartListDto" items="${cListDtoLists}" varStatus="k">
						<table class="paymentCard" data-ui="cart-card">
							<caption class="hidden">${cartListDto.PName}</caption>
							<colgroup>
								<col width="120px">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2" style="padding: 20px 0">
										<div class="txt-group">
											<span class="artist-name">${cartListDto.AName} 작가님</span>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr class="list-item" data-status="1">
				
									<td class="area-img" style="padding-top: 24px;">
										<c:set var="pImgList" value="${fn:split(cartListDto.PImage,'&')}"/>
					                	<div class="img-bg" style="background-image: url(/classick/resources/storage/product/${pImgList[0]})"></div>
									</td>
				
									<td class="area-txt">
										<div class="txt-group">
											<input type="hidden" name="product_order_price" disabled="" value="">
											<label class="title-txt bold" for="prd-name">${cartListDto.PName}</label>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="flexible" style="padding: 16px 18px;">
										<ul class="list-options">
										<c:set var="itemPrice" value="0"/>
										<c:set var="oAddPrices" value="${fn:split(cartListDto.OAddPrices,'&')}"/>
										<c:set var="cNos" value="${fn:split(cartListDto.CNos,'&')}"/>
										<c:set var="sNos" value="${fn:split(cartListDto.SNos,'&')}"/>
										<c:set var="cAmounts" value="${fn:split(cartListDto.CAmounts,'&')}"/>
										<c:set var="cOptions" value="${fn:split(cartListDto.COptions,'&')}"/>
										<c:forEach var="oAddPrice" items="${oAddPrices}" varStatus="j">
											<li>
												<input type="hidden" name="option_price" value="${oAddPrice + cartListDto.PPrice}" disabled="">
												<div class="table-layout">
													<div class="split">
														<span class="option-txt">
															<ul class="item-option-list">
																<li>${cOptions[j.index]}</li>
																<li>
																	<label>수량 :
																		<input class="prd-count" type="hidden" value="${cAmounts[j.index]}" readonly="" style="width: 9px">
																		${cAmounts[j.index]}개
																	</label>
																</li>
															</ul>
														</span>
													</div>
													
													
													<div class="split">
														<strong style="color: #333;">
															<em class="cost-text">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${oAddPrice + cartListDto.PPrice}"/>
															</em>원
															<c:set var="itemPrice" value="${itemPrice + (oAddPrice + cartListDto.PPrice)*cAmounts[j.index]}"/>
															<c:set var="totalPrice" value="${totalPrice + itemPrice}"/>
														</strong>
													</div>
												</div>
											</li>
											<!-- hidden Area -->
											<input type="hidden" name="pNo" value="${cartListDto.PNo}"/>
											<input type="hidden" name="cNo" value="${cNos[j.index]}"/>
											<input type="hidden" name="oAmount" value="${cAmounts[j.index]}"/>
											<input type="hidden" name="oOption" value="${cOptions[j.index]}"/>
											<input type="hidden" name="itemPrice" value="${(oAddPrice + cartListDto.PPrice)*cAmounts[j.index]}"/>
										</c:forEach>
										</ul>
									</td>
								</tr>
				
								<tr class="static-row">
							
									<th>배송비</th>
									<td>
										<c:set var="partStr1" value="${fn:substringAfter(cartListDto.PASDesc,'배송비\":\"')}"/>
										<c:set var="dCost" value="${fn:substringBefore(partStr1,'\",\"')}"/>
										<c:set var="partStr2" value="${fn:substringAfter(cartListDto.PASDesc,'무료배송\":\"')}"/>
										<c:set var="dFree" value="${fn:substringBefore(partStr2,'\",\"')}"/>
										
										<input type="hidden" name="dCost" value="${dCost}">
										<input type="hidden" name="dFree" value="${dFree}">
										<c:if test="${dCost == 0 || itemPrice > dFree}">
											<input type="hidden" name="rowDFree" value="0">
											<input type="text" name="shipping_price" data-unformated="0" value="무료" readonly="" disabled="">
										</c:if>
										<c:if test="${dCost > 0 && itemPrice < dFree}">
											<c:set var="totalDCost" value="${totalDCost + dCost}"/>
											<span data-delivery-info="desc">
												<input type="hidden" name="rowDFree" value="${dCost}">
												<input type="text" name="shipping_price" data-unformated="0" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${dCost}"/>원" readonly="" disabled="">
								           	</span>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:if>
					</div>
				</div>
				<div class="segment--nospacing">
					<div class="ui_title--sub" style="padding-bottom: 0;">
						<span class="ui_title__txt">결제 수단</span>
					</div>
					<div class="payment-contents">
						<div class="radiogroup" data-payment-type-btn="root">
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" data-payment-type-btn="simple" value="BILL" type="radio" checked required="" id="cardRadio">
									<div class="txt-group">
										<span data-label="paymentbtn">간편하게 카드 결제</span>
										<em>결제시 작품 금액의 0.5%가 적립</em>
									</div>
								</div>
								<div data-payment-type-target="BILL" class="payment-type card" style="display: block;">
									<div class="payment-type card-list">
										<a href="" data-modal-url="/w/me/bill" data-modal-type="post" data-modal-id="add-card" data-modal-trigger="modal-link" class="creditcard-add-btn">
											<i class="fa fa-plus fa-2x"></i> 
											<p data-v-1d9d4244="">간편하게 신용카드 등록하고<br/>
												1초만에 결제하세요!
											</p>
										</a>
									</div>
								</div>
							</label>
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" value="CARD" type="radio" required="" id="cardRadio2">
									<span data-label="paymentbtn">복잡하게 카드 결제</span>
								</div>
							</label>
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" value="NAVER" type="radio" required="" id="nPayRadio">
									<span data-label="paymentbtn" class="img_label">
										<img src="/classick/assets/image/product/icon_payment_npay.png">
									</span>
								</div>
								<span class="hidden" data-label="paymentbtn">네이버페이</span>
							</label>
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" value="VBANK" type="radio" required="" id="bankRadio">
									<span data-label="paymentbtn">계좌이체/무통장입금</span>
								</div>
								<div data-payment-type-target="VBANK" class="payment-type vbank" style="display: none;">
									<label>
										<input type="checkbox" class="bp" name="is_escrow" value="1">
										<span class="va-m">
											에스크로
										</span>
									</label>
								</div>
							</label>
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" value="CELLPHONE" type="radio" required="" id="phoneRadio">
									<span data-label="paymentbtn">휴대폰 결제</span>
								</div>
							</label>
							<label class="radio-item">
								<div class="payment-radio-item-wrapper">
									<input class="idus-icon-radio" name="how_to_pay" value="TOSS" type="radio" required="" id="tossRadio">
									<span data-label="paymentbtn" class="img_label">
										<img src="/classick/assets/image/product/icon_payment_toss_default.png">
									</span>
								</div>
								<span class="hidden" data-label="paymentbtn">토스</span>
							</label>
						</div>
					</div>
				</div>
			</section>
			<section id="right-section">
				<div class="final-cost ui_sticky" data-ui="sticky" style="">
					<h3 class="table-header">결제 정보</h3>
					<div class="segment" data-ui="paymentData-view">
						<table>
							<tbody>
								<tr>
									<th>작품금액</th>
									<td>
										<span data-payment="order"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}"/></span>원
									</td>
								</tr>
								<tr>
									<th>배송비</th>
									<td>
										<span data-payment="shipping"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalDCost}"/></span>원
									</td>
								</tr>
								<tr>
									<th>작가님 할인 혜택</th>
									<td>
										<span data-payment="discount">0</span>원
									</td>
								</tr>
								<tr data-payment="remote-tr">
									<th>제주 / 도서산간 추가비용</th>
									<td>
										<span name="remote" data-payment="remote">0</span>원
									</td>
								</tr>
								<!-- 분기처리 -->
								<tr>
									<th>Classick 할인 혜택</th>
									<td>
										<span data-payment="membership">0</span>원
									</td>
								</tr>
							</tbody>
						</table>
						<table class="spacing">
							<tbody>
								<tr class="total">
									<th>최종 결제 금액</th>
									<td class="hilight">
										<span data-payment="total"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice + totalDCost}"/></span><em>원</em>
									</td>
								</tr>
								<!-- <tr style="">
									<th colspan="2">
										<label class="bg-style--warning">
											<input id="support" type="checkbox" name="is_support" autocomplete="off" class="bp">
											작가님을 후원합니다.
										</label>
										<span class="hidden" data-payment="support">0</span>
									</th>
								</tr> -->
							</tbody>
						</table>
					</div>
				
					<div class="segment-group" data-ui="toggle-tab">
						<div class="segment--nospacing">
							<div class="ui_title--sub tab" data-ui-id="info_personal1">
								<label>
									<input type="checkbox" name="privacy_info" autocomplete="off" required="required" class="bp">
									<i class="asterisk red">∗</i>
									개인정보 제공 동의
								</label>
								<span class="checkout-toggle-btn" id="agreementHeader">더 보기
									<span id="iconBox-3" class="icon-up">
										<i class="fas fa-chevron-up btn_icon"></i>
									</span>
								</span>
							</div>
							<div class="scroll-txt" id="agreementBody" data-ui="tab-panel" data-panel-id="info_personal1" style="display: none">
								‣ 제공받는 자 : ${cListDtoLists[0].AName}<br>
								‣ 목적 : 판매자와 구매자 사이의 원활한 거래 진행, 상품의 배송을 위한 배송지 확인, 고객상담 및 불만처리 등<br>
								‣ 정보 : 별명, 이름, 전화, 주소<br>
								‣ 보유기간 : 발송완료 후 15일<br>
								<br>
								Classick는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 Classick는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
							</div>
						</div>
				
						<div class="segment--nospacing scroll-detector" data-ui="sticky" data-state="active" style="">
							<div class="mfixed">
								<button id="btn-submit" class="ui_btn--red--large" data-ui="btn-label">
									<span data-label="total">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice + totalDCost}"/>원
										<input type="hidden" name="totalPrice" value="${totalPrice + totalDCost}"/>
									</span>
									<span data-label="type" id="paymentMethod">
										<input type="hidden" name="oPayment" value="간편하게  카드결제"/>
										간편하게 카드 결제
									</span>
									<fmt:parseNumber var="total" value="${(totalPrice + totalDCost)/100}" integerOnly="true" /> 
									<p class="point" data-label="point" style="display: block;">예상적립금 : <em style="font-style: normal;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/></em>P</p>
								</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</form>



	<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>