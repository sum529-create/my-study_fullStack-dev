<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if(${result}>0){
		alert('게시글이 등록되었습니다.');
		location.href='/15_DBCP/listPage.do';	// jsp는 java코드가 없기에 controller로 이동
		// 성공시에 넘어가서 GreenList를 실행하고 dao를 활용해 db로 이동한다.
	}else{
		alert('게시글이 등록되지 않았습니다.');
		history.back();
	}
</script>