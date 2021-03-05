<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	<div class="mypage-right">
		<h1>구매내역</h1>
		<table id="orders-table">
			<thead>
				<tr>
					<!-- paging? -->
					<th>번호</th>
					<th>제품명</th>
					<th>구매일자</th>
					<th colspan="2">비고</th>
				</tr>
			</thead>
			<tbody id="orderList"></tbody>
			<tfoot class="paging"></tfoot>
		</table>
		<div class="review">
			<form id="review-form" method="POST" enctype="multipart/form-data">
				<div class="review-left">
					<p>제목</p>
					<input type="text" name="rTitle" /><br/>
					<p>내용</p>
					<textarea rows="13" cols="30" name="rContent"></textarea><br/>
					
					<div id="upload-file">
						<input type="file" name="rFile"><br/>
					</div>
					
					<div class="input-hidden">
					</div>
					<div class="btns">
						<input type="button" value="작성완료" id="btn_reviewI">
						<input type="button" value="리뷰수정" id="btn_reviewU">
				</div>
				</div>
				<div class="review-right">
					<a class="close" href="#"><i class="far fa-window-close"></i></a>
					<p>첨부 이미지</p>
					<div id="upload-img">
						
					</div>
					<!-- 
					radio 버튼 대신 별을 누르면 radio 버튼이 체크됨
					체크해주고 
					기본으로 아이콘을 주고 
					 -->
	 				<div class="star">
						<a class="starR" href="javascript:void(0);" data-rRating="5"><i class="far fa-star"></i></a>
						<a class="starR" href="javascript:void(0);" data-rRating="4"><i class="far fa-star"></i></a>
						<a class="starR" href="javascript:void(0);" data-rRating="3"><i class="far fa-star"></i></a>
						<a class="starR" href="javascript:void(0);" data-rRating="2"><i class="far fa-star"></i></a>
						<a class="starR on" href="javascript:void(0);" data-rRating="1"><i class="fas fa-star"></i></a>
						<input type="hidden" name="rRating" value="1">
					</div>					
				</div>
			</form>
		</div>
		
		<script>
			$('document').ready(function(){
				reviewInsert();
				orderList();
				reviewForm();
				reviewDelete();
				reviewView();
				reviewUpdate();
				reviewHide();
				rRating();
			});
			function rRating(){
				$('.starR').click(starClickEvent);
			}
			function starClickEvent(){
				var rRating = $(this).attr('data-rRating');
				$(this).parent().children('input:hidden[name="rRating"]').val(rRating);
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").nextAll("a").addClass("on");
				$('.starR').html('<i class="far fa-star"></i>');
				$('.on').html('<i class="fas fa-star"></i>');
			}
			//날짜 변환 함수
			function dateConverter(millisec){
				var date = new Date(millisec);
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				return year+'년 '+month+'월 '+day+'일';
			}
			function reviewHide(){
				$('.close').click(function(){
					$('.review').hide();	
				});
			}
			function orderList(page){
				var mNo = ${memberDto.MNo};
				if(typeof page == 'undefined'){
					var	page = 1;
				}
				sendObj = {
					'mNo' : mNo,
					'page' : page
				}
				$.ajax({
					url: 'orders',
					type: 'post',
 					data: JSON.stringify(sendObj),
 					contentType: 'application/json',
 					dataType: 'json',
 					success: function(responseObj) {
 						if (responseObj.list != null ) {
 							var list = responseObj.list;
 								$('#orderList').empty();
 							$.each(list, function(idx, map){
 								if(map.rNoMap.RNO == 0){
									$('<tr>')
	 								.append( $('<td>').html( (page-1)*5+idx+1))
	 								.append( $('<td>').html(map.PNAME))
	 								.append( $('<td>').html( dateConverter(map.ODATE) ))
	 								.append( $('<td colspan="2">').html('<input type="button" value="리뷰작성" id="btn_visableR" /><input type="button" value="리뷰삭제" id="btn_ReviewD" /><input type="hidden" value="'+map.PNO+'" name="pNo"/><input type="hidden" value="'+map.ONO+'" name="oNo"/>') )
	 								.appendTo($('#orderList') );
								}else{
									$('<tr>')
	 								.append( $('<td>').html( (page-1)*5+idx+1))
	 								.append( $('<td>').html(map.PNAME))
	 								.append( $('<td>').html( dateConverter(map.ODATE) ))
	 								.append( $('<td colspan="2">').html('<input type="button" value="리뷰확인" id="btn_reviewV" /><input type="button" value="리뷰삭제" id="btn_ReviewD" /><input type="hidden" value="'+map.PNO+'" name="pNo"/><input type="hidden" value="'+map.ONO+'" name="oNo"/><input type="hidden" value="'+map.rNoMap.RNO+'" name="rNo"/>') )
	 								.appendTo($('#orderList') );
								}
 							});
 							$('.paging').empty();
 							$('<tr>')
 							.append($('<td colspan="5">').html($(responseObj.paging)))
 							.append('<input type="hidden" value="'+responseObj.page+'" name="page">')
 							.appendTo($('.paging'));
							$(".goPage").click(function(){
								page = $(this).attr("data-page");
								orderList(page);
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
			function reviewForm(){
				$('body').on('click', '#btn_visableR', function(){
					var pNo = $(this).parents('tr').find('input:hidden[name="pNo"]').val();
					var oNo = $(this).parents('tr').find('input:hidden[name="oNo"]').val();
					$('.input-hidden').html('<input type="hidden" value="'+pNo+'" name="pNo" /><input type="hidden" value="'+oNo+'" name="oNo" />');					
					$('#upload-img').hide();
					$('input:text[name="rTitle"]').val("");
					$('textarea[name="rContent"]').val("");
					$('input:file[name="rFile"]').val("");
					$('#btn_reviewI').show();
					$('#btn_reviewU').hide();
					$('.review').show();
					starViewEvent(1);
				});
			}
			function reviewInsert(){
				
				$('#btn_reviewI').click(function(){
					var mNo = ${memberDto.MNo};
					var pNo =  $(this).parents('form').find('input:hidden[name="pNo"]').val();
					var oNo =  $(this).parents('form').find('input:hidden[name="oNo"]').val();
					var page = $('.paging').find('input:hidden[name="page"]').val();
					var rRating = $('.star').find('input:hidden[name="rRating"]').val();
					var formData = new FormData();
					formData.append('rTitle', $('input:text[name="rTitle"]').val() );
					formData.append('rContent', $('textarea[name="rContent"]').val() );
					formData.append('rFile', $('input:file[name="rFile"]')[0].files[0]);
					formData.append('mNo', mNo);
					formData.append('pNo', pNo);
					formData.append('oNo', oNo);
					formData.append('rRating', rRating);
					$.ajax({ 
						url: 'review', 
						data: formData, 
						processData: false, 
						contentType: false, 
						type: 'POST', 
						success: function(data){ 
							alert('리뷰가 작성되었습니다.');
							orderList(page);
							$('.review').hide();
						},
						error: function(){
	 						alert('통신실패');
	 					}
					});
				});
			}	
			function reviewView(){
				$('body').on('click', '#btn_reviewV', function(){
					var rNo = $(this).parents('tr').find('input:hidden[name="rNo"]').val();
					$.ajax({
						url:'review/' +rNo,
						type: 'get',
						dataType: 'json',
						success: function(responseObj){
							var reviewDto = responseObj.reviewDto;
							$('input:text[name="rTitle"]').val(reviewDto.rtitle);
							$('textarea[name="rContent"]').val(reviewDto.rcontent);
							starViewEvent(reviewDto.rrating);
							
							if(reviewDto.rfilename == null){
								$('#upload-img').html('업로드 된 이미지가 없습니다.');
							}else{
								$('#upload-img').show();
								$('#upload-img').html('<img alt="업로드 된 이미지" class="review-img" src="storage/'+reviewDto.rfilename+'"/><input type="hidden" name="rFilename" value="'+reviewDto.rfilename+'" />');
							}
								$('.input-hidden').html('<input type="hidden" name="rNo" value="'+reviewDto.rno+'" />');
							$('#btn_reviewI').hide();
							$('#btn_reviewU').show();
							$('.review').show();
						},
						error: function(){
							alert('ajax 통신실패');
						}
					});
					
				});
			}
			function starViewEvent(rRating){
				$('a[data-rRating='+rRating+']').trigger('click');
			}
			function reviewUpdate(){
				$('#btn_reviewU').click(function(){
					var rNo = $(this).parents('form').find('input:hidden[name="rNo"]').val();
					var rFilename = $(this).parents('form').find('input:hidden[name="rFilename"]').val();
					var rTitle =  $(this).parents('form').find('input:text[name="rTitle"]').val();
					var rContent =  $(this).parents('form').find('textarea[name="rContent"]').val();
					var rRating = $(this).parents('form').find('input:hidden[name="rRating"]').val();
					var page = $('.paging').find('input:hidden[name="page"]').val();
					
					var formData = new FormData();
					formData.append('rTitle',  rTitle);
					formData.append('rContent',  rContent);
					formData.append('rFile', $('input:file[name="rFile"]')[0].files[0]);
					formData.append('rNo', rNo);
					formData.append('rFilename', rFilename);
					formData.append('rRating', rRating);
					$.ajax({
						url: 'reviewUpdate', 
						data: formData, 
						processData: false, 
						contentType: false, 
						type: 'POST',
	 					success: function(responseObj){
	 						// rNo를 그대로 넘겨서 reviewView 실행
	 						alert('업로드 성공');
	 						orderList(page);
	 						$('.review').hide();
	 					},
	 					error: function(){
	 						alert('ajax통신실패');
	 					}
					});
				});
			}
			function reviewDelete(){
				$('body').on('click', '#btn_ReviewD', function(){
					if(confirm('리뷰를 삭제하시겠습니까?')){
						var mNo = ${memberDto.MNo};
						var oNo =  $(this).parents('tr').find('input:hidden[name="oNo"]').val();
						var page = $('.paging').find('input:hidden[name="page"]').val();
						sendObj = {
							'mNo' : mNo,
							'oNo' : oNo,
							'page': page
						};
						$.ajax({
							url: 'review',
							type:'delete',
							data: JSON.stringify(sendObj),
		 					contentType: 'application/json',
		 					dataType: 'json',
		 					success: function(responseObj){
		 						//page 받아올것
		 						if(responseObj.result == 1){
		 							alert('리뷰가 삭제되었습니다.');
			 						orderList(responseObj.page);
		 						}else{
		 							alert('삭제할 리뷰가 없습니다.');
		 						}
		 						// 파일 삭제 기능 추가
		 					},
		 					error: function(){
		 						alert('ajax통신실패');
		 					}
						});
					}
				});
				
			}
			
		</script>
	
	</div>
	</div>
	 </div><!-- mypage-body-wrap -->
</div> <!-- /body-wrap -->
 



<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>