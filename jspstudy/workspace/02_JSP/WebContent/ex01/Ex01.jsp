<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- @가 들어간것을 지시어라고 한다. -->
    
    <!-- 
    	servlet : java -> create html [java파일에 html파일 생성]
		jsp     : html -> java include [html에 java 포함]
				[자바코드도 사용할 수 있게 함. html 기반 + 자바코드]
    
     -->
    

<!-- 
	JSP 개요
	1. Java Server Page
	2. HTML 문서내에서 JAVA 코드를 사용할 수 있는 서블릿(Servlet) 기반의 서버특 스크립트 언어이다.
	3. 모든 JSP 페이지는 모두 서블릿(Servlet)으로 변환된 뒤 처리된다.
	4. 동작 순서
		abc.jsp -> 서블릿명 abc_jsp.java -> abc_jsp.class -> run
	5. Model-1 : 전부 JSP로 처리한다.
	6. Model-2 : JSP는 VIEW를 만드는 용도로 사용하고, Servlet이나 Java파일을 LOGIC 처리하는 용도로 사용한다.
 -->
    
<%-- 
	JSP 스크립트 요소
	1. <%@ 지시어 %> : 지시어 (directive)
	2. <%! 선언부 %>  : 선언부 (declaratition), 전역변수 선언, 메소드 정의 
	3. <%= 표현식 %> : 표현식 (expression), 결과 출력(변수, 메소드 호출 결과, 식)
	4. <% 스크립트릿 %> : 스크립트릿 (scriptlet), Java 코드 
 --%>    
 
 <!-- HTML 주석 : 소스보기에서 보인다. -->
 <%-- JSP 주석 : 소스보기에서 보이지 않는다. --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- JSP에서 자바 코드를 포함하려면 스크립트릿(스크립트 요소)을 사용한다. -->
	<% int a = 0;  %> <!-- 여기가 스크립트릿입니다. 여기는 자바 영역입니다. -->
	
	<% if (a > 0) { %>
		<h3><%=a%>는 양수</h3>		<!-- 변수의 출력은 표현식으로 합니다. -->
	<% } else{ %>
		<h3><%=a%>는 음수</h3>
	<% } %>
	
	<h3>1 ~ 10 모든 정수를 출력하세요.</h3>
	<% for(int i =1; i <= 10; i++){ %>
		<%=i%><br/>
	<%} %>
	
	<h3>테이블을 생성해 봅시다.</h3>
	<table border ="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>이름</td>
			</tr>
		</thead>
		<% String[] names = {"에밀리", "제임스", "아만다"}; %>
		<tbody>
			<% for(int i = 0; i< names.length; i++){ %>
				<tr>
					<td><%= i+1 %></td>
					<td><%= names[i] %></td>
				</tr>
			<% } %>
		</tbody>
	</table>
	
	<h3>&lt;select&gt; 태그를 만들어 봅니다.</h3>
	<select>
		<% for(int n =0; n<= 100; n++){ %>
		<option value="<%=n%>"><%=n%></option>
		<%} %>
	</select>
	
	<h3>1 ~ 10 사이 모든 정수의 합을 구하는 sum 메소드를 구현합니다.</h3>
	<%!
		// 자바 영역에서는 자바 주석 가능합니다.
		// 메소드의 정의는 선언부에서 합니다.
		public int sum(){
			int total = 0;
			for(int i= 1; i<= 10; i++){
				total += i;
			}
			return total;
		}
	%>
	<h3>1 ~ 10 사이의 합 : <%=sum()%></h3>
	
	<h3>1 ~ 100 사이 모든 짝수의 합계를 반환(리턴)없이 구하는 evenSum() 메소드를 구현하시오.</h3>
	
	
	<%!
		int total = 0;		// evenSum() 외부에서 결과를 확인할 수 있도록 스코프를 조정합니다.
		public void evenSum(){
			for(int i =1; i<=100; i++){
				if(i % 2 == 0){
					total += i;
				}
			}
		}
	%>
	<% evenSum(); // 메소드 호출해야 실행됩니다. %>
	<h3>1 ~ 100 사이의 짝수 합 : <%= total %>></h3>
	
</body>
</html>