<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
		특정 쿠키를 변경하는 방법
		1. 서버가 클라이언트의 모든 쿠키를 읽어들인다.
		2. 변경할 쿠키를 찾는다.
		3. 같은 이름의 쿠키를 만들어서 덮어쓰기한다.
	 --%>
	 
	 <%
	 	// 1. 전체 쿠키를 읽어들인다.
		Cookie[] cookieList = request.getCookies();
	 	
	 	// 2. 변경할 쿠키를 선언해 둔다.
	 	Cookie ck = null;
	 	
	 	// 3. 쿠키를 찾는다.
	 	if(cookieList != null && cookieList.length != 0){
	 		for(Cookie cookie : cookieList){
	 			if(cookie.getName().equals("name")){
	 				ck = new Cookie("name", "amanda");
	 				ck.setMaxAge(60 * 60 * 24);
	 				response.addCookie(ck);
	 			}
	 		}
	 	}
	 %>
	<h3>쿠키 확인하기</h3>
	<ul>
		<li>쿠키이름: <%=ck.getName() %> </li>
		<li>쿠키유효기간: <%=ck.getMaxAge() %> </li>
		<li>쿠키값: <%=ck.getValue() %></li>
	</ul>

</body>
</html>