<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/mypage.css" />

<%-- jQuery --%>
<script type="text/javascript">
	
	// 프로필 이미지 변경 이벤트
	function changeValue(obj){
	    document.signform.submit();
	}
	// 등급 이미지 변경
 	function grade(){
 		var mGrade = '${memberDto.MGrade}';
 		if(mGrade=='브론즈'){
 			$('.medal').find($('.fa-medal')).css('color', '#A0522D');
 		}else if(mGrade=='실버'){
 			$('.medal').find($('.fa-medal')).css('color', '#C0C0C0');
 		}else{
 			$('.medal').find($('.fa-medal')).css('color', '#DAA520');
 		}
 	} 
 	$(document).ready(function(){
		$('#profile').click(function (e) {
		    $('#file').click();
		});
		grade();
		fn_artistMenu();
	});
 	function fn_artistMenu(){
		var mNo = ${memberDto.MNo};
		$.ajax({
			url:'role/' + mNo,
			type:'get',
			dataType: 'json',
			success: function(resultMap){
				if(resultMap.isArtist.ROLE == 'ARTIST'){
					$('.menu-section ul').append('<li class="bold">작가 메뉴</li><li><a href="artistHomeBanner.do?mNo='+mNo+'">작가홈 수정</a></li>');
				}else{
				}
			},
			error:function(){
				alert('작가ajax실패');
			}
		});
	}
</script>
	<div class="mypage-wrap">
	<div class="mypage-body-wrap">
	<div class="mypage-left">
		<div id="profile-section">
			<c:if test="${empty memberDto.MPFilename}">
		   	 <img id = "profile" src="images/user-solid.svg">
			</c:if>
			<c:if test="${not empty memberDto.MPFilename}">
				<!-- 프로필 설정시 해당 이미지 가져오기 -->
			    <img id = "profile" src="resources/storage/${memberDto.MPFilename}">
			</c:if>
			<br/>
			<div id="grade">
				<div class="medal">
		 			<i class="fas fa-medal"></i>
				</div>
			 	<div>
			 		<a id="go-main" href="myMainPage.do?mNo=${memberDto.MNo}">${memberDto.MGrade}</a>
			 	</div>
			 	
			</div>
			<div id="myMenu">
				<p>MY MENU</p>
			</div>
		</div>
		<form name="signform" method="POST" enctype="multipart/form-data" action="fileUpload.do">
		    <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)" />
		    <input type="hidden" name ="mNo" value="${loginDto.MNo}" />
<%-- 		    <input type="hidden" name ="mNo" value="${memberDto.MNo}" /> --%>
		    <!-- <input type="hidden" name = "target_url" /> -->
		</form>
	 	<div class="menu-section">
	 		<ul>
	 			<li class="bold">내 정보</li>
	 			<li><a href="myInfoPage.do">회원 정보 관리</a></li>
	 			<li><a href="myAddrPage.do">주소 관리</a></li>
	 			<li><a href="myPaymentPage.do">결제수단 관리</a></li>
	 			<li class="bold">내 구매</li>
	 			<li><a href="myOrdersPage.do">구매내역</a></li>
	 			<li><a href="myReviewList.do">내 리뷰</a></li>
	 		</ul>
	 	</div>
	</div> <!-- /left -->