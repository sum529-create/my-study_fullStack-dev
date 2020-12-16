<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>하나의 CONTROLL에게 요청하기</h3>
	<input type="button" value="한글인사요청하기" onclick="location.href='/13_MVC/HomeController?cmd=korean'"> <!-- cmd도 값을 전달하는 리퀘스터(request) -->
	<input type="button" value="영문인사요청하기" onclick="location.href='/13_MVC/HomeController?cmd=english'">
	
	<!-- submit으로 보내는 방법 -->
	<h3>하나의 CONTROLL에게 요청하기</h3>
	<form>
		너비  <input type="text" name="width"/><br/>
		높이  <input type="text" name="height"/><br/>
		<input type="button" value="삼각형넓이요청하기" onclick="fn_triangle(this.form)"/>
		<input type="button" value="사각형넓이요청하기" onclick="fn_rectangle(this.form)"/>
	</form>
	<script type="text/javascript">
	<%--
		triangle.do와 rectangle.do는 모두 .do로 끝난다.
		(suffix가 .do이다.)
		suffix가 .do인 모든 요청은 *.do가 처리할 수 있다.
		
		Survlet에 보내는 용은 submit을 해야하기에 location.href는 사용할 수 없다.
	 --%>
		function fn_triangle(f) {
			f.action = '/13_MVC/triangle.do';	/* 전체와 contextPath를 분리하는 parsing작업이 필요 */
			f.submit();
		}
		function fn_rectangle(f) {
			f.action = '/13_MVC/rectangle.do';
			f.submit();
		}
	</script>
</body>
</html>