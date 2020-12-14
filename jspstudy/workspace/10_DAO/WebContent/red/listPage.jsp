<%@page import="dto.RedDto"%>
<%@page import="dao.RedDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	// DB에서 RED 테이블 전체 목록을 가져온다.
	ArrayList<RedDto> list = RedDao.getInstance().list();
	// EL 처리를 위해서
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("size", list.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<link rel="stylesheet" href="../assets/style/red.css"/>
</head>
<body>

	
	<div class="wrap">
		현재 등록인원은 ${size}명입니다. <br/><br/>
		<table>
			<thead>
				<tr>
					<td>순번</td>
					<td>아이디</td>
					<td>이름</td>
					<td>나이</td>
					<td>이메일</td>
					<td>가입일</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="7">명단 없음</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach var = "redDto" items="${list}">
						<tr>
							<td>${redDto.no}</td>
							<td><a href="/10_DAO/red/viewPage.jsp?no=${redDto.no}">${redDto.id}</a></td>
							<!-- no, id, email => unique이기에 3중 하나 넣어도 됨 -->
							<td>${redDto.name}</td>
							<td>${redDto.age}</td>
							<td>${redDto.email}</td>
							<td>${redDto.regDate}</td>
							<td>
								<form method="get">
									<button onclick="fn_delete(this.form)">
										<i class="fas fa-trash-alt"></i>
									</button>
									<input type="hidden" name="no" value="${redDto.no}" /> <!-- 삭제할 번호 받아준다. -->
								</form>
								<script type="text/javascript">
									function fn_delete(f) {
										if(confirm('삭제할까요?')){
											f.action = '#';
											f.submit();
										}
									}
								</script>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>
