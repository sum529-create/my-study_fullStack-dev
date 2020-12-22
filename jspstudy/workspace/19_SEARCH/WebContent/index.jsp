<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		검색어 <input type="text" name="query"/><br/>
		<input type="button" value="제목검색" onclick="fn_title(this.form)"/> <!--location은 사용할 수 없다. submit형식으로 위 query를 가져가야 한다. -->
		<input type="button" value="내용검색" onclick="fn_content(this.form)"/>
		<input type="button" value="제목+내용검색" onclick="fn_both(this.form)"/>
		<input type="button" value="전체목록" onclick="location.href='/19_SEARCH/listPage.white'"/>
	</form>
</body>
</html>