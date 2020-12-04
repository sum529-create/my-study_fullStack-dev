<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 예외가 발생하면 Q05_C.jsp로 자동으로 이동됩니다. --%>
<%@ page errorPage = "Q05_C.jsp"%> <%-- 현재 파일과 동일한 경로이므로 파일명만 작성해도 됩니다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%
	request.setCharacterEncoding("UTF-8");
	String rand1 = request.getParameter("rand1");
	String rand2 = request.getParameter("rand2");
	int result = Integer.parseInt(request.getParameter("result"));
	int num1=0;
	int num2 = 0;
	
	int sum = 0;
	if(rand1 != null && !rand1.isEmpty() && rand2 != null && !rand2.isEmpty() ){
		num1 = Integer.parseInt(rand1);
		num2 = Integer.parseInt(rand2);
		sum = num1 + num2;
		if(sum == result){ %>
			<%=num1 %> + <%=num2 %> = <%=sum %><br/>
			정답입니다.<br/><br/>
			<a href="/02_JSP/quiz/Q05_A.jsp">다시풀기</a>
<%		}if(sum != result){ %>
			제출: <%= num1%> + <%=num2 %> = <%=result %><br/>
			정답: <%= num1 %> + <%=num2 %> = <%= num1 + num2 %><br/><br/>
			<a href="/02_JSP/quiz/Q05_A.jsp">다시풀기</a>
<%		}
		else{%>
			<%@ page errorPage = "Q05_C.jsp"%>
			
<%		}
	}
%> --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int rand1 = Integer.parseInt(request.getParameter("rand1"));
	int rand2 = Integer.parseInt(request.getParameter("rand2"));
	int result = Integer.parseInt(request.getParameter("result"));
	String operator = request.getParameter("operator");
	
	int answer = 0;
	switch(operator){
	case "+":
		answer = rand1 + rand2;
		break;
	case "-":
		answer = rand1 - rand2;
		break;
	case "*":
		answer = rand1 * rand2;
		break;
	case "/":
		answer = rand1 / rand2;
		break;
	case "%":
		answer = rand1 % rand2;
	}
	
	String message = "";
	if(result == answer){
		message += (rand1 +operator + rand2 + "=" + result+"<br>" + "정답입니다.");
	}else{
		message += ("제출: " + rand1 +operator + rand2 + "=" + result + "<br>");
		message += ("정답: " + rand1 +operator + rand2 + "=" + answer + "<br>");
	}
%>
	<%=message %>
	<br/><br/>
	<a href="/02_JSP/quiz/Q05_A.jsp">다시풀기</a>
</body>
</html>