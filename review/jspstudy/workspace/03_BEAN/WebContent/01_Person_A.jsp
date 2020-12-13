<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="/03_BEAN/01_Person_B.jsp">
		<table>
			<tbody>
				<tr>
					<td>이름</td>
					<td><input type="text" name= "name" id="name"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name= "age" id="age"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name= "gender" value="남"/>남자
					<input type="radio" name= "gender" value="여"/>여자</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<button>전송하기</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>