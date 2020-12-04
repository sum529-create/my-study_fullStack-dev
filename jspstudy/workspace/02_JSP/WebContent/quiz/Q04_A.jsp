<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input, select, button{
		width:30px;
	}
</style>
</head>
<body>
	<%
		String[] operators = {"+", "-", "*", "/"};
		String snum1 = request.getParameter("num1");
		String snum2 = request.getParameter("num2");
		// String으로 받고 나서 검사를 해야 한다. 바로 int로 바꾸지 말것. 값을 확인해야 하기 때문!
		
		
		int operator = 0;	// 연산의 인덱스
		double num1 = 0;
		double num2 = 0;
		double result =  0;
		
		// a와 b가 모두 입력 되었다면
		if(snum1 != null && !snum1.isEmpty() && snum2 != null && !snum2.isEmpty()){
			num1 = Double.parseDouble(snum1);
			num2 = Double.parseDouble(snum2);
			operator = Integer.parseInt(request.getParameter("operator"));	// 연산의 인덱스
			switch(operator){
			case 0:
				result = num1 + num2;
				break;
			case 1:
				result = num1 - num2;
				break;
			case 2:
				result = num1 * num2;
				break;
			case 3:
				result = num1 / num2;
				break;
			}
		}
		
	%>
	<h3>계산기</h3>
	<form method="get" name="cal" action = "/02_JSP/quiz/Q04_A.jsp">
		<input type="text" name="num1" id="num1" value="<%=num1%>"/>
		<select name="operator">
			<%for(int i = 0; i<operators.length; i++) {%>
				<% if(i ==operator){ %>
					<option value=<%=i %> selected><%=operators[i] %></option>
				<% }else{ %>
					<option value=<%=i %>><%=operators[i] %></option>
				<%} %>
			<%} %>
		</select>
		<input type="text" name="num2" id="num2" value="<%=num2%>"/>
		<button>=</button>
		<input type="text" value="<%=result%>" readonly/>
	</form>
</body>
</html>