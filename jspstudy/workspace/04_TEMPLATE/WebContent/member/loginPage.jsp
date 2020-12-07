<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%--
	다른 페이지를 포함하는 방법
	
	1. 정적 페이지: 바닥글
	   1) 변하는 내용이 없는 페이지
	   2) <%@ include file="페이지" %>
	2. 동적 페이지: 머리글
	   1) 변하는 내용이 있는 페이지
	   2) <jsp:include page="페이지"></jsp:include>
--%>

<% request.setCharacterEncoding("UTF-8"); %>


<%--
	주의. 태그 내부 주석은 위험합니다.
	header.jsp 페이지에 파라미터 title을 전달합니다.
 --%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

	<div class="wrap">
		<div class="main-wrap">
			<div class="login-box">
				<input type="text" name="id" placeholder="아이디"/><br>
				<input type="password" name="pw" placeholder="*****"/><br><br/>
				<button>로그인</button>
			</div>
		</div>
	</div>
	
	<%@include file = "../template/footer.jsp" %>
