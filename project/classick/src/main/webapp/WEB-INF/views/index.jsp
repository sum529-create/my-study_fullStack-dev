<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="template/header.jsp" >
    <jsp:param value="Classick - Home" name="title"/>
</jsp:include>

<script type="text/javascript">

// product slider 소스
$(document).ready(function(){
	
    $('.slider').bxSlider({
    	auto: true
    });
    
    $('.productSlider').bxSlider({
  	  minSlides: 5,
  	  maxSlides: 5,
  	  slideWidth: 300,
  	  slideMargin: 10,
  	  pager:true,
  	  pagerType:'short'
  	  
  	});
    
    $('.reviewSlider').bxSlider({
  	  minSlides: 2,
  	  maxSlides: 2,
  	  slideWidth: 600,
  	  slideMargin: 10,
  	  pager:true,
  	  pagerType:'short'
  	});
    
    $('.artistSlider').bxSlider({
  	  minSlides: 2,
  	  maxSlides: 3,
  	  slideWidth: 320,
  	  slideMargin: 35,
  	  pager:true,
  	  pagerType:'short'
  	  
  	});
    
  });
	
	/*	*** bxSlider 사용법 **
			mode: 'horizontal',// 가로 방향 수평 슬라이드
			speed: 500,        // 이동 속도를 설정
			pager: true,      // 현재 위치 페이징 표시 여부 설정
			moveSlides: 1,     // 슬라이드 이동시 개수
//			slideWidth: 100,   // 슬라이드 너비
//			minSlides: 3,      // 최소 노출 개수
//			maxSlides: 3,      // 최대 노출 개수
//			slideMargin: 5,    // 슬라이드간의 간격
			auto: true,        // 자동 실행 여부
			autoHover: true,   // 마우스 호버시 정지 여부
			controls: true    // 이전 다음 버튼 노출 여부

	*/

</script>

	<div class="slider">
	    <div class="mainSlider"><a href=""><img src="https://image.idus.com/image/files/2a6fc3e6e43144aaa325fabe391afdcb.jpg"></a></div>
	    <div class="mainSlider"><a href=""><img src="https://image.idus.com/image/files/58ab516dd06047ed946b1d3e74e8a012.jpg"></a></div>
	    <div class="mainSlider"><a href=""><img src="https://image.idus.com/image/files/dc48d49ec6364091b804b0e0f56c6e53.jpg"></a></div>
	</div>
	
	<!-- 상품 슬라이드 부분 (틀만 잡아놓았습니다.) -->
	<!-- 슬라이드 2줄 씩 출력하기 위한 i, j -->
	<!-- 오늘의 발견 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="2"/>
	<section class="today_find">
		<a href="#"><h3>오늘의 발견</h3></a>
		<div class="newProduct">
		 <div class="productSlider">
			<c:forEach var="list" begin="0" end="19">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct1.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">상주곶감 따시농형제</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">쫄깃한 인생곶감 선물세트 VIP 선물세트</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="today-recommend-product.do" class="newProductBtn">오늘의 발견 더보기 </a>
		
	</section>


	<!-- 실시간 구매 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="2"/>
	<section class="realTime_purchase">
		<a href="#"><h3>실시간 구매</h3></a>
		<div class="newProduct">
		 <div class="productSlider">
			<c:forEach var="list" begin="0" end="19">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct2.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">블륨스타일</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">설날 선물세트 오색쌀강정 수제강정</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="liver-order-product.do" class="newProductBtn">실시간 구매 더보기 </a>
		
	</section>


	<!-- 실시간 후기 ** 폼이 조금 다름 ** -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<section class="realTime_review">
		<a href="#"><h3>실시간 후기</h3></a>
		<div class="newReview">
		 <div class="reviewSlider">
			<c:forEach var="list" begin="0" end="17">	<!-- 24개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="reviewProduct">
						<ul class="product-list">
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct3.jpg" /></a></li><!-- 상품이미지 -->
					  		<li>
						  		<div id="productCat"><a href="#">삼남매고깃간</a></div> <!-- 카테고리 -->
						  		<div id="productName"><a href="#">[삼남매]1등급 꽃마블 명품 한우 선물세트</a></div> <!-- 상품 이름 -->
						  		<div id="reviewProductRev"><span>[상품후기]텍스트오버플로우테스트입니다. 텍스트가 3줄이상이 넘어가게 되면 '...'으로 표시됩니다. 후에 변경하십시오.</span></div> <!-- 상품후기 -->
						  		<div id="productSub">
							  		<div id="reviewProductRat"><!-- 별점 -->
							  			<div class="ui_rating" data-ui="rating" data-value="5">
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<!-- <i class="far fa-star"></i> 빈 별 -->
						  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
						  				</div>
							  		</div>
							  		<span id="productMember">| 사용자</span>
							  	</div>	
					  		</li>
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="review.do" class="newProductBtn">실시간 후기 더보기 </a>
		
	</section>


	<!-- 작가님 추천작품 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="2"/>
	<section class="artist_recommendProduct">
		<a href="#"><h3>작가님 추천작품</h3></a>
		<div class="newProduct">
		 <div class="productSlider">
			<c:forEach var="list" begin="0" end="19">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct4.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">포토웁스</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">차량용 포토방향제 생일선물/액자/커플/설날선물세트</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="recommend-artist-product.do" class="newProductBtn">작가님 추천작품 더보기 </a>
		
	</section>


	<!-- 실시간 추천작품 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="2"/>
	<section class="today_recommendProduct">
		<a href="#"><h3>실시간 추천작품</h3></a>
		<div class="newProduct">
		 <div class="productSlider">
			<c:forEach var="list" begin="0" end="19">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct1.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">상주곶감 따시농형제</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">쫄깃한 인생곶감 선물세트 VIP 선물세트</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="live-recommend-product.do" class="newProductBtn">실시간 추천작품 더보기 </a>
		
	</section>
	
	
	
	
	<!-- 인기작품 
		슬라이더 없음 | 아이디어스에는 항목이 랜덤으로 출력되지만 랜덤구현은 일단 따로 하지 않았음
	 -->
	<!-- 그 외 수제먹거리 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="5"/>
	<section class="other_homemadeFood">
		<a href="#"><h3>인기 작품</h3></a>
			<div class="pProduct"><a href="productListPage.do?category=그 외 수제먹거리" class="pProductTitle">그 외 수제먹거리</a><a href="productListPage.do?category=그 외 수제먹거리" class="pProductAdd">더보기<b>&gt;</b></a></div>
			<table>
			<c:forEach var="list" begin="0" end="9">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
				<tr>
				</c:if>
					<td class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct1.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">블륨스타일</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">설날 선물세트 오색쌀강정 수제강정</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</td>
				<c:if test="${i%j == j-1}">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			</table>
	</section>
	
	<!-- 문구, 팬시 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="5"/>
	<section class="stationery_product">
			<div class="pProduct"><a href="productListPage.do?category=문구" class="pProductTitle">문구, 팬시</a><a href="productListPage.do?category=문구" class="pProductAdd">더보기<b>&gt;</b></a></div>
			<table>
			<c:forEach var="list" begin="0" end="9">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
				<tr>
				</c:if>
					<td class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct4.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">포토웁스</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">차량용 포토방향제 생일선물/액자/커플/설날선물세트</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</td>
				<c:if test="${i%j == j-1}">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			</table>
	</section>
	
	
	<!-- 그 외 악세사리 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="5"/>
	<section class="other_accessories">
			<div class="pProduct"><a href="productListPage.do?category=그외악세사리" class="pProductTitle">그 외 악세사리</a><a href="productListPage.do?category=그외악세사리" class="pProductAdd">더보기<b>&gt;</b></a></div>
			<table>
			<c:forEach var="list" begin="0" end="9">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
				<tr>
				</c:if>
					<td class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct4.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">포토웁스</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">차량용 포토방향제 생일선물/액자/커플/설날선물세트</a></li> <!-- 상품 이름 -->
					  		<li><hr/></li>
					  		<li id="productRat"><!-- 별점 -->
					  			<div class="ui_rating" data-ui="rating" data-value="5">
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<i class="fas fa-star" data-state="active"></i>
					  				<!-- <i class="far fa-star"></i> 빈 별 -->
					  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
					  			</div>
					  		</li>	
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</td>
				<c:if test="${i%j == j-1}">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			</table>
			<a href="popular-category.do" class="pProductBtn">인기작품 더보기 </a>
	</section>
	
	
	<!-- 스토리 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="3"/>
	<section class="today_story">
			<a href="#"><h3>스토리</h3></a>
			<table>
			<c:forEach var="list" begin="0" end="5">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
				<tr>
				</c:if>
					<td class="story">
						<a href="">
						<ul class="artist-story">
							<li class="artistStoryInfo">
								<div class="artist-storyImage">
							  		<span><img src="/classick/assets/image/user.png" /></span><!-- 판매자 이미지 -->
							  	</div>
								<div class="artistInfo">
							  		<span id="artistName">판매자 상표</span><br/> <!-- 판매자 상표 -->
							  		<span id="artistDate-story">날짜</span> <!-- 스토리 날짜 -->	
						  		</div>
					  		</li>
					  		<li class="storyContent"><p class="storyContent-Desc">[스토리컨텐츠]이 곳은 스토리의 콘텐트 영역입니다. 현재 텍스트오버플로우테스트 중으로 글자가 일정영역을 벗어나게 될 시 '...'으로 표시될 수 있도록 테스트 하는 중입니다.</p></li> <!-- 상품후기 -->
					  		<li class="artistStoryImg"><img src="/classick/assets/image/testProduct4.jpg" /></li><!-- 상품이미지 -->
					  	</ul>
				  		</a>
					</td>
				<c:if test="${i%j == j-1}">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
			</table>
			<a href="story.do" class="pProductBtn">스토리 더보기 </a>
	</section>


	<!-- 최신 작품 -->
	<c:set var="i" value="0"/>
	<c:set var="j" value="2"/>
	<section class="new_product">
		<a href="#"><h3>최신 작품</h3></a>
		<div class="newProduct">
		 <div class="productSlider">
			<c:forEach var="list" begin="0" end="19">	<!-- 20개씩 출력 변경가능 -->
			<c:if test="${i%j == 0}">
					<div>
				</c:if>
					<div class="product">
						<ul>
					  		<li id="productImg"><a href="#"><img src="/classick/assets/image/testProduct1.jpg" /></a></li><!-- 상품이미지 -->
					  		<li id="productCat"><a href="#">상주곶감 따시농형제</a></li> <!-- 카테고리 -->
					  		<li id="productName"><a href="#">쫄깃한 인생곶감 선물세트 VIP 선물세트</a></li> <!-- 상품 이름 -->
					  		<li id="productRev"><span>[상품후기]텍스트오버플로우테스트입니다.'...'으로 표시됩니다.</span></li> <!-- 상품후기 -->
					  	</ul>
					</div>
				<c:if test="${i%j == j-1}">
					</div>
				</c:if>
				<c:set var="i" value="${i+1}"/>
			</c:forEach>
		  </div>
		</div>
		<a href="newProduct.do" class="newProductBtn">최신 작품 더보기 </a>
		
	</section>


	<!-- 인기작가 -->

	<section class="popular_artist">
		<a href="#"><h3>인기 작가</h3></a>
		<div class="newArtist">
		 <div class="artistSlider">
			<c:forEach var="list" begin="0" end="8">	<!-- 20개씩 출력 변경가능 -->
				<a href="#" class="artist">
						<span>
					  		<span class="artistProfile-image">
					  			<span class="artistProductImg">
					  				<img src="/classick/assets/image/testProduct1.jpg" /><!-- 상품이미지 -->
					  			</span>
					  			<span class="artistImage">
							  		<img src="/classick/assets/image/user.png" /><!-- 판매자 이미지 -->
							  	</span>
							</span>
							<span class="artistProfile-text">
						  		<span id="artistName">쫄깃한 인생곶감 선물세트 VIP 선물세트</span><br/> <!-- 상품 이름 -->
						  		<span id="artistRat"><!-- 별점 -->
						  			<span class="ui_rating" data-ui="rating" data-value="5">
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<i class="fas fa-star" data-state="active"></i>
						  				<!-- <i class="far fa-star"></i> 빈 별 -->
						  				<!-- <i class="fas fa-star-half-alt"></i> 반 별 -->
						  			</span>
						  		</span><br/>
						  		<span id="artistComment"><span>[판매자 코맨크]<br/>여기는 판매자들의 코맨트가 들어갈 자리입니다. 현재 텍스트오버플로우테스트입니다.'...'으로 표시됩니다.4줄이 출력됩니다. 후에 삭제하십시오.</span></span> <!-- 상품후기 -->
					  		</span>
					  	</span>
				</a>
			</c:forEach>
		  </div>
		</div>
		<a href="artist.do" class="newProductBtn">인기 작가 더보기 </a>
		
	</section>



	<!-- 전체 카테고리 -->

	<section class="full_category">
		<h3><a href="productCategoryPage.do">전체 카테고리</a></h3>
		<div class="category-lower">
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=음료(커피,차 등)"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/5f2f529f8d074e2aac609d72be8cb5d7_720.jpg);"></a></div>
					<a href="productListPage.do?category=음료(커피,차 등)">음료(커피, 차 등)</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=디저트,베이커리,떡"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/fc3deaba24b24db1ac511c73db4ded05_720.jpg);"></a></div>
					<a href="productListPage.do?category=디저트,베이커리,떡">디저트, 베이커리, 떡</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=농축수산물"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/e1fc75ac0c1e42368b38896bec42d0de_720.png);"></a></div>
					<a href="productListPage.do?category=농축수산물">농축수산물</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=수제 반찬"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/ca07e43f07da4076bbdd6acd4ff51f19_720.jpg);"></a></div>
					<a href="productListPage.do?category=수제반찬">수제 반찬</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=그 외 수제먹거리"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/3abf9a181dc64296a6be30228a1fa783_720.jpg);"></a></div>
					<a href="productListPage.do?category=그 외 수제먹거리">그 외 수제먹기리</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=전통주"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/2241687c9c1446999983cdfc88196e7d_720.jpg);"></a></div>
					<a href="productListPage.do?category=전통주">전통주</a>
				</div>
			</div>
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=문구,팬시"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/de96a769d479413587822313d7a55673_720.jpg);"></a></div>
					<a href="productListPage.do?category=문구,팬시">문구, 팬시</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=휴대폰 케이스"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/ae528ca6468642df852dbb0c6efa9657_720.jpg);"></a></div>
					<a href="productListPage.do?category=휴대폰 케이스">휴대폰 케이스</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=전자기기 관련"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/0769c68fb8a94b208ca97054fe4db266_720.png);"></a></div>
					<a href="productListPage.do?category=전자기기 관련">전자기기 관련</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=꽃(생화,드라이,다육)"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/071ccdbd376a4d5e8b8d273cd7a5990e_720.jpg);"></a></div>
					<a href="productListPage.do?category=꽃(생화,드라이,다육)">꽃(생화, 드라이, 다육 등)</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=캔들,디퓨져,방향제"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/f842beb2d37b4ce5a90395cd40acd669_720.jpg);"></a></div>
					<a href="productListPage.do?category=캔들,디퓨져,방향제">캔들, 디퓨저, 방향제</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=향수,화장품,뷰티"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/75a276f2a0ca4ea6bfe8c2418811afe3_720.jpg);"></a></div>
					<a href="productListPage.do?category=향수,화장품,뷰티">향수, 화장품, 뷰티</a>
				</div>
			</div>
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=반지"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/e7737428d5534605a10702a92a36cfb9_720.jpg);"></a></div>
					<a href="productListPage.do?category=반지">반지</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=귀걸이"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/aa45a0c9b4fd44c889e65398e8238477_720.jpg);"></a></div>
					<a href="productListPage.do?category=귀걸이">귀걸이</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=목걸이"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/f3987d85397a42c281251c2473d75407_720.jpg);"></a></div>
					<a href="productListPage.do?category=목걸이">목걸이</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=팔찌"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/f851cb0a647d4e0bbbec93412ceceb09_720.png);"></a></div>
					<a href="productListPage.do?category=팔찌">팔찌</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=그 외 악세사리"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/22c074293b944371b039c1e04eb8cb63_720.jpg);"></a></div>
					<a href="productListPage.do?category=그 외 악세사리">그 외 악세사리</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=비누,천연비누"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/a14e6fa8505e4bdb9189280e57c4b6fe_720.jpg);"></a></div>
					<a href="productListPage.do?category=비누,천연비누">비누, 천연비누</a>
				</div>
			</div>
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=섬유,의류,퀄트"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/74cb1a3336dd4a4280defb29eda041cb_720.jpg);"></a></div>
					<a href="productListPage.do?category=섬유,의류,퀄트">섬유, 의류, 퀼트</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=패션잡화"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/d883a6e0a0494eb29b2f1f09f839d9e9_720.jpg);"></a></div>
					<a href="productListPage.do?category=패션잡화">패션잡화</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=인테리어 소품"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/0862ae436d204c58abd126c3ff2c1edc_720.png);"></a></div>
					<a href="productListPage.do?category=인테리어 소품">인테리어 소품</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=도자기"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/337602d60dbd4499aefe9b81299467c1_720.jpg);"></a></div>
					<a href="productListPage.do?category=도자기">도자기</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=주방,생활"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/af7db655b35342e4b5c945f5e44c9c45_720.png);"></a></div>
					<a href="productListPage.do?category=주방,생활">주방, 생활</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=가구"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/54e925f588d14ef28ddecccbd0ac674e_720.jpg);"></a></div>
					<a href="productListPage.do?category=가구">가구</a>
				</div>
			</div>
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=지갑"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/27f8c65fd16947b292f01e7d548c5008_720.jpg);"></a></div>
					<a href="productListPage.do?category=지갑">지갑(지폐, 카드 동전, 명함)</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=가방"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/a78a970465734181aaeaf7aca4c47567_720.jpg);"></a></div>
					<a href="productListPage.do?category=가방">가방, 파우치</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=시계"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/9ea403c111e14c9b93585a9ebe4f8dd3_720.jpg);"></a></div>
					<a href="productListPage.do?category=시계">시계</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=남성 수제화"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/bea5dbf8f5884cc2a88a81313d7f46fd_720.jpg);"></a></div>
					<a href="productListPage.do?category=남성 수제화">남성 수제화</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=여성 수제화"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/1a0dc71e0a0d40f9b8270ea1c3b49370_720.png);"></a></div>
					<a href="productListPage.do?category=여성 수제화">여성 수제화</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=인형,장난감"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/88073ff989f541858f7eb22136512f4e_720.jpg);"></a></div>
					<a href="productListPage.do?category=인형,장난감">인형, 장난감</a>
				</div>
			</div>
			<div class="category-row">
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=반려동물 용품"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/ed5e667257844bf1a0e735948976e488_720.jpg);"></a></div>
					<a href="productListPage.do?category=반려동물 용품">반려동물 용품</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=페인팅,캐리커쳐,캘리"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/b5fb85508b78401a935b6bafadd82ed1_720.jpg);"></a></div>
					<a href="productListPage.do?category=페인팅,캐리커쳐,캘리">페인팅, 캐리커처, 캘리</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=육아,아동"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/9aa75fe868ae46e1bc5f36bd9692f1ce_720.jpg);"></a></div>
					<a href="productListPage.do?category=육아,아동">육아, 아동</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=파인아트"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/dd5447c7af4b4561b1e05fcbcac1cf4d_720.jpg);"></a></div>
					<a href="productListPage.do?category=파인아트">파인아트</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=공예"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/d3b259608c9a4a35900ec2f41e6aeda8_720.png);"></a></div>
					<a href="productListPage.do?category=공예">공예</a>
				</div>
				<div class="category-type">
					<div class="category-img"><a href="productListPage.do?category=기타"  style="background-size:160px 90px; background-image: url(https://image.idus.com/image/files/8162642dbb194274a982bba37c63a5b2_720.jpg);"></a></div>
					<a href="productListPage.do?category=기타">기타</a>
				</div>
			</div>
		</div>
	</section>

	
<%-- footer.jsp --%>
<%@ include file="template/footer.jsp" %>