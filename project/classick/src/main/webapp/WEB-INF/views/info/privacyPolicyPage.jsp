<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- header.jsp --%>
<jsp:include page="../template/header.jsp" >
	<jsp:param value="Classick - 관리자 페이지입니다." name="title"/>
</jsp:include>

<%-- css --%>
<link rel="stylesheet" type="text/css" href="/classick/assets/style/info.css" />

	
<div id="content" class="content" data-gnb-show="true">
    <div class="title-style-block inner-w">
        <h2 class="txt">개인정보 처리방침</h2>
    </div>
    <div class="inner-w">
        <iframe src="https://cnn.idus.com/terms/privacy"></iframe>
    </div>
</div>
	
	
<%-- footer.jsp --%>
<%@ include file="../template/footer.jsp" %>