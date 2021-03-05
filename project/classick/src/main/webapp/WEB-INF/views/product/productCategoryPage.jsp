<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="Classick - 상품 리스트" name="title" />
</jsp:include>

<section class="banner-title" data-image="type1" data-theme="blue">
	<h1>카테고리</h1>
	<p>다양한 카테고리의 작품들을 구경해 보세요.</p>
</section>
<div class="inner-w">
	<div class="ui_grid mt40">
		<div class="ui_grid__cols--6 ui_grid__cols--m3">
			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=음료(커피,차 등)"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/5f2f529f8d074e2aac609d72be8cb5d7_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=음료(커피,차 등)" class="area-txt">음료 (커피, 차 등)</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=디저트,베이커리,떡"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/42899cccab4b40f1921877d7947961ea_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=디저트,베이커리,떡" class="area-txt">디저트, 베이커리, 떡</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=농축수산물"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/e1fc75ac0c1e42368b38896bec42d0de_720.png);">
						</a>
					</div>
					<a href="productListPage.do?category=농축수산물"
						class="area-txt">농축수산물</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=수제 반찬"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/ca07e43f07da4076bbdd6acd4ff51f19_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=수제 반찬"
						class="area-txt">수제 반찬</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=그 외 수제먹거리"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/6b498f6b50a34d09a96d8cdc7eaebba5_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=그 외 수제먹거리"
						class="area-txt">그 외 수제먹거리</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=전통주"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/2241687c9c1446999983cdfc88196e7d_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=전통주"
						class="area-txt">전통주</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=문구,팬시"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/de96a769d479413587822313d7a55673_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=문구,팬시"
						class="area-txt">문구, 팬시</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=휴대폰 케이스"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/ae528ca6468642df852dbb0c6efa9657_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=휴대폰 케이스"
						class="area-txt">휴대폰 케이스</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=전자기기 관련"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/4b534ed34df04ab7adb0b7f77ab92432_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=전자기기 관련"
						class="area-txt">전자기기 관련</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=꽃(생화,드라이,다육)"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/e69f5d273f0e4341b4db27dc6b5e3ac2_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=꽃(생화,드라이,다육)"
						class="area-txt">꽃 (생화, 드라이, 다육 등)</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=캔들,디퓨져,방향제"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/ad98f97570864205a8f3eb35882e433a_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=캔들,디퓨져,방향제"
						class="area-txt">캔들, 디퓨저, 방향제</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=향수,화장품,뷰티"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/75a276f2a0ca4ea6bfe8c2418811afe3_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=향수,화장품,뷰티"
						class="area-txt">향수, 화장품, 뷰티</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=반지"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/e7737428d5534605a10702a92a36cfb9_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=반지"
						class="area-txt">반지</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=귀걸이"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/aa45a0c9b4fd44c889e65398e8238477_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=귀걸이"
						class="area-txt">귀걸이</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=목걸이"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/460b87c352e14ca798c289926d61151f_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=목걸이"
						class="area-txt">목걸이</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=팔찌"
							class="area-img"
							style="background-image: url(http://image.idus.com/image/files/f851cb0a647d4e0bbbec93412ceceb09_720.png);">
						</a>
					</div>
					<a href="productListPage.do?category=팔찌"
						class="area-txt">팔찌</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=그 외 액세서리"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/22c074293b944371b039c1e04eb8cb63_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=그 외 액세서리"
						class="area-txt">그 외 액세서리</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=비누,천연비누"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/a14e6fa8505e4bdb9189280e57c4b6fe_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=비누,천연비누"
						class="area-txt">비누, 천연비누</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=섬유,의류,퀄트"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/74cb1a3336dd4a4280defb29eda041cb_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=섬유,의류,퀄트"
						class="area-txt">섬유, 의류, 퀼트</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=패션잡화"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/d883a6e0a0494eb29b2f1f09f839d9e9_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=패션잡화"
						class="area-txt">패션잡화</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=인테리어 소품"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/0862ae436d204c58abd126c3ff2c1edc_720.png);">
						</a>
					</div>
					<a href="productListPage.do?category=인테리어 소품"
						class="area-txt">인테리어 소품</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=도자기"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/337602d60dbd4499aefe9b81299467c1_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=도자기"
						class="area-txt">도자기</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=주방,생활"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/af7db655b35342e4b5c945f5e44c9c45_720.png);">
						</a>
					</div>
					<a href="productListPage.do?category=주방,생활"
						class="area-txt">주방, 생활</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=가구"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/54e925f588d14ef28ddecccbd0ac674e_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=가구"
						class="area-txt">가구</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=지갑(지폐,카드,동전,명함)"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/27f8c65fd16947b292f01e7d548c5008_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=지갑(지폐,카드,동전,명함)"
						class="area-txt">지갑 (지폐,카드,동전,명함)</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=가방,파우치"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/a78a970465734181aaeaf7aca4c47567_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=가방,파우치"
						class="area-txt">가방, 파우치</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=시계"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/fac4466999834770a4c747dfce7b8bf2_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=시계"
						class="area-txt">시계</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=남성 수제화"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/bea5dbf8f5884cc2a88a81313d7f46fd_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=남성 수제화"
						class="area-txt">남성 수제화</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=여성 수제화"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/2f6e762c96bd4a30948ea5ba0ebede4c_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=여성 수제화"
						class="area-txt">여성 수제화</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=인형,장난감"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/88073ff989f541858f7eb22136512f4e_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=인형,장난감"
						class="area-txt">인형, 장난감</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=반려동물 용품"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/ed5e667257844bf1a0e735948976e488_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=반려동물 용품"
						class="area-txt">반려동물 용품</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=페인팅,캐리커쳐,캘리"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/b5fb85508b78401a935b6bafadd82ed1_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=페인팅,캐리커쳐,캘리"
						class="area-txt">페인팅, 캐리커쳐, 캘리</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=육아,아동"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/9aa75fe868ae46e1bc5f36bd9692f1ce_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=육아,아동"
						class="area-txt">육아, 아동</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=파인아트"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/dd5447c7af4b4561b1e05fcbcac1cf4d_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=파인아트"
						class="area-txt">파인아트</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=공예"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/d3b259608c9a4a35900ec2f41e6aeda8_720.png);">
						</a>
					</div>
					<a href="productListPage.do?category=공예"
						class="area-txt">공예</a>
				</div>
			</div>

			<div class="ui_grid__item">
				<div class="card-style circle">
					<div class="img-wrap">
						<a href="productListPage.do?category=기타"
							class="area-img"
							style="background-image: url(https://image.idus.com/image/files/8162642dbb194274a982bba37c63a5b2_720.jpg);">
						</a>
					</div>
					<a href="productListPage.do?category=기타"
						class="area-txt">기타</a>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp"%>