<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		파일 업로드
		
		1. cor.jar 라이브러리를 추가한다. (servlets.com)
			1) MultipartRequest 클래스를 이용한다.
			2) 기존의 request를 이용해서 MultipartRequest 클래스 객체를 만든다.
			
		2. <form method="post"
				 enctype="multipart/form-data">
		3. <input type="file" name="파일명" />
		
		4. 업로드 할 디렉토리(폴더)를 생성해 둔다.
			WebContent 디렉토리 아래에 임의의 디렉토리를 만든다.
	 --%>
	 
	 <h3>파일 업로드 폼</h3>
	 <form action="upload.jsp" method="post" enctype="multipart/form-data">
	 	업로더 <input type="text" name="uploader"/> <br/><br/>
	 	첨부 <input type="file" name="filename"/><br/><br/>
	 	<button>올리기</button>
	 </form>

</body>
</html>