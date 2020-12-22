<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		function fn_title(f) {
			f.action = '/19_SEARCH/searchTitle.white';
			f.submit();
		}
		function fn_content(f) {
			f.action = '/19_SEARCH/searchContent.white';
			f.submit();
		}
		function fn_both(f) {
			f.action = '/19_SEARCH/searchBoth.white';
			f.submit();
		}
	</script>
	<form>
		<h3>WHITE 테이블 검색</h3>
		검색어 <input type="text" name="query" /><br/><br/>
		<input type="button" value="제목검색" onclick="fn_title(this.form)" />
		<input type="button" value="내용검색" onclick="fn_content(this.form)" />
		<input type="button" value="제목+내용검색" onclick="fn_both(this.form)" />
		<input type="button" value="전체목록" onclick="location.href='/19_SEARCH/listPage.white'" />
	</form>
	
	<br/><hr/><br/>
	
	<script type="text/javascript">
		function fn_dept(f) {
			f.action = '/19_SEARCH/searchDept.emp';
			f.submit();
		}
		function fn_dynamic(f) {
			f.action = '/19_SEARCH/searchDynamic.emp';
			f.submit();
		}
	</script>
	<form>
		
		<h3>EMP 테이블 검색</h3>
		<input type="button" value="전체직원목록" onclick="location.href='/19_SEARCH/listPage.emp'" />
		<br/><br/>
		
		<select name="department_id" multiple="multiple">
			<c:forEach begin="10" end="110" step="10" var="n">
				<option value="${n}">${n}</option>
			</c:forEach>
		</select>
		<input type="button" value="부서검색" onclick="fn_dept(this.form)" />
		<br/><br/>
		
		<select name="column">
			<option value="EMPLOYEE_ID">EMPLOYEE_ID</option>
			<option value="LAST_NAME">LAST_NAME</option>
		</select>
		<input type="text" name="query" />
		<input type="button" value="검색" onclick="fn_dynamic(this.form)" />
		
	</form>
	
</body>
</html>