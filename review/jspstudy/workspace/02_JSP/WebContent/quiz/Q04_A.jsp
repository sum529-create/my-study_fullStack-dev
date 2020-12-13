<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>계산기</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		String[] symbol = {"+", "-", "*", "/"};
		String snum1 = request.getParameter("num1");
		String snum2 = request.getParameter("num2");
		
		int operator = 0;
		double num1 = 0;
		double num2 = 0;
		double result = 0;
		
		if(snum1 != null && !snum1.isEmpty() && snum2 != null && !snum2.isEmpty()){
			num1 = Double.parseDouble(snum1);
			num2 = Double.parseDouble(snum2);
			operator = Integer.parseInt(request.getParameter("symbol"));
		
			switch(operator){
			case 0:
				result = num1 + num2; break;
			case 1:
				result = num1 - num2; break;
			case 2:
				result = num1 * num2; break;
			case 3:
				result = num1 / num2; break;
			}
		}
	%>
	<form action="/02_JSP/quiz/Q04_A.jsp" method="get" name="cal">
		<input type="text" name="num1" value=""/>
		<select name="symbol">
			<%
				for(int i=0; i<symbol.length; i++){
					if(i == operator){%>
						<option value="<%=i%>" selected><%=symbol[i] %></option>
					<%}else{%>
						<option value="<%=i%>"><%=symbol[i] %></option>
						
					<%}
				}
			%>
		</select>
		<input type="text" name="num2" value=""/>
		<button>=</button>
		<input type="text" name="cost" value="<%=result %>"/>
	</form>
</body>
</html>