<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 1 ~ 100 사이의 홀수 출력하세요. --%>
	<%
		for(int i = 1; i<=100; i++){
			if(i%2 == 1){%>
				<%=i%><br/>
	<%		}
		}
	%>
	
	<!-- 같은 문제를 out객체로 출력합니다. -->
	<%
		for(int i = 1; i <= 100; i++){
			if(i%2 == 1){
				out.println(i+"<br/>");		
			}
		}
	%>

</body>
</html>