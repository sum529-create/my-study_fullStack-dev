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
		// 1. pwConfirmPage.jsp에서 넘어온 정보
		var name= '${param.name}';
		var age = '${param.age}';
		var email ='${param.email}'; 
		// 2. 현재페이지(updatePage.jsp)에서 입력한 정보
		var name2 = f.name.value;
		var age2 = f.age.value;
		var email2 = f.email.value;
		// 이전에 넘어온 정보 중 변경된 정보가 있는 경우만 수정
		if(name != name2 || age != age2 || email != email2){
			f.action = "/10_DAO/red/update.jsp";
			f.submit();
		}else{
			alert('변경된 정보가 없습니다.');
			history.go(-2);
		}
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
						<td><input type="text" name="name" value="${param.name}"/> </td>	<!-- input타입이긴 하나 수정/변경 불가하게 한다. -->
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" value="${param.age}" /> </td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${param.email}"/> </td>					
					</tr>
					<tr>
						<td>가입일</td>
						<td>${param.regDate}</td>		
					</tr>
				</tbody>
						<!-- 이름, 나이, 이메일 만 form으로 이동됨 -->			
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="회원정보수정하기" onclick="fn_update(this.form)"/>
							<input type="button" value="수정취소하기" onclick="history.go(-2)"/>
							<%-- viewPage.jsp -> pwConfirm.jsp -> updatePage.jsp(현재) --%>
							<input type="button" value="목록으로이동하기" onclick="location.href='/10_DAO/red/listPage.jsp'"/>
						</td>
					</tr>
				</tfoot>
			</table>
			<%-- 회원정보수정, 비밀번호변경 이동시 넘겨 줄 파라미터 --%>
			<input type="hidden" name="no" value="${param.no}">
		</form>
</body>
</html>