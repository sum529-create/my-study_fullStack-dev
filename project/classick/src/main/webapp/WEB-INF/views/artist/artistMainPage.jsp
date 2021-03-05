<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>

	 <div class="artist-main-banner">
	 인기작가
	 </div>
	 <div class="artist-main-inner">
	 	<div id="tab-artist">
		 	<a id="artistList" class="active">인기작가</a>
		 	<a id="artistSearchTab">작가검색</a>
	 	</div>
	 	<ul class="artistList"></ul>
	 	<div class="art-main-search-form">
	 		<div class="art-main-window">
	 			<div class="art-main-search">
	 				<input type="text" id="artist-search-p" name="artistSearch" placeholder="찾고 싶은 작가님을 검색해보세요!">
	 			</div>
	 			<div class="art-main-search-button">
	 				<button id="art-main-search-btn"><i class="fas fa-search"></i></button>
	 			</div>
	 		</div>
	 		<div class="art-main-search-list">
	 			<ul id="art-main-result-list"></ul>
	 		</div>
	 	</div>
	 	<div class="art-main-center">
	 		<div class="art-main-paging"></div>
	 	</div>
	 	
	 </div>
<script>
	$(document).ready(function (){
		fn_artistList();	
		fn_animationLeft();
		fn_animationRight();
		fn_artistSearchTab();
		fn_artistListTab();
		search();
		fn_artistHome();
	});
	function fn_artistHome(){
		$('body').on('click', '.go-artistHome', function(){
			var aNo = $(this).parents().find($('input:hidden[name="aNo"]')).val();
			location.href='artistHomePage.do?aNo='+aNo;
		});
	}
	function fn_artistListTab(){
		 $('#artistList').click(function(e){
			e.preventDefault();
			$('.artistList').show();
			$('.art-main-center').show();
			$('.art-main-search-form').hide();
			$('#artistSearchTab').removeClass('active');
			$('#artistList').addClass('active');
		});
	} 
	  
	function fn_artistSearchTab(){
		$('#artistSearchTab').click(function(){
			$('.artistList').hide();
			$('.art-main-center').hide();
			$('.art-main-search-form').show();
			$('#artistList').removeClass('active');
			$('#artistSearchTab').addClass('active');
		});
	}
	function search(){
		$('#art-main-search-btn').click(function(){
			var p = $('#artist-search-p').val();
			if(p == null || typeof p == 'undefined' || p == '' || p == ' '){
				return;
			}
			$.ajax({
				url: 'search/' + p,
				type: 'get',
				dataType: 'json',
				success: function(responseObj){
					var list= responseObj.list;
					$('#art-main-result-list').empty();
					$.each(list, function(idx, artistDto){
						$('<li>')
						.append('<img class="art-main-search-img" src="storage/'+artistDto.aimage+'" />')
						.append('<a href="artistHomePage.do?aNo='+artistDto.ano+'">'+artistDto.aname+'</a>')
						.appendTo($('#art-main-result-list'));
						if(idx % 4 == 3){
							$('#art-main-result-list').append('<br>');
						}
					});
				},
				error: function(){
					alert('ajax 실패');
				}
			});
		});
		$("#artist-search-p").keydown(function(key) {
			if (key.keyCode == 13) {
				var p = $('#artist-search-p').val();
				if(p == null || typeof p == 'undefined' || p == '' || p == ' '){
					console.log('null처리');
					return;
				}
				$.ajax({
					url: 'search/' + p,
					type: 'get',
					dataType: 'json',
					success: function(responseObj){
						var list= responseObj.list;
						$('#art-main-result-list').empty();
						if(list.length == 0){
							$('#art-main-result-list').append('<li>작가님을 찾을 수 없습니다.</li>');
						}else{
							$.each(list, function(idx, artistDto){
								$('<li>')
								.append('<img class="art-main-search-img" src="storage/'+artistDto.aimage+'" />')
								.append('<a href="artistHomePage.do?aNo='+artistDto.ano+'">'+artistDto.aname+'</a>') //표시
								.appendTo($('#art-main-result-list'));
								if(idx % 4 == 3){
									$('#art-main-result-list').append('<br/>');
								}
							});
						}
					},
					error: function(){
						alert('ajax 실패');
					}
				});

			}
		});
	}
	
	function fn_animationLeft(){
		$('body').on('click', '#art-product-left', function(){
			var p = $(this).attr('data-left');
			$('[data-index="'+p+'"]').children().animate({left:0}, 1000);
		});
	}
	function fn_animationRight(){
		$('body').on('click', '#art-product-right', function(){
			var p = $(this).attr('data-right');
			$('[data-index="'+p+'"]').children().animate({left:-672}, 1000);
		});
	}
	function star(r){
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
	
	function fn_artistList(page){
		if(typeof page == 'undefined'){
			page = 1;
		}
		$.ajax({
			url:'artist/'+page,
			type: 'get',
			dataType: 'json',
			success: function(responseObj){
				if (responseObj.list != null ) {
						var list = responseObj.list;
							$('.artistList').empty();
						$.each(list, function(idx, map){
							$('<li class="artist-list-form">')
							.append(
								$('<div class="card-style-profile">')
								.append($('<div class="artist-image">').append('<a href="javascript:void(0)"><img src="storage/'+map.AIMAGE+'" /></a>'))
								.append(
										$('<div class="artist-info">')
										.append('<a href="javascript:void(0)">'+map.ANAME+'</a>')
										.append('<div class="star">'+star(map.ARATING)+'</div>')
										.append('<p>'+map.ACOMMENT+'</p>')
										.append('<input type="hidden" value="'+map.ANO+'" name="aNo">')
										.append('<a class="go-artistHome" href="javascript:void(0)">작가 홈</a>')
								)	
							)
							.append(
									$('<div class="artist-product-list" data-param="'+idx+'">')
									.append($('<div class="list-btns">')
											.append('<button id="art-product-left" data-left="'+idx+'"><i class="fas fa-caret-left fa-2x"></i></button>')
											.append('<button id="art-product-right" data-right="'+idx+'"><i class="fas fa-caret-right fa-2x"></i></button>')
									)
							)
							.appendTo($('.artistList'));
							$('<div class="artist-slide-img" data-index="'+idx+'">')
							.appendTo($('[data-param="'+idx+'"]'));
							var t = 4;
							var p = 0;
							$.each(map.PRODUCTLIST, function(i, product){
								if( (i+1)%t == 1){
									$('[data-index="'+idx+'"]').append('<li data-list="'+p+'">');
								}
								var pImage = product.PIMAGE.replace('&', '');
								$('[data-index='+idx+']').find('[data-list='+p+']').append('<a href="javascript:void(0)"><img src="/classick/resources/storage/product/'+pImage+'"></a>');
								if( (i%t) == 3){
									p++;
								}
							
							});
						});
						$('.art-main-paging').empty();
						$('<tr>')
						.append($('<td colspan="5">').html($(responseObj.paging)))
						.append('<input type="hidden" value="'+responseObj.page+'" name="page">')
						.appendTo($('.art-main-paging'));
						
					$(".goPage").click(function(){
						page = $(this).attr("data-page");
						fn_artistList(page);
					});
					} else {
						alert('결제수단 등록에 실패했습니다.');
					}
				},
			error: function(){
				alert('통신실패');
			}
		});
	}
	
</script>

</div> <!-- /body-wrap -->
</div> <!-- /body-wrap -->
<%@ include file="footer.jsp" %>