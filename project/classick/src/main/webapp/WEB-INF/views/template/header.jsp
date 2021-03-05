<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "환영합니다";
	}
	pageContext.setAttribute("title", title);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=0" viewport-fit="cover">
<title>${title}</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>

<%-- CSS --%>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/common.css" />
<link rel="stylesheet" type="text/css" href="/classick/assets/style/header.css" />
<link rel="stylesheet" type="text/css" href="/classick/assets/style/index.css" />
<link rel="stylesheet" type="text/css" href="/classick/assets/style/footer.css" />
<style>
	#logoutBtn, #signoutBtn, #adminBtn, #productInBtn{
		color: #666666;
		font-size:0.625em;
		background: white;
	}
	#logoutBtn:hover, #signoutBtn:hover, #adminBtn:hover, #productInBtn:hover, #adminPage:hover {
		font-weight: 900;
	}
</style>

<%-- bxslider --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<%-- fontAwesome --%>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<%-- jQuery --%>
<script type="text/javascript">
	
	// 로그아웃
	function fn_logout() {
		if (confirm('로그아웃 하시겠습니까?')) {
			location.href='memberLogOut.do';
		}
	}
	// 회원탈퇴
	function fn_signOutPage() {
		location.href = 'signOutPage.do';
	}
	// 관리자
	function fn_adminPage() {
		location.href='adminPage.do';
	}

	// 스크롤시 메뉴 바 고정
	$(function(){
		$(window).scroll(function(){  //스크롤하면 아래 코드 실행
		       var num = $(this).scrollTop();  // 스크롤값
		       if( num > 57 ){  // 스크롤을 57이상 했을 때
		          $(".nav").css("top","0");
		          $(".nav").css("height","39px");
		          $(".nav").css("position","fixed");
		          $(".to-top").css("visibility","visible");
		       }else{
		          $(".nav").css("top","95px");
		           $(".nav").css("position","absolute");
		          $(".to-top").css("visibility","hidden");
		       }
		  });
		});

	// 제품 검색
	function fn_both(f) {
		f.action = 'searchBoth.do';	// 제목 + 내용
		f.submit();
	}
	
</script>

</head>

<body>

<%-- Header 작성 페이지 --%>
	<div class="wrap">
		<div class="head-wrap">
			<!-- logo -->
			<div class="top-nav">
				<!-- logo -->
				<h1 class="logo"><a href="index.do"><img src="assets/images/classickLogo.png"></a></h1>
				<%-- 검색창 --%>
				<form id="search">
					<input type="text" name="query" class="form-text" placeholder="상품을 검색해보세요"/>
					<input type="button" class="img-button"  onclick="fn_both(this.form)" /> 
					<!-- search 아이콘이미지는 따로 i태그가 아닌 url로 넣었습니다. -->
				</form>
				<div class="header-nav">
					<%-- 1. 로그인 안된 상태 --%>
					<c:if test="${loginDto eq null}">
						<%--  이동확인위한 테스트
						<a href="adminPage.do">관리자페이지</a> --%>
						
						<a href="loginPage.do">로그인</a>
						<a href="memberSignListUp.do">회원가입</a>
						<div class="dropdown">
							<a href=""><span class="serviceSpan">고객센터</span></a> <!-- <a> -> 빈 주소, 손가락 아이콘이 나오기위함 -->
							<div class="service-content">
								<a href="noticeListPage.do">공지사항</a>
								<a href="faqListPage.do">자주묻는질문</a>
								<a href="mailto:sum529@naver.com">메일로 문의</a>
							</div>
						</div><br/>
						<nav class="member-nav">
							<ul>
								<li class="member-info"><a href="loginPage.do"><i class="fas fa-user fa-2x" style="padding-left:10px;"></i><br/>내 정보</a></li>
								<li clfass="cart-info"><a href="loginPage.do"><span class="cart-counter">0</span><i class="fas fa-shopping-basket fa-2x" style="padding-left:10px;"></i><br/>장바구니</a></li>
							</ul>
						</nav>
					</c:if>
					<%-- 2. 로그인 된 상태 --%>
					
					<c:if test="${loginDto ne null}">
						<%-- <input type="button" value="로그아웃" id="logoutBtn" onclick="fn_logout()"/>
						<!-- <input type="button" value="회원탈퇴" id="signoutBtn" onclick="fn_signOutPage()"/> -->
						
						<!-- 권한 부분 작업 -->
						<c:if test="${loginDto.role eq 'ADMIN'}"> 
							<input type="button" value="관리자 페이지" id="adminBtn" onclick="fn_adminPage()" />
						</c:if>
						<c:if test="${loginDto.role eq 'ARTIST'}">
							<input type="button" value="상품등록" id="productInBtn" onclick="location.href='productInsertPage.do'" />
						</c:if> --%>
						
						<div class="dropdown">
						<a href=""><span class="dropdownSpan red">${loginDto.MName}님 환영합니다.</span></a> <!-- <a> -> 빈 주소, 손가락 아이콘이 나오기위함 -->
							<div class="service-content">
						<c:if test="${loginDto.role eq 'ADMIN'}"> 
								<a href="adminPage.do">관리자 페이지</a>
						</c:if>
						<c:if test="${loginDto.role eq 'ARTIST'}">
								<a href="productInsertPage.do">상품 등록</a>
						</c:if>
								<a href="order.do">주문배송</a>
								<a href="myInfoPage.do?mNo=${loginDto.MNo}">회원 정보관리</a>
								<a href="javascript:void(0);" onclick="fn_logout()">로그아웃</a>
								<%-- <a href="signOutPage.do">회원 탈퇴</a> // 회원정보에서 회원탈퇴 --%>
							</div>
						</div>
						<div class="dropdown">
							<a href=""><span class="dropdownSpan">고객센터</span></a> <!-- <a> -> 빈 주소, 손가락 아이콘이 나오기위함 -->
							<div class="service-content">
								<a href="noticeListPage.do">공지사항</a>
								<a href="faqListPage.do">자주묻는질문</a>
								<a href="mailto:sum529@naver.com">메일로 문의</a>
							</div>
						</div><br/>
						
						<nav class="member-nav">
							<ul>
								<!-- <li class="member-info"><a href="myMainPage.do"><i class="fas fa-user fa-2x" style="padding-left:10px;"></i><br/>내 정보</a></li>
								<li class="cart-info"><a href="cartListPage.do"><span class="cart-counter">0</span><i class="fas fa-shopping-basket fa-2x" style="padding-left:10px;"></i><br/>장바구니</a></li> -->
								<li class="member-info"><a href="myMainPage.do?mNo=${loginDto.MNo}"><i class="fas fa-user fa-2x" style="padding-left:10px;"></i><br/>내 정보</a></li>
								<li class="cart-info">
									<a href="cartListPage.do">
										<span class="cart-counter">${itemCount != 0? itemCount : 0}</span>
										<i class="fas fa-shopping-basket fa-2x" style="padding-left:10px;"></i><br/>
										장바구니
									</a>
								</li>
							</ul>
						</nav>
					</c:if>
					</div> <!-- header-nav -->
			</div> <!-- top-nav -->
			<!-- menu nav -->
			<div class="nav">
				<div class="nav-menu">
					<ul>
					    <li class="menu">
					    	<div class="menuDropdown">
					        	<a href="productCategoryPage.do">카테고리</a> <!-- <a> -> 빈 주소, 손가락 아이콘이 나오기위함 -->
					        	<div class="category-content">
					        		<ul>
						        		<li class="category-product"><a href="productListPage.do?category=음료(커피,차 등)">음료 (커피, 차 등)</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=디저트,베이커리,떡">디저트, 베이커리, 떡</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=농축수산물">농축수산물</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=수제반찬">수제 반찬</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=그 외 수제먹거리">그 외 수제먹거리</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=전통주">전통주</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=문구,팬시">문구, 팬시</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=휴대폰 케이스">휴대폰 케이스</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=전자기기 관련">전자기기 관련</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=꽃(생화,드라이,다육)">꽃 (생화, 드라이, 다육 등)</a><i class="fas fa-greater-than"></i></li>
									</ul>
									<ul>
						        		<li class="category-product"><a href="productListPage.do?category=캔들,디퓨져,방향제">캔들, 디퓨저, 방향제</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=향수,화장품,뷰티">향수, 화장품, 뷰티</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=반지">반지</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=귀걸이">귀걸이</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=목걸이">목걸이</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=팔찌">팔찌</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=그 외 악세사리">그 외 악세사리</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=비누,천연비누">비누, 천연 비누</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=섬유,의류,퀄트">섬유, 의류, 퀼트</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=패션잡화">패션잡화</a><i class="fas fa-greater-than"></i></li>
									</ul>
									<ul>
						        		<li class="category-product"><a href="productListPage.do?category=인테리어 소품">인테리어 소품</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=도자기">도자기</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=주방,생활">주방, 생활</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=가구">가구</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=지갑">지갑 (지폐, 카드, 동전, 명함)</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=가방">가방, 파우치</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=시계">시계</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=남성 수제화">남성 수제화</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=여성 수제화">여성 수제화</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=인형,장난감">인형, 장난감</a><i class="fas fa-greater-than"></i></li>
									</ul>
									<ul>
						        		<li class="category-product"><a href="productListPage.do?category=반려동물 용품">반려동물 물품</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=페인팅,캐리커쳐,캘리">페인팅, 캐리커쳐, 캘리</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=육아,아동">육아, 아동</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=파인아트">파인아트</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=공예">공예</a><i class="fas fa-greater-than"></i></li>
										<li class="category-product"><a href="productListPage.do?category=기타">기타</a><i class="fas fa-greater-than"></i></li>
									</ul>
					        	</div>
					        </div>
					    </li>
					    <li class="menu" id="menu_home" data-state="active">
					        <a href="index.do" >홈</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="">오늘의 발견</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="">실시간 구매</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="">실시간 후기</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="">작가님 추천</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="popularWorks.do">인기 작품</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="">스토리</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="recentWorks.do">최신 작품</a>
					    </li>
					    <li class="menu" data-state="">
					        <a href="artistMainPage.do">인기작가</a>
					    </li>
					</ul>
				</div>
			</div>
		</div>
		<div class="body-wrap">


		