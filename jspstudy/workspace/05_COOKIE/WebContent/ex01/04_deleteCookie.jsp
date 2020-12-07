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
		// 쿠키 삭제
		// maxAge()가 0인 같은 이름의 cookie로 덮어쓰기 한다.
		
		// 1. 모든 쿠키 읽어 들이기
		Cookie[] cookieList = request.getCookies();
		
		// 2. 쿠키가 존재하는지 확인
		if(cookieList != null && cookieList.length != 0){
			// 3. 쿠키 순회하기
			for(Cookie ck : cookieList){
				if(ck.getName().equals("name")){
					// 4. 덮어쓰기 할 쿠키 생성
					Cookie cookie = new Cookie("name", "의미없음");
					cookie.setMaxAge(0);			// 삭제를 위해 유효기간을 0으로 설정
					response.addCookie(cookie);
				}
			}
		}
	%>

</body>
</html>