<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - Home" name="title"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/tabs.css" />
<div class="popularWorks-banner">
	<h1>인기작품</h1>
	<p>가장 인기있는 작품들입니다.</p>
</div>
<div>
	<div class="inner-popularWorks">
		<div class="category-pw-food">
			
			<div class="popularWorks-category-list" id="category-pw-food-content">
				
					<c:forEach items="${list}" var="category" varStatus="t">
						<div class="category-pw-title">
							${category[0].PCategory}
						</div>
					  	<ul>
						<c:forEach items="${category}" var="tabsDto" varStatus="k">
						<c:set var="doneLoop" value="false"/>
						<c:if test="${not doneLoop}">
						  	<li>
								<div class="popularWorks-card">
									<div class="popularWorks-card-head">
									
										<c:set var="pImgStr" value="${fn:substringBefore(tabsDto.PImage,'&')}"/>
										<a href=""><img src="/classick/resources/storage/product/${pImgStr}"></a>
									</div>
									<div class="popularWorks-card-body">
										<div class="popularWorks-card-body-title">
											${tabsDto.AName}
										</div>
										<div class="popularWorks-card-body-content">
											${tabsDto.PName}
										</div>
									</div>
									<div class="popularWorks-card-foot">
										<div class="popularWorks-card-foot-rating" >
											<c:set var="r" value="${tabsDto.RRating}"/>
											<c:set var="s" value=""/>
											<c:if test="${r < 5 }">
												<c:forEach begin="1" end="${r}">
													<i class="fas fa-star"></i>
												</c:forEach>
												<c:forEach begin="1" end="${5-r}">
													<i class="far fa-star"></i>
												</c:forEach>
											</c:if>
											<c:if test="${r == 5 }">
												<c:forEach begin="1" end="${r}">
													<i class="fas fa-star"></i>
												</c:forEach>
											</c:if>
										</div>
										<div class="popularWorks-card-foot-content">${tabsDto.RContent}</div>
									</div>
								</div>							
							</li>
							<c:if test="${k.count == 10}">
				 		  		<c:set var="doneLoop" value="true"/>
							</c:if>
					</c:if>
					</c:forEach>
	 		  		</ul>
					</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="foot-wrap">
			<a href="">개인정보 보호정책 </a>|
			<a href="">약관 </a>|
			<a href="">저작권 </a>
		</div>
	</div> <!-- /wrap -->
</body>
</html>