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
	<h1>최신작품</h1>
	<p>지금 새로 등록된 작품이에요.</p>
</div>
<div>
	<div class="inner-popularWorks">
		<div class="category-pw-food">
			<div class="popularWorks-category-list" id="category-pw-food-content">
				  	<ul>
					<c:forEach items="${list}" var="tabsDto" varStatus="k">
				 
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
							</div>							
						</li>
				</c:forEach>
 		  		</ul>
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