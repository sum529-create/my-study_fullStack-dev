<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	label {
		display:inline-block;
		width: 50px;
	}
</style>
<script type="text/javascript">
	if(<%=request.getParameter("done")%> == 'true'){	// 파라미터는 String 타입이므로 'true'으로 비교합니다.
		var f = document.forms.myDiary;
		f.writer.value = '';
		f.title.value='';
		f.content.value='';
	}
</script>
</head>
<body>

	<h3>나만의 일기장</h3>
	<form name="myDiary"  method ="post" action="<%=application.getContextPath()%>/ex03/Ex04_application2.jsp">
		<label for="date">작성일</label>
		<input type="text" id="date" name="date" value="<%= new Date(System.currentTimeMillis())%>"/><br/>
		
		<label for="writer">작성자</label>
		<input type="text" id="writer" name="writer"/><br/>
		
		<label for="title">제목</label>
		<input type="text" id="title" name="title"/><br/>
		
		<label for="content">내용</label><br/>
		<textarea rows="10" cols = "30" id="content" name="content"></textarea>
		
		<br/><br/>
		<button>일기저장하기</button>
		<input type="reset" value="다시작성하기"/>
	</form>

</body>
</html>