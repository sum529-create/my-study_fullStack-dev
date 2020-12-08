<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	EL
	1. Expression Language (표현언어)
	2. JSP의 새로운 스크립트 언어이다.
	3. 기존의 표현식(<%=표현식%>)을 대체하는 역할이다.
	4. 대체방식
		<%=표현식%>		-> 	${표현언어}
	5. 데이터를 저장할 수 있는 4개 영역에서 사용할 수 있다.
		1) pageContext
		2) request
		3) session
		4) application
	6. 각 영역의 우선순위
		pageContext > request > session > application
	7. 각 영역의 스코프 키워드
		1) pageContext: pageScope
		2) request: requestScope
		3) session: sessionScope
		4) application: applicationScope
	8. 저장이 "속성"으로 된 경우 다음과 같이 사용한다.
		1) pageContext.setAttribute("name", "에밀리");	-> ${name}
														-> ${pageScope.name}
		2) request.setAttribute("age", 25); -> ${age}
											-> ${requestScope.age}
	9. request에 파라미터로 저장된 경우 다음과 같이 사용한다.
		1) <input type="text" name="id" /> -> ${param.id}
		2) <input type="checkbox" name="hobbies"/>	-> ${paramValues.hobbies[0]} 											
			<input type="checkbox" name="hobbies"/>	-> ${paramValues.hobbies[1]}
	10. EL연산자
		1) +
		1) -
		3) *
		4) /, div : 나누기
		5) %, mod : 나머지 											
		6) >, gt  : 크다.	{a gt 5}, {a > 5}
		7) >=, ge : 크거나 같다.
		8) <, lt  : 작다.    	
		9) <=, le : 작거나 같다.
	   10) ==, eq : 같다
	   11) !=, ne : 같지 않다.
	   12) and	  : 그리고
	   13) or	  : 또는
	   14) not	  : 부정
	   15) empty  : 비어있다.
--%>