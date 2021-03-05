<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
	<div class="mypage-right">
		<!-- 
			ajax 통신을 사용한 배너 교체 작업
			업로드와 동시에 보는 이미지가 바뀌게 해주어야함
			업로드 후 수정된 이름을 결과로 가져온다.
		 -->
		 <h1>작가홈 미리보기</h1>
		 <div class="preview-artist-home">
		 	<div class="preview-artist-profile">
		 		<div class="preview-artist-img"></div>
		 		<p class="preview-artist-name"></p>
		 		<p class="preview-artist-comment"></p>
		 	</div>
		 	<div class="preview-artist-banner">
		 	
		 	</div>
		 </div>
		 <form id="artist-form" method="POST" enctype="multipart/form-data">
		 	<table>
		 		<caption>작가홈 업로드</caption>
		 		<tbody>
		 			<tr>
		 				<th>작가 이미지</th>
		 				<td>
							 <input type="file" name="artist-img" value="작가 프로필">
		 				</td>
		 			</tr>
		 			<tr>
		 				<th>작가 소개</th>
		 				<td>
		 					<textarea rows="10" cols="5" name="aComment"></textarea>
		 				</td>
		 			</tr>
		 			<tr>
		 				<th>홈 배너</th>
		 				<td>
							 <input type="file" name="banner" value="작가홈 배너">
		 				</td>
		 			</tr>
		 		</tbody>
		 		<tfoot>
		 			<tr>
		 				<td colspan="2">
							 <input type="button" value="업데이트" id="update-banner"/>
		 				</td>
		 			</tr>
		 		</tfoot>
		 	</table>
		 </form>
		 <!-- 작가 정보와 작가 이미지도 수정할 수 있게 만들어줘야함 -->
	</div>

</div> <!-- /body-wrap -->
</div> <!-- /body-wrap -->
</div> <!-- /body-wrap -->
<script>
	$('document').ready(function(){
		fn_update_banner();
		fn_banner();
	});
	function fn_banner(){
		var mNo = ${memberDto.MNo};
		$.ajax({
			url: 'banner/' + mNo, 
			dataType: 'json',
			type: 'get',
				success: function(resultMap){
					$('.preview-artist-banner').html('<img src="storage/'+resultMap.map.BIMAGE+'">');
					$('.preview-artist-img').html('<img src="storage/'+resultMap.map.AIMAGE+'">');
					$('.preview-artist-name').html(resultMap.map.ANAME);
					$('.preview-artist-comment').html(resultMap.map.ACOMMENT);
				},
				error: function(){
					alert('ajax통신실패');
				}
		});
	
	}
	function fn_update_banner(){
		$('#update-banner').click(function(){
			var mNo = ${memberDto.MNo};
			var aComment = $('textarea[name="aComment"]').val();
			var formData = new FormData();
			formData.append('mNo', mNo);
			formData.append('bFile', $('input:file[name="banner"]')[0].files[0]);
			formData.append('aFile', $('input:file[name="artist-img"]')[0].files[0]);
			formData.append('aComment', aComment);
			$.ajax({
				url: 'banner', 
				data: formData, 
				processData: false, 
				contentType: false, 
				dataType: 'json',
				type: 'POST',
				success: function(resultMap){
					
					$('.preview-artist-img').html('<img src="storage/'+resultMap.aImage+'">');
					$('.preview-artist-comment').html(resultMap.aComment);
					$('.preview-artist-banner').html('<img src="storage/'+resultMap.bImage+'">');
				},
				error: function(){
					alert('작가 소개가 너무 길거나 파일이 업로드 되지 않았습니다.');
				}
			});
		});
	}
</script>
<%-- footer.jsp --%>
<%@ include file="footer.jsp" %>