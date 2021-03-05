<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - ${param.category}" name="title" />
</jsp:include>

<div class="inner-w">
	<div class="ui_title">
		<h2 class="ui_title__txt">${param.category}</h2>
	</div>
	
	<!-- <div class="filter-box">
		<div class="filter_group category">
			<div class="filter">
				<div class="filter__row">
					<div class="filter__head">배송</div>
					<div class="filter__body">
						<div class="filter_row">
							<div class="filter_item">
								<div class="checkbox">
									<div class="input-checkbox">
										<input type="checkbox" class="bp" value="">
									</div>
								</div>
								<div class="badge_group">
									<div freeShpping class="badge badge-delivery">무료배송</div>
								</div>
								<span>만 보기</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="filter last">
				<div class="filter__row">
					<div class="filter__head">가격대</div>
					<div class="filter__body">
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp"
										value="price__gte=0&amp;price__lt=10000">
								</div>
								<span class="checkbox__label">1만원 미만</span>
							</div>
						</div>
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp"
										value="price__gte=10000&amp;price__lt=20000">
								</div>
								<span class="checkbox__label">1만원대</span>
							</div>
						</div>
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp"
										value="price__gte=20000&amp;price__lt=30000">
								</div>
								<span class="checkbox__label">2만원대</span>
							</div>
						</div>
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp"
										value="price__gte=30000&amp;price__lt=40000">
								</div>
								<span class="checkbox__label">3만원대</span>
							</div>
						</div>
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp"
										value="price__gte=40000&amp;price__lt=50000">
								</div>
								<span class="checkbox__label">4만원대</span>
							</div>
						</div>
						<div class="filter_item">
							<div class="checkbox">
								<div class="input-checkbox">
									<input type="checkbox" class="bp" value="price__gte=50000">
								</div>
								<span class="checkbox__label">5만원 이상</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="filter_bottom">
	    <div>
	        <button class="only-img-button">
	            <div class="only-img-button-box">
	                <div class="checkbox">
	                    <div class="input-checkbox">
	                        <input type="checkbox" class="bp" value="false">
	                    </div>
	                </div>
	                <p class="only-img-button-text margin-left ">이미지만 볼래요</p>
	            </div>
	        </button>
	    </div>
	    <div class="selector_img-only">
	        <div class="selector_wrapper">
	            <div data-ui="selectbox" data-state="" class="ui-selectbox full">
	                <select id="selector" name="">
	                    <option value="sort=-POPULAR" class="ui-option">인기순</option>
	                    <option value="sort=-CREATED_AT" class="ui-option">최신순 (NEW)</option>
	                    <option value="sort=-FAVORITE" class="ui-option">즐겨찾기가 많은 순</option>
	                    <option value="sort=-REVIEW" class="ui-option">구매후기가 많은 순</option>
	                    <option value="sort=-PURCHASE" class="ui-option">판매수가 많은 순</option>
	                    <option value="sort=PRICE" class="ui-option">낮은 가격순</option>
	                    <option value="sort=-PRICE" class="ui-option">높은 가격순</option>
	                </select> 
	                <button type="button" class="ui-trigger">
	                    <span class="ui-selected">인기순</span>
	                    <i class="ui-icon fa fa-chevron-down"></i>
	                </button>
	                <ul class="ui-select">
	                    <li value="sort=-POPULAR" class="ui-option">인기순</li>
	                    <li value="sort=-CREATED_AT" class="ui-option">최신순 (NEW)</li>
	                    <li value="sort=-FAVORITE" class="ui-option">즐겨찾기가 많은 순</li>
	                    <li value="sort=-REVIEW" class="ui-option">구매후기가 많은 순</li>
	                    <li value="sort=-PURCHASE" class="ui-option">판매수가 많은 순</li>
	                    <li value="sort=PRICE" class="ui-option">낮은 가격순</li>
	                    <li value="sort=-PRICE" class="ui-option">높은 가격순</li>
	                </ul>
	            </div>
	            <span class="selector_name">인기순
	                <button type="button" class="ui-trigger">
	                    <span class="ui-selected"></span>
	                    <i class="ui-icon fa fa-chevron-down"></i>
	                </button>
	            </span>
	        </div>
	    </div>
	</div> -->
</div>
<div class="inner-w mt40">
	<div class="ui_grid mt10">
		<div class="ui_grid__cols--4">
			<c:if test="${empty list}"> list is empty </c:if>
			<c:if test="${not empty list}">
				<c:forEach var="productArtistDto" items="${list}">
					<div class="ui_grid__item">
						<div class="base-card card--vertical product">
							<a href="productViewPage.do?pNo=${productArtistDto.PNo}">
								<div class="card-thumb-cover">
									<c:set var="pImgStr" value="${fn:substringBefore(productArtistDto.PImage,'&')}"/>
									<div class="product-thumb-img" style="background-image: url(/classick/resources/storage/product/${pImgStr});"></div>
									<%--
									<div class="product-bookmark">
										<button class="full-button">
											<i class="sp-icon icon-favorite-card"></i>
										</button>
									</div>
									 --%>
									
								</div>
								<div class="card-info product-info">
									<div class="product-info__artist-name">${productArtistDto.AName}</div>
									<div class="product-info__name">${productArtistDto.PName}</div>
									<div class="product-info__price">
										<span class="sale-rate"><fmt:parseNumber integerOnly= "true" value= "${productArtistDto.PDisRate}"/>%</span>
										<span class="price-sale">
											<fmt:formatNumber value="${productArtistDto.PPrice}" type="number" />
											<span style="font-size: 14px;">원</span>
										</span>
										<div class="price-origin--before-sale">
											<del><fmt:formatNumber type="number" maxFractionDigits="3" value="${productArtistDto.PListPrice}"/> </del>
										</div>
									</div>
									<div class="product-info__badge-group">
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
									<%--
									<div class="product-info__review">
										<div class="review-rating">
											<span class="ui_rating fr">
												<i data-state="active" class="ui_icon--star idus-icon-star-fill" style="font-size: 11px;"></i>
											</span>
											<span class="review-count"></span>
										</div>
										<div class="review-comment">
											<div class="review-comment__badge">후기</div>
											<div class="review-comment__contents"></div>
										</div>
									</div>
									--%>
								</div>
							</a>
						</div> 
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>



	<%-- footer.jsp --%>
	<%@ include file="../template/footer.jsp"%>