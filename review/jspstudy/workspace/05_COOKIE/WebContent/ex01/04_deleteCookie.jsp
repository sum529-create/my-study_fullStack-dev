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
		
		if(cookie != null && cookie.length != 0){
			for(Cookie ck : cookie){
				if(ck.getName().equals("name")){
					Cookie coo = new Cookie("name", "");
					coo.setMaxAge(0);
					response.addCookie(coo);
				}
			}
		}
	%>

</body>
</html>