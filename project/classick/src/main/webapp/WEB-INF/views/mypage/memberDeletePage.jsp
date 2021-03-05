<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	if('${loginDto}' == '') {
		alert('탈퇴되었습니다.');
		location.href='index.do';
	} else {
		alert('탈퇴되지 않았습니다.');
		history.back();
	}
</script>