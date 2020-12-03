<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 
	<%@ 페이지 지시어 %>
	1. 현재 페이지의 속성을 저장한다.
	2. WAS(톰캣)가 지시어를 보고 해당 페이지를 처리한다.
	3. 속성
		1) language 	사용된 언어			<%@ page language="java"%>
		2) content 		문서형식, 인코딩 	<%@ page contentType="text/html; charset=UTF-8" %>
		3) pageEncoding 인코딩				<%@ page pageEncoding="UTF-8" %>
		4) import		클래스 import		<%@ page import = "java.util.Date" %>
		5) session		세션 사용 유무		<%@ page session = "true" %>
		6) buffer		출력 버퍼 크기		<%@ page buffer="8KB" %>
		7) autoFlush	출력 버퍼 full되면	<%@ page autoFlush = "true" %>
						자동으로 내보내기
		8) errorPage 	에러 발생 시 이동할	<%@ page errorPage="error.jsp" %>
						페이지
		9) isErrorPage	에러 페이지 유무	<%@ page isErrorPage = "false" %>
 --%>

<%-- 
	<%@ include 지시어 %>
	1. 현재 페이지에 다른 페이지를 포함시킬 때 사용한다.
	2. 변화가 없는 정적 페이지를 포함시킬 때 사용한다.
	3. <%@ include file = "포함할파일.jsp" %>
 --%>
 
 <%-- 
 	<%@ taglib 지시어 %>
 	1. JSP 기능 확장을 위한 태그 라이브러리 정보를 지정한다.
 	2. 추가 태그를 사용할 수 있다.
 	3. <%@ taglib url="http://java.sum/com/jsp/jstl/core" prefix = "c" %>
 
  --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "Ex02_header.jsp" %>

	<%
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat();		// 날짜 패턴을 만들때 사용
		String pattern = "yyyy년 M월 d일 E요일 a h:mm:ss";
		sdf.applyPattern(pattern);
		String patternToday = sdf.format(today);
	%>
	
	<h1>현재 날짜는 <%= patternToday %>입니다.</h1>

	

	<%@ include file = "Ex02_footer.jsp" %>

</body>
</html>