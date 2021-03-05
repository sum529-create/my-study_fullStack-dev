<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
<script>
	$(document).ready(function(){
		$('.product-length').css("width", 200 * '${productList.size()}');
		fn_review();
		fn_animate_right();
		fn_animate_left();
	});
	function fn_review(){
		var aNo = ${artistDto.ANO};
		$.ajax({
			url:'artistReview/'+aNo,
			type: 'get',
			dataType: 'json',
			success: function(responseObj){
				var list = responseObj.reviewList;
				$.each(list, function(idx, map){
					var r = map.RRATING;
					$('.artist-review-list').append('<div class="artist-r-form" id="r-form-'+idx+'"></div>');
					$('<div id="r-left-'+idx+'">')
					.append('<img src="storage/'+map.RFILENAME+'">')
					.appendTo($('#r-form-'+idx+''));
					$('<div id="r-right-'+idx+'">') 
					.append('<p> 작품명: '+map.PNAME+'</p>')
					.append('<p>'+map.RTITLE+'</p>')
					.append('<p>'+map.RCONTENT+'</p>')
					.append('<p>'+fn_star(r)+'</p>')
					.appendTo($('#r-form-'+idx+''));
				});	
			},
			error: function(){
				alert('ajax실패');
			}
		});
		
		}

	function fn_star(r){
		var s = '';
			if(r < 5){
				for(var i = 0; i < r ; i++){
					// 꽉찬별
					s += '<i class="fas fa-star"></i>';
				}
				for(var i = 0 ; i < 5-r ; i++){
					s += '<i class="far fa-star"></i>';
				}
			}else{
				for(var i = 0; i < 5 ; i++){
					s += '<i class="fas fa-star"></i>';
				}
			}
			return s;
		}
	function fn_animate_left(count){
		$('#artist-h-btn-left').click(function(){
			idx = $('.product-length').css('right').indexOf('px');
			var count =parseInt($('.product-length').css('right').substr(0, idx));
			if(count <= 0){
				count = 0;
			}else{
				count -= 200;
			}
			$('.product-length').animate({right:count}, 500);
			
		});
	}
	function fn_animate_right(){
		$('#artist-h-btn-right').click(function(){
			idx = $('.product-length').css('right').indexOf('px');
			var count =parseInt($('.product-length').css('right').substr(0, idx));
			if(count >= (200 * '${productList.size()}') - 800){
				count =(200 * '${productList.size()}') - 800;
			}else{
				count += 200;
			}
			$('.product-length').animate({right:count}, 500);
		});
	}
</script>
<div class="body-section">
	<div class="side-info">
		<div class="artist-profile-section">
			<div class="home-artist-img">
				<img src="storage/${artistDto.AIMAGE }">
			</div>
			<p>${artistDto.ANAME }</p>
			<pre>
			<!-- 작가 정보 -->
			${artistDto.ACOMMENT}
			</pre>
		</div>
		<p id="sub-info-title">활동정보</p>
		<div class="sub-artist-info">
			<div class="s-a-i-left">
				판매된 작품:<br/>
				판매중인 작품:<br/>
				구매후기:<br/>
			</div>
			<div class="s-a-i-right">
				${artistDto.C}<br/>
				${countProductList}<br/>
				${countReviewList}<br/>
			</div>
			
			
				<!-- 판매량
				판매물품수 -->
			
		</div>
	</div>
	<div class="artist-main-content">
		<div class="artist-banner">
			<img src="storage/${artistDto.BIMAGE }">
		</div>
		<div class="artist-list-content">
			<div class="artist-sub-title">
				작품 목록
				<div class="btns-home-moveBtn">
					<button class="artist-btns" id="artist-h-btn-left"><i class="fas fa-caret-left fa-2x"></i></button>
					<button class="artist-btns" id="artist-h-btn-right"><i class="fas fa-caret-right fa-2x"></i></button>
				</div>
			</div>
			
			<div class="artist-home-product-list">
				<!-- 제품 이미지만 한 줄에 표시 좌로 스크롤 -->
				<div class="product-length">
					<c:forEach begin="0" end="${productList.size()-1}" varStatus="k">
					<c:set var="pImgStr" value="${fn:substringBefore(productList.get(k.index),'&')}"/>
							<a href=""><img src="/classick/resources/storage/product/${pImgStr}"></a>
					</c:forEach>
				</div>
			</div>
			<div class="artist-sub-title">
				리뷰 목록
			</div>
			<div class="review-frame">
				<div class="artist-review-list">
					<!-- overflow hidden scroll -->
						
				</div>
			</div>
		</div>
	</div>
</div>





</div> <!-- /body-wrap -->
</div> <!-- /body-wrap -->
<%@ include file="footer.jsp" %>