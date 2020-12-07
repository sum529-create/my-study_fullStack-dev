<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 쿠키값에 공백, 콤마, 괄호 등이 포함되면 
		// 인코딩을 해야 한다.
		
		// 1. 쿠키 생성(인코딩 필요)
		Cookie cookie = new Cookie("nickname", URLEncoder.encode("james bond", "UTF-8"));	// 공백 안됨 james bond (x) 그래서 인코딩을 해야함
		
		// 2. 쿠키 유효기간 설정
		cookie.setMaxAge(60 * 60 * 24); // 하루 1일
		
		// 3. 쿠키 저장
		response.addCookie(cookie);
	
	%>
	
	<h3>쿠키 값 확인하기</h3>
	<ul>
		<li>쿠키이름: <%=cookie.getName() %></li>
		<li>쿠키유효기간: <%=cookie.getMaxAge() %></li>
		<li>쿠키값: <%= URLDecoder.decode(cookie.getValue(), "UTF-8") %>
	</ul>
	
	
	<%-- 
		참고
		1. encode : 암호화 (암호를 만든다.)
		2. decode : 복호화	(암호를 푼다.)
	 --%>
	
</body>
</html>