<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");    	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_update(f) {
		f.action = "/10_DAO/red/update.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
			<table>
				<thead>
					<tr>
						<td colspan="2">${redDto.id}님의 정보를 수정합니다.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>번호</td>
						<td>${param.no}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${param.id}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="${param.name}" readonly/> </td>	<!-- input타입이긴 하나 수정/변경 불가하게 한다. -->
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" value="${param.agee}" /> </td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${param.email}"/> </td>					
					</tr>
					<tr>
						<td>가입일</td>
						<td>${param.email}</td>		
					</tr>
				</tbody>
						<!-- 이름, 나이, 이메일 만 form으로 이동됨 -->			
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="회원정보수정하기" onclick="fn_update(this.form)"/>
							<input type="button" value="수정취소하기" onclick="hisoty.go(-2)"/>
							<%-- viewPage.jsp -> pwConfirm.jsp -> updatePage.jsp(현재) --%>
							<input type="button" value="목록으로이동하기" onclick="location.href='/10_DAO/red/listPage.jsp'"/>
						</td>
					</tr>
				</tfoot>
			</table>
			<%-- 회원정보수정, 비밀번호변경 이동시 넘겨 줄 파라미터 --%>
			<input type="hidden" name="no" value="${param.no} }">
		</form>
</body>
</html>