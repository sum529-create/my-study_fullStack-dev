<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	<div class="mypage-right">
		<h1>리뷰페이지</h1>
		<div class="review-wrap">
			<div id="reviewList">
			</div>
			<div class="paging">
				
			</div>
		</div>
				
	</div>
	<script>
		$('document').ready(function(){
			reviewList();
			
		});
		function star(r, s){
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
		function reviewList(page){
			var mNo = ${memberDto.MNo};
			if(typeof page == 'undefined'){
				var	page = 1;
			}
			var sendObj = {
					'mNo' : mNo,
					'page' : page
			}
			$.ajax({
				url:'reviewList',
				type: 'post',
				data: JSON.stringify(sendObj),
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj){
					if (responseObj.list != null ) {
							var list = responseObj.list;
							$('#reviewList').empty();
							$.each(list, function(idx, map){
								
								var s = '';
								$('#reviewList').append('<div class="r-form" id="review-'+idx+'"></div>');
								if(map.RFILENAME == '' || map.RFILENAME == null || map.RFILENAME == 'undefined'){
									$('<div class="r-left">')
									.appendTo($('#review-'+idx));
								}else{
									$('<div class="r-left">')
									.append( '<img alt="업로드 된 이미지" class="reviewList-img" src="storage/'+map.RFILENAME+'"/>' )
									.appendTo($('#review-'+idx));
								}
								$('<div class="r-right">')
								.append( $('<p>').html(map.PNAME) )
								.append( $('<p>').html(map.RTITLE) )
								.append( $('<pre>').html(map.RCONTENT) )
								.append( $('<p>').html( star(map.RRATING, s) ) )
								.appendTo($('#review-'+idx));
							});
							$('.paging').empty();
							$('<div>')
							.append(responseObj.paging)
							.append('<input type="hidden" value="'+responseObj.page+'" name="page">')
							.appendTo($('.paging'));
						$(".goPage").click(function(){
							page = $(this).attr("data-page");
							reviewList(page);
						});
					}
				},
				error: function (){
					alert('통신실패');
				}
			});
			
			
			
			
		}
	</script>
	</div>
	 </div><!-- mypage-body-wrap -->
</div>
<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>	