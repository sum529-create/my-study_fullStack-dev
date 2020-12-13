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
		Cookie[] cookie = request.getCookies();
		Cookie ck = null;
		
		if(cookie != null && cookie.length != 0){
			for(Cookie k : cookie){
				if(k.getName().equals("name")){
					ck = new Cookie("name", "alice");
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