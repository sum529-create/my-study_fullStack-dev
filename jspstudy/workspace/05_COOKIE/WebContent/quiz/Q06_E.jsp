<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Cookie[] ckList = request.getCookies();
%>
<%!
		// 선언부 (메소드 정의) - 작업이 길어서 메소드를 만들었습니다.
		// 자바 메소드는 선언부에 만들어야 합니다.
		
		// 1. 메소드명: getCookieValue
		// 2. 반환타입: String
		// 3. 반환값  : 찾는쿠키의값, 없으면 null 반환
		// 4. 매개변수: 전체쿠키, 찾는쿠키이름
		
		public String getCookieValue(Cookie[] ckList, String cookieName) {
			
			try {
		
				if ( ckList != null && ckList.length > 0 ) {
					for ( Cookie ck : ckList ) {
						if ( ck.getName().equals(cookieName) ) {
							return URLDecoder.decode(ck.getValue(), "utf-8");  // 쿠키가 있으면 쿠키값을 반환한다.
						}
					}
				}
				
			} catch (UnsupportedEncodingException e) {
				return null;  // 인코딩 오류가 나면 null 을 반환한다.
			}
			
			return null;  // 쿠키가 없으면 null 을 반환한다.
			
		}
	%>
</head>
<body>
	<h3>가입 내용</h3>
	<ul>
		<li>아이디:<%=getCookieValue(ckList, "id")%></li>
		<li>비밀번호:<%=getCookieValue(ckList, "pw") %></li>
		<li>성명:<%=getCookieValue(ckList, "name") %></li>
		<li>주소:<%=getCookieValue(ckList, "address") %></li>
		<li>연락처:<%=getCookieValue(ckList, "phone") %></li>
		<li>이메일:<%=getCookieValue(ckList, "email") %></li>
		<li>생년월일:<%=getCookieValue(ckList, "birth") %></li>
		<li>결혼여부:<%=getCookieValue(ckList, "married") %></li>
		<li>직업:<%=getCookieValue(ckList, "job") %></li>
	</ul>
	상기 조건으로 가입되었습니다. 감사합니다.

</body>
</html>