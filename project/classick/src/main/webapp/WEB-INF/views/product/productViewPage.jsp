<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="${productArtistDto.PName}" name="title" />
</jsp:include>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/product.css" />

<script type="text/javascript">
	
    var count = 0;
    var selectOptionList = [];
    var totalPrice = 0;
    
	$(function(){
		fn_selectOption();
		fn_addCart();
		//fn_buy();
	});
	
	function fn_selectOption(){
		$('#optSelector').change(function(){
			var selectOption = $('#optSelector').val();
			if(selectOption != null){
				
				var selectOptionText = $('#optSelector option:checked').text();
				var selectOptionPrice = (selectOptionText.split('(+')[1].split('원)')[0]) * 1;
				selectOptionPrice += ${productArtistDto.PPrice} * 1;
				
				if(selectOptionList.includes(selectOptionText)){
					var idx = selectOptionList.indexOf(selectOptionText) + 1;
					var currentValue = $('#option-row-'+ idx + ' input[type=number]').val() * 1;
					$('#option-row-'+ idx + ' input[type=number]').val(currentValue+1);
					
				}else{
					selectOptionList.push(selectOptionText);
						
					count++;
					$('<div>',{class:'option_card', id: 'option-row-' + count})
					.append($('<p>', {id:'option-content-' + count}).append(selectOptionText))
					.append($('<input>', {name:'option-sNo', type:'hidden', value: selectOption}))
					.append($('<input>', {name:'option-content', type:'hidden', value: selectOptionText}))
					.append($('<div>',{class:'option_card__aligner'}).append($('<p>', {style:'display: inline;'}).text("수량 : "))
					.append($('<div>',{class:'option_card__counter'})
					.append($('<input/>', {type: 'number', name: 'option-amount', min: '1', value: '1', id: 'countInput', style: 'width: 30%;text-align: center;border-radius: 3px; font-size: 12px; border: 1px solid #d9d9d9;'})))
					.append($('<div>').append(($('<span/>')).append($('<b>', {id:'unit-price-' + count}).text(numberWithCommas(selectOptionPrice) + '원')))
					.append($('<p>', {id:'removeBtn_box' }).append(($('<i/>', {id: 'removeBtn' , class: 'fas fa-trash'}))))))
					.appendTo('.selected_options');				
				}
				$('#optSelector').val('');
				calTotalPrice(count);
			}
			
			
			console.log(selectOptionList);
		})
		
		$(document).on('change', '#countInput', function(){
			calTotalPrice(count);
		});
		
		$(document).on('click', '#removeBtn', function(){
			var targetDiv = $(this).parent().parent().parent().parent();
			var rowCount = (targetDiv.attr('id')).split('row-')[1] * 1;
			var targetOption = $('#option-content-'+(rowCount)).text();
			selectOptionList.splice(selectOptionList.indexOf(targetOption),1);
			
			if(rowCount < count){
				targetDiv.remove();
				for(var i=rowCount; i < rowCount+(count-rowCount); i++){
					$('#option-row-'+(i+1)).attr('id', 'option-row-'+i);
					$('#option-content-'+(i+1)).attr('id', 'option-content-'+i);
					count--;
				}
			}
			else if(rowCount == count){
				targetDiv.remove();
				count--;
			}
			
			calTotalPrice(count);
			
		});
	}
	
	function calTotalPrice(count){
		totalPrice = 0;
		for(var i=1; i<= count; i++){
			var unitPrice = ($('#unit-price-'+ i).text()).split('원')[0].replace(',','');
			var inputVal = $('#option-row-' + i + ' input[type=number]').val();
			totalPrice += (unitPrice * inputVal);
		}
		$('#totalPrice').text(numberWithCommas(totalPrice));
		
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function fn_loginCheck(){
		var loginDto = '${loginDto}';
		if(loginDto == null || loginDto == ''){
			alert('로그인이 필요합니다.');
			location.href = 'loginPage.do';
			return;
		}
	}
	
	function fn_addCart(){
		$('#addCartBtn').click(function(){
			if($('#totalPrice').text() == '0'){
				alert('상품 옵션을 선택해주세요!');
				return;
			}
			fn_loginCheck();
			
			$.ajax({
				url : 'cartInsert.do',
				type: 'post',
				data: $('#optionForm').serialize(),
				dataType: 'text',
				success: function(responseText){
					console.log('responseText: ' +responseText);
					if((responseText*1) > 0){
						if(confirm('장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?')){
							location.href = 'cartListPage.do';						
						}
					}
				},
				error : function(){
					alert('실패');
				}
			});
		});
	}
	
	/* function fn_buy(){
		
		$('#buyBtn').click(function(){
			if($('#totalPrice').text() == '0'){
				alert('상품 옵션을 선택해주세요!');
				return;
			}
			
			var loginDto = '${loginDto}';
			if(loginDto == null || loginDto == ''){
				alert('로그인이 필요한 페이지입니다.');
				location.href = 'loginPage.do';
				return;
			}
			
			$.ajax({
				url : 'cartInsert.do',
				type: 'post',
				data: $('#optionForm').serialize(),
				dataType: 'text',
				success: function(responseText){
					console.log('responseText: ' +responseText);
					if((responseText*1) > 0){
						console.log(responseText);
						location.href = 'orderDirectInsertPage.do?pNo=${param.pNo}';						
					}
				},
				error : function(){
					alert('실패');
				}
			});
		});
		
	} */
	
	// 스크롤 시 구매 창 고정
	$(function(){
		$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       var width = $(window).width(); // @media width
		       if(width >= 720){		    	   
	    		   console.log(num);
		    	   if(num > 60){  // 스크롤을 60이상 했을 때
			          $(".sticky_aside.product_detail").css("position","fixed").css("top","35px").css("left","53%");
			       }else{
			          $(".sticky_aside.product_detail").css("position","absolute").css("top","40px").css("left","55%");
			       }
		       }
		  });
		});
	
</script>

<div class="inner-w">
	<section class="prd-detail-section" id="img-section">
		<div class="image-preview ui-slider" data-ui="slider" tabindex="-1"
			style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
			<div class="outer-frame">
				<ul class="img-view inner-frame">
					<c:set var="pImgList" value="${fn:split(productArtistDto.PImage,'&')}"/>
					<c:forEach var="img" items="${pImgList}">
						<li class="ui-slide" data-trigger-preview="open"
							style="background-image: url(/classick/resources/storage/product/${img}); width: 560px; height: 560px;"
							data-index="0"></li>
					</c:forEach>
				</ul>
			</div>
			<fieldset class="ui-control">
				<button type="button" class="ui-btn prev" aria-label="이전">
					<i class="fa fa-angle-left fa-2x"></i>
				</button>
				<ul class="img-list indicator">
					<c:forEach var="img" items="${pImgList}">
						<li class="indicator-btn" style="background-image: url(/classick/resources/storage/product/${img})"></li>
					</c:forEach>
				</ul>
				<button type="button" class="ui-btn next" aria-label="다음">
					<i class="fa fa-angle-right fa-2x"></i>
				</button>
			</fieldset>
		</div>
	</section>
	<aside class="sticky_aside product_detail">
		<div class="sticky_aside_product">
			<div class="artist_card">
				<div class="artist_card__split">
					<a href="" class="artist_card__link">
						<div class="artist_card__img" style="background-image: url(/classick/resources/storage/product/${productArtistDto.AImage});"></div>
						<span class="artist_card__label">
	                        ${productArtistDto.AName}&nbsp;                        
	                        <i class="fas fa-angle-right"></i>
	                    </span>
					</a>
				</div>
				<div class="artist_card__split">
					<a href="" class="ui_btn--mini" style="height: 28px; padding-top: 3px;">
						<i class="far fa-comment-dots" style="font-size: 16px;margin-left: 5px;margin-right: 1px;"></i>
						<p style="font-size: 11px;margin-right: 6px;">작가 문의</p>
					</a>
				</div>
			</div>
				<h2 class="sticky_aside__produc-title">${productArtistDto.PName}</h2>
				<div class="product-detail-info">
					<div class="price_tag-detail">
						<mark class="sticky_aside__marked right">
						    <button aria-label="즐겨찾기 추가" class="full-button" style="width: 22px; height: 100%;">
						        <div class="product-detail-star-text-box">
						            <div class="product-detail-star-box">
						            	<i class="far fa-heart product-detail-star idus-icon-favorite"></i>
						            </div>
						            <div class="star-count-text-box">
						                <p class="star-count-text">18,752</p>
						            </div>
						        </div>
						    </button>
						    <button data-ui="url-copy" data-ui-option="short" data-icon-event="hover" data-clipboard-message="작품 URL이 복사되었습니다." class="product-detail-share-button">
						        <div class="product-detail-share-box">
						            <i class="fas fa-share-alt idus-icon-share"></i>
						        </div>
						    </button>
						</mark>
						<span>
							<span class="price_tag__hilight">
								<em>${productArtistDto.PDisRate}</em>%	
							</span>
							<span class="price_tag__strong">
								<strong class="sold-price">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${productArtistDto.PPrice}"/>
								</strong>원
							</span>
							<del class="price_tag__crossout">${productArtistDto.PListPrice}</del>
						</span>
					</div>
					<div class="price_tag-detail height" style="height: 20px; margin-bottom: 16px;">
						<mark class="sticky_aside__marked right">
							<span id="count_up" class="bold-txt dark">13,071 명</span>
							<span class="dark">구매</span>
						</mark>
						<div class="item-info__badge-group">
							<c:set var="partStr1" value="${fn:substringAfter(productArtistDto.PASDesc,'배송비\":\"')}"/>
							<c:set var="dCost" value="${fn:substringBefore(partStr1,'\",\"')}"/>
							<c:set var="partStr2" value="${fn:substringAfter(productArtistDto.PDetail,'안전식품\":\"')}"/>
							<c:set var="isSafe" value="${fn:substringBefore(partStr2,'\",\"')}"/>
							<c:if test="${dCost == 0}">
								<div class="badge badge-delivery" id="badge-delivery">무료배송</div>
							</c:if>
							<c:if test="${isSafe == 'safe'}">
								<div class="badge badge-food" id="badge-food">안전식품</div> 
							</c:if>
						</div>
					</div>
					<div class="product-define-info">
						<div class="data-row">
							<table>
								<tr>
									<td class="data-row__title">적립금</td>
									<td class="data-row__content">
										<span>
											최대
											<span class="bold-txt">451P</span>
										</span>
										<div class="balloon">
											<img src="/classick/assets/image/product/icon-info.svg" alt="" style="color: #888; vertical-align: middle;">
											<%-- 
											<i class="far fa-question-circle" style="color: #888; line-height: 20px;"></i>
											--%>
										</div>
									</td>
								</tr>
							</table>
							<div class="balloon__content">
								<div class="point-balloon">
									<table class="balloon-table">
										<tr>
											<td class="balloon-table left">회원등급 적립률</td>
											<td>2%</td>
										</tr>
										<tr>
											<td class="balloon-table left">VIP 클럽 추가 적립</td>
											<td>+1%</td>
										</tr>
										<tr>
											<td class="balloon-table left">간편 결제 시</td>
											<td>+0.5%</td>
										</tr>
									</table>
									<div>
										<table class="vip-section">
											<div class="vip-section__line"></div>
											<tr>
												<td style="float: left;">
													<h4 class="hilight">CLASSICK VIP 클럽</h4>
												</td>
												<td style="float: right;">
													<a href="" class="hilight red">더 알아보기&gt;</a>
												</td>
											</tr>
										</table>
										<p class="vip-section__desc">
											핸드메이드를 사랑하는 회원님들에게 제공하는 유료 서비스로 작품 금액의 1.0% 추가 적립 및 배송비 무료 혜택을 제공합니다.
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="data-row">
							<table>
								<tr>
									<td class="data-row__title">
						                구매후기
						            </td>
						            <td class="data-row__content">
						            	<div class="review-rate-box">
						            		<a href="#prd-review" class="review-rate-box">
						            			<div style="padding-top: 1px;">
						            				<span data-value="4.9" class="ui_rating fr">
						            					<i class="fas fa-star ui_icon--star" data-state="active" style="font-size: 15px;"></i>
						            					<i class="fas fa-star ui_icon--star" data-state="active" style="font-size: 15px;"></i>
						            					<i class="fas fa-star ui_icon--star" data-state="active" style="font-size: 15px;"></i>
						            					<i class="fas fa-star ui_icon--star" data-state="active" style="font-size: 15px;"></i>
						            					<i class="fas fa-star ui_icon--star" data-state="active" style="font-size: 15px;"></i>
						            				</span>
						            			</div>
						            			<div style="margin-left: 3px;">(1405)</div>
						            			<div style="margin-left: 5px; line-height: 21px;">
						            				<i class="fas fa-chevron-right" style="font-size: 12px;"></i>
						            			</div>
						            		</a>
						            	</div>
						            </td>
						        </tr>
						    </table>
						</div>
						<div class="data-row">
							<table>
								<tr>
									<td class="data-row__title">배송비</td>
						            <td class="data-row__content">
						            	<c:set var="partStr3" value="${fn:substringAfter(productArtistDto.PASDesc,'무료배송\":\"')}"/>
										<c:set var="dShipping" value="${fn:substringBefore(partStr3,'\",\"')}"/>
						            	<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${dCost}"/>원
						                	<span class="subcontent">(<fmt:formatNumber type="number" maxFractionDigits="3" value="${dShipping}"/>원 이상 무료배송)</span>
						                </span>
						                <div class="balloon">
						                	<img src="/classick/assets/image/product/icon-info.svg" alt="" style="color: #888; vertical-align: middle;">
											<%-- 
											<i class="far fa-question-circle" style="color: #888; line-height: 20px;"></i>
											--%>
						                </div>
						            </td>
						        </tr>
						    </table>
						    <div class="balloon__content">
						    	<button type="button" class="close_btn mobile-show">
						    		<i class="idus-icon-close"></i>
						    	</button>
						    	<li>
						    		<span>동일 작가 작품 80,000원 이상 구매시 무료배송</span>
						    	</li>
						    	<li>
						            제주 / 도서산간 추가비용 : <span>없음</span>
						        </li>
						    </div>
						</div>
						<div class="data-row">
						    <table>
						        <tr>
						            <td class="data-row__title">
						                배송 시작
						            </td> 
						            <td class="data-row__content">
						                <div class="delivery-header-text-box">
						                    <p class="delivery-average-text">평균</p> 
						                    <p class="delivery-average-text bold">1일</p> 
						                    <p class="delivery-average-text comma">,</p> 
						                    <p class="delivery-average-text">최대 2일 이내</p>
						                </div> 
						            </td>
						        </tr>
						    </table> 
						</div>
						<div class="data-row">
						    <table>
						        <tr>
						            <td class="data-row__title">수량</td> 
						            <td class="data-row__content">
						                <span>주문시 제작
						                </span> 
						            </td>
						        </tr>
						    </table> 
						</div>
					</div>
					<div class="checkout_product">
						<form id="optionForm" method="post">
							<input type="hidden" name="pNo" value="${productArtistDto.PNo}">
							<input type="hidden" name="pName" value="${productArtistDto.PName}">
							<input type="hidden" name="aName" value="${productArtistDto.AName}">
							<input type="hidden" name="pImage" value="${productArtistDto.PImage}">
							<div class="mobile-layer">
								<select name="pOption" id="optSelector" class="ui_btn select_group_trigger" style="padding: 7px 5px;">
									<option value="">옵션 선택</option>
									<c:if test="${not empty stockList}">
										<c:forEach var="stockDto" items="${stockList}">
												<option value="${stockDto.SNo}">${stockDto.OTitle} : ${stockDto.OContent} (+${stockDto.OAddPrice}원)</option>
										</c:forEach>
									</c:if>
								</select>
							
								<div class="selected_options"></div>
								<dl class="checkout_product__cost_label">
									<span></span>
									<span> 
										<span class="subtitle">총 작품금액</span>
										<span id="totalPrice">0</span>원
									</span>
								</dl>
							</div>
							<fieldset class="checkout_product__btn_group show1">
								<input type="button" data-to="payment" class="ui_btn--red buy" value="구매하기" id="buyBtn"/>
								<input type="button" data-to="cart" class="ui_btn cart" id="addCartBtn" value="장바구니"/>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
	</aside>
</div>
<div class="inner-w">
	<div class="banner-wrapper">
	    <span class="desc">
	        배송비 내지 마세요! <br>월 2,500원으로
	        <strong>무제한 무료배송</strong>
	    </span>
	    <button type="button" class="vip-club-btn">
	        VIP 클럽 알아보기
	    </button>
	</div>
	<section class="prd-detail-section">
	    <div class="delivery-graph-box ">
	        <div class="delivery-header-text-box">
	            <p class="delivery-average-text">평균</p>
	            <p class="delivery-average-text bold">1일</p>
	            <p class="delivery-average-text comma">,</p>
	            <p class="delivery-average-text">최대 2일 이내 배송 시작</p>
	        </div>
	        <div>
	            <div class="graph-line-box">
	                <div class="graph-line-day content-text ">당일</div>
	                <div class="graph-line-bar">
	                    <div class="graph-bar-box">
	                        <div class="graph-bar-rate black" style="width: 33%;"></div>
	                    </div>
	                </div>
	                <div class="graph-line-rate content-text ">33%</div>
	            </div>
	            <div class="graph-line-box">
	                <div class="graph-line-day content-text red">1일</div>
	                <div class="graph-line-bar">
	                    <div class="graph-bar-box">
	                        <div class="graph-bar-rate red" style="width: 66%;"></div>
	                    </div>
	                </div>
	                <div class="graph-line-rate content-text red">66%</div>
	            </div>
	            <div class="graph-line-box">
	                <div class="graph-line-day content-text ">2일</div>
	                <div class="graph-line-bar">
	                    <div class="graph-bar-box">
	                        <div class="graph-bar-rate black" style="width: 1%;"></div>
	                    </div>
	                </div>
	                <div class="graph-line-rate content-text ">1%</div>
	            </div>
	            <div class="graph-line-box">
	                <div class="graph-line-day content-text ">3일</div>
	                <div class="graph-line-bar">
	                    <div class="graph-bar-box"></div>
	                </div>
	                <div class="graph-line-rate content-text ">0%</div>
	            </div>
	            <div class="graph-line-box">
	                <div class="graph-line-day content-text ">4일 이상</div>
	                <div class="graph-line-bar">
	                    <div class="graph-bar-box"></div>
	                </div>
	                <div class="graph-line-rate content-text ">0%</div>
	            </div>
	        </div>
	        <div class="delivery-footer-text-box">최근 3개월 주문의 배송준비 기간 (주말, 공휴일 제외)</div>
	    </div>
	</section>
	<nav class="flex_nav_style nav-mobile" data-ui-position="default" data-ui="tab-control" data-page="product">
	    <a href="#prd-info" data-id="prd-info" class="active">작품정보</a>
	    <a href="#prd-enquiries" data-id="prd-enquiries" class="">배송 / 교환 / 환불</a> <!--  -->
	    <a href="#prd-review" data-id="prd-review">구매후기(1411)</a> 
	    <a href="#prd-comments" data-id="prd-comments">댓글</a>
	</nav>
	<section id="prd-info" class="prd-detail-section" data-scroll="hashChecker">
		<c:if test="${isSafe == 'safe'}">
		    <!-- 안전식품 고지 -->
		    <div class="safe-food-box">
		        <h2 class="safe-food-title">안심하고 드세요!</h2>
		        <p class="safe-food-text">식품위생법에 따른 영업 신고, 등록을 하신 작가님이 판매하는 안전식품입니다.</p>
		    </div>
		</c:if>
		
	     <!-- 상품 설명 -->
		<div style="word-break: break-all" class="para">${productArtistDto.PDesc}</div>
		
		 <!-- 해쉬 테그 -->
		<div class="hashtag-box">
		    <div class="center-txt">
		        <span class="txt">Category &amp; Keyword</span>
		        <a class="txt-strong" href="/w/main/category/613ac4c3-df73-4a0f-b3dd-362849dabb2a">${productArtistDto.PCategory}</a>
		    </div>
		    <c:set var="pTagList" value="${fn:split(productArtistDto.PTag,',')}"/>
		    <div class="listwrap">
		        <ul>
		        	<c:forEach var="pTag" items="${pTagList}">
			            <li><a href="">${pTag}</a></li>
		        	</c:forEach>
		        </ul>
		    </div>
		</div>
		<!-- 작품 정보 보기 / 접기 -->
		<script>
			
			function onInfoProvision() {
				var con = document.getElementById('infoTab');
				if(con.style.display == 'none'){
					con.style.display = 'table';
					$('#infoPro i').css('transform', 'rotate(180deg)');
				}else{
					con.style.display = 'none';
					$('#infoPro i').css('transform', 'rotate(0deg)');
				}
			}
			function onInfoArtist() {
				var con = document.getElementById('artistTab');
				if(con.style.display == 'none'){
					con.style.display = 'table';
					$('#infoArt i').css('transform', 'rotate(180deg)');
				}else{
					con.style.display = 'none';
					$('#infoArt i').css('transform', 'rotate(0deg)');
				}
			}
			function onInfoShipping() {
				var con = document.getElementById('shippingTab');
				if(con.style.display == 'none'){
					con.style.display = 'table';
					$('#infoShip i').css('transform', 'rotate(180deg)');
				}else{
					con.style.display = 'none';
					$('#infoShip i').css('transform', 'rotate(0deg)');
				}
			}
		</script>
		
		<!-- 상품 정보 제공 -->
		<div class="product-info-provision">
			<div class="tab" id="infoPro" onclick="onInfoProvision()">
                 <span>작품 정보제공 고시</span>
                 <i class="fa fa-angle-down"></i>
            </div>
			<table class="table-style column" id="infoTab"  style="display: none;">
                  <colgroup>
                      <col width="30%" span="1" style="background-color:#F5F5F5;">
                      <col width="*">
                  </colgroup>
                  <tbody>
                  	  <c:set var="detailStr1" value="${fn:substringAfter(productArtistDto.PDetail,'식품의 유형\":\"')}"/>
					  <c:set var="detail1" value="${fn:substringBefore(detailStr1,'\",\"')}"/>
					  
                      <c:set var="detailStr2" value="${fn:substringAfter(productArtistDto.PDetail,'생산자\":\"')}"/>
					  <c:set var="detail2" value="${fn:substringBefore(detailStr2,'\",\"')}"/>
					  
                      <c:set var="detailStr3" value="${fn:substringAfter(productArtistDto.PDetail,'소재지\":\"')}"/>
					  <c:set var="detail3" value="${fn:substringBefore(detailStr3,'\",\"')}"/>
					  
                      <c:set var="detailStr4" value="${fn:substringAfter(productArtistDto.PDetail,'제조연월일\":\"')}"/>
					  <c:set var="detail4" value="${fn:substringBefore(detailStr4,'\",\"')}"/>
					  
                      <c:set var="detailStr5" value="${fn:substringAfter(productArtistDto.PDetail,'유통기한\":\"')}"/>
					  <c:set var="detail5" value="${fn:substringBefore(detailStr5,'\",\"')}"/>
					  
                      <c:set var="detailStr6" value="${fn:substringAfter(productArtistDto.PDetail,'용량\":\"')}"/>
					  <c:set var="detail6" value="${fn:substringBefore(detailStr6,'\",\"')}"/>
					  
                      <c:set var="detailStr7" value="${fn:substringAfter(productArtistDto.PDetail,'수량\":\"')}"/>
					  <c:set var="detail7" value="${fn:substringBefore(detailStr7,'\",\"')}"/>
					  
                      <c:set var="detailStr8" value="${fn:substringAfter(productArtistDto.PDetail,'원재료명\":\"')}"/>
					  <c:set var="detail8" value="${fn:substringBefore(detailStr7,'\",\"')}"/>
					  
                      <c:set var="detailStr9" value="${fn:substringAfter(productArtistDto.PDetail,'관리법상표시\":\"')}"/>
					  <c:set var="detail9" value="${fn:substringBefore(detailStr7,'\",\"')}"/>
					  
                      <c:set var="detailStr10" value="${fn:substringAfter(productArtistDto.PDetail,'보관방법\":\"')}"/>
					  <c:set var="detail10" value="${fn:substringBefore(detailStr7,'\",\"')}"/>
					  
                      <tr>
                          <th>식품의 유형</th>
                          <td>${detail1}</td>
                      </tr>
                      <tr>
                          <th>생산자 및 소재지</th>
                          <td>${detail2}, ${detail3}</td>
                      </tr>
                      <tr>
                          <th>제조연월일, 유통기한 또는 품질유지기한</th>
                          <td>${detail4}, ${detail5}</td>
                      </tr>
                      <tr>
                          <th>포장단위별 용량(중량), 수량</th>
                          <td>${detail6}, ${detail7}</td>
                      </tr>
                      <tr>
                          <th>원재료명 및 함량</th>
                          <td>${detail8}</td>
                      </tr>
                      <tr>
                          <th>관리법상 표시사항</th>
                          <td>${detail9}</td>
                      </tr>
                      <!-- <tr>
                          <th>구성</th>
                          <td></td>
                      </tr> -->
                      <tr>
                          <th>보관방법 또는 취급방법</th>
                          <td>${detail10}</td>
                      </tr>
                   </tbody>
            </table>
		</div>
		<div class="product-info-provision">
			<div class="tab" id="infoArt" onclick="onInfoArtist()">
                 <span>판매 작가 정보</span>
                 <i class="fa fa-angle-down"></i>
            </div>
			<table class="table-style column" id="artistTab"  style="display: none;">
                  <colgroup>
                      <col width="30%" span="1" style="background-color:#F5F5F5;">
                      <col width="*">
                  </colgroup>
                  <tbody>
                      <tr>
                          <th>대표자명</th>
                          <td>${productArtistDto.AName}</td>
                      </tr>
                      <tr>
                          <th>이메일</th>
                          <td>support@classick.com</td>
                      </tr>
                      <tr>
                          <th>전화번호</th>
                          <td>Classick 고객센터 1668-1234</td>
                      </tr>
                   </tbody>
            </table>
		</div>
		<div class="product-info-provision" id="prd-enquiries">
			<div class="tab" id="infoShip" onclick="onInfoShipping()">
                 <span>배송 / 교환 / 환불</span>
                 <i class="fa fa-angle-up"></i>
            </div>
			<table class="table-style column" id="shippingTab" style="display: table;">
                  <colgroup>
                      <col width="30%" span="1" style="background-color:#F5F5F5;">
                      <col width="*">
                  </colgroup>
                  <tbody>
                      <tr>
                          <th>배송비</th>
                          <td>
                          	<ul>
                          		<li>기본료 : <em class="hilight blue">(<fmt:formatNumber type="number" maxFractionDigits="3" value="${dCost}"/>원</em></li>
                          		<li>배송비 무료 조건 : <em class="hilight blue"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dShipping}"/>원</em></li>
                          		<li><em class="txt-Shipping">제주, 도서산간일 경우 기본료만 무료가 됩니다.</em></li>
                          		<c:set var="shippingStr1" value="${fn:substringAfter(productArtistDto.PASDesc,'도서산간비용\":\"')}"/>
								<c:set var="dExtraCost" value="${fn:substringBefore(shippingStr1,'\",\"')}"/>
                          		<li>제주 / 도서산간 추가비용 : <em class="hilight blue"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dExtraCost}"/>원</em></li>
                          		
                          	</ul>
                          </td>
                      </tr>
                      <tr>
                          <th>제작 / 배송</th>
                          <td>
                          	<ul>
                          		<c:set var="shippingStr2" value="${fn:substringAfter(productArtistDto.PASDesc,'제작배송기간\":\"')}"/>
								<c:set var="delivery" value="${fn:substringBefore(shippingStr2,'\",\"')}"/>
                          		<c:set var="shippingStr3" value="${fn:substringAfter(productArtistDto.PASDesc,'제작배송방법\":\"')}"/>
								<c:set var="deliveryDetail" value="${fn:substringBefore(shippingStr3,'\",\"')}"/>
                          		<li><em class="hilight blue">${delivery}일 이내</em></li>
                          		<li>${deliveryDetail}</li>
                          	</ul>
                          </td>
                      </tr>
                      <tr>
                          <th>교환 / 환불</th>
                          <td>
                          		<ul>
                          			<c:set var="shippingStr4" value="${fn:substringAfter(productArtistDto.PASDesc,'교환환불정책\":\"')}"/>
									<c:set var="refundPolicy" value="${fn:substringBefore(shippingStr4,'\",\"')}"/>
	                          		<c:set var="shippingStr5" value="${fn:substringAfter(productArtistDto.PASDesc,'교환환불내용\":\"')}"/>
									<c:set var="refundPolicyDetail" value="${fn:substringBefore(shippingStr5,'\"')}"/>
	                          	    <li><em class="hilight blue">${refundPolicy}</em></li>
	                          		<li>${refundPolicyDetail}</li>
                          		</ul>
                          </td>
                      </tr>
                   </tbody>
            </table>
		</div>
		
	</section>

   <script>
		function fn_checkLogin(f) {
			if(${loginDto eq null}){
				alert('로그인은 필수입니다.');
				f.action = 'loginPage.do';
				f.submit();
			}else{
				f.action = 'productReplyInsert.do'; // 댓글
				f.submit();        			
			}
		}
		/* function fn_checkLogin-review() {
			if(${loginDto eq null}){
				alert('로그인은 필수입니다.');
				location.href = 'loginPage.do';
			}else{
				location.href = ''; // 리뷰
			}
		} */
		
		
   </script>
	
            
	<!-- 구매후기 -->
	<section id="prd-review" class="prd-detail-section" data-scroll="hashChecker">
                <div class="title-style-sub" style="margin-bottom: 0;">
                    <h3 class="txt">구매후기(0)</h3>
                    <a class="to-right btn btn-xs btn-white" href="" data-modal-type="post" style="cursor:pointer" onclick="fn_checkLogin-review()">구매후기 작성하기</a>
                </div>
                <ul>
	                <li class="review">
	                	<a href="">
	                		<div class="review-header">
		                		<div class="reviewer-info">
			                		<div class="reviewer-thumbnail" style="background-image: url('/classick/assets/image/user.png');"></div>
				                		 <div class="reviewer-detail-info">
				                		 	<span class="reviewer-name">이름</span>
				                		 	<span class="review-date">2020년 01월 01일</span>
				                		 </div>
			                		 </div> 
			                		 <!-- 별점 -->
			                		 <div class="review-rate">
			                		 	<span data-value="5" class="ui_rating fr">
				                		 	<i class="fas fa-star" data-state="active" style="font-size: 12px;"></i>
				                		 	<i class="fas fa-star" data-state="active" style="font-size: 12px;"></i>
				                		 	<i class="fas fa-star" data-state="active" style="font-size: 12px;"></i>
				                		 	<i class="fas fa-star" data-state="active" style="font-size: 12px;"></i>
				                		 	<i class="fas fa-star" data-state="active" style="font-size: 12px;"></i>
				                		</span>
			                		</div>
	                			</div> 
		                		<p class="review-option">옵션1:  / 옵션2:</p> 
		                		<div class="review-body"><!----> 
		                		<div class="review-contents"></div>
	                		</div>
	                	</a>
	                </li>
                </ul>
            </section>
            
            <!-- 댓글창 -->
            <section id="prd-comments" class="prd-detail-section comment-ui">
            <div class="title-style-sub">
                <h3 class="txt">댓글</h3>
                <a href="" class="to-right hilight blue">댓글 더보기</a>
            </div>

            
            <div class="banner-empty smaller ">
                <div class="banner-icon">
                    <i class="far fa-comments fa-7x"></i>
                </div>
                <p class="txt">행운의 첫 댓글을 남겨보세요.</p>
            </div>
            <ul class="comment-list">
            </ul>

            <form class="area-form with-profile" aria-label="댓글남기기">
                <div class="inner">
                    <label class="input-text" for="add_comment" >
                        <input type="text" id="add_comment" name="comment" class="input-text" placeholder="댓글을 남겨주세요">
                    </label>
                    <button type="submit" class="btn btn-s btn-point" onclick="fn_checkLogin(this.form)">등록</button>
                </div>
            </form>
        </section>
</div>


<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>