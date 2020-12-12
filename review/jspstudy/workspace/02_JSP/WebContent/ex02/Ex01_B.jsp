<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
%>
<!-- 이건 리다이렉트 방식임 -->

<%
	response.sendRedirect("/02_JSP/ex02/Ex01_C.jsp?num1="+ num1 +"&num2=" + num2);	
%>

<%-- <%
	request.getRequestDispatcher("/ex02/Ex01_C.jsp").forward(request, response);
%> --%>

<%-- <jsp:forward page="/ex02/Ex01_C.jsp">
	<jsp:param value="200" name="num3"/>
</jsp:forward> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script type="text/javascript">
	location.href="/02_JSP/ex02/Ex01_C.jsp?num1=<%=num1%>&num2=<%=num2%>";
</script> --%>
</head>
<body>
<%-- 	<div>
		<h3><%=num1 %> <%=num2 %></h3>
		<h3><a href="/02_JSP/ex02/Ex01_C.jsp?num1=<%=num1%>&num2=<%=num2%>">이동</a></h3>
	</div> --%>
</body>
</html>

