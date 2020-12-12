<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setChacrecterEncoding("UTF-8");

	String date = request.getParameter("date");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	String filename = date + "_" + title + ".txt";
	String realPath = application.getRealPath("ex03/" + filename);
	
	boolean isSuccess = false;
	BufferedWriter bw = null;
	try{
		bw = new BufferedWriter(new FileWriter(realPath));
		bw.write("날짜: " + date + "\n");
		bw.write("작성자: " + writer + "\n");
		bw.write("제목: " + title + "\n");
		bw.write("내용\n ");
		bw.write(content);
		isSuccess = true;
	}catch(IOException e){
		isSuccess= false; // 생략할 수 있습니다.
	}finally{
		try{
			if(bw != null){
				bw.close();
			}
		}catch(Exception e){
			
		}
	}
	
%>


<script>
	if(<%=isSuccess%> == true){
		alert('저장');
	}else{
		alert("저장실패");
	}
	location.href = '<%= application.getContextPath()%>/ex03/Ex04_application1.jsp?done=<%=isSuccess%>'
</script>