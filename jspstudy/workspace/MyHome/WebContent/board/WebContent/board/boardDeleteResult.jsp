<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
if ('${param.result}' > 0) {
	alert('게시글이 삭제되었습니다.');
	location.href = '/MyHome/boardListPage.board?page=${param.page}';
} else {
	alert('게시글이 삭제되지 않았습니다.');
	history.back();
}
</script>