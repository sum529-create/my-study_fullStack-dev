<%@page import="java.sql.Connection"%>
<%@page import="dao.RedDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// RedDao의 getInstance() 호출해 봅시다.
	// 1. 메소드를 호출하려면 객체(인스턴스)가 필요하다.
	// 2. 객체를 만들려면 new가 필요하다.
	// 3. ???
			
	// 객체를 만들지 말고 getInstance()를 부르자.
	// hint)
	// Calendar cal = Calendar.getInstance();		// 클래스 메소드로 만들면 되겠다.
	
	RedDao redDao = RedDao.getInstance();
	Connection con = redDao.getConnection();	// 클로즈 확인을 위한 connection 저장
	redDao.close(con, null, null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>