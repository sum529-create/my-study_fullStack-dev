<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%-- 나는 에러페이지 입니다. --%>
<%@ page isErrorPage = "true" %>
<script type="text/javascript">
	alert("결과는 정수만 허용됩니다. 다시 시도하세요.");
	// history.go(-3); history.back()
	location.href='/02_JSP/quiz/Q05_A.jsp';
</script>
