<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<!-- resources 디렉토리 아래의 image -->				
<img style="width:200px;" alt="야경이미지" src="/mvc01/resources/light.jpg">

<!-- assets/images 디렉토리 아래의 image -->
<img style="width:200px;" alt="야경이미지" src="/mvc01/assets/images/light.jpg">

</body>
</html>
