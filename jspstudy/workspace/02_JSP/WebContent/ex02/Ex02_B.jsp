<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	request.setCharacterEncoding("UTF-8");
 	String num1 = request.getParameter("num1");
 	String num2 = request.getParameter("num2");
 	
 %>
<script type="text/javascript">
	location.href = '/02_JSP/ex02/Ex02_C.jsp?num1=<%=num1%>&num2=<%=num2%>';
</script>
