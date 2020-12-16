<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>request의 PersonDto</h3>
	
	<ul>
		<li>이름: ${personDto.name }</li>
		<li>나이: ${personDto.age }</li>
		<li>주소: ${personDto.address }</li>
		<li>성별: ${personDto.gender }</li>
		<li>관심: ${personDto.interests[0]}&nbsp;${personDto.interests[1]}&nbsp;${personDto.interests[2]}</li>
	</ul>
	
	<h3>session의 PersonDto</h3>
	
	<ul>
		<li>이름: ${sessionScope.personDto.name }</li>
		<li>나이: ${sessionScope.personDto.age }</li>
		<li>주소: ${sessionScope.personDto.address }</li>
		<li>성별: ${sessionScope.personDto.gender }</li>
		<c:forEach var="interest" items="${sessionScope.personDto.interests}">
			<li>관심: ${interest}&nbsp;</li>
		</c:forEach>
	</ul>
	
	<h3>request의 PersonMap</h3>
	
		<ul>
		<li>이름: ${personMap.name }</li>
		<li>나이: ${personMap.age }</li>
		<li>주소: ${personMap.address }</li>
		<li>성별: ${personMap.gender }</li>
		<li>관심: ${personMap.interests }</li>
	</ul>
	
	<h3>session의 PersonMap</h3>
	
	<ul>
		<li>이름: ${sessionScope.personMap.name }</li>
		<li>나이: ${sessionScope.personMap.age }</li>
		<li>주소: ${sessionScope.personMap.address }</li>
		<li>성별: ${sessionScope.personMap.gender }</li>
		<li>관심: ${sessionScope.personMap.interests }</li>
	</ul>
	
	<br/><br/>
	
	<table border="1">
		<thead>
			<tr>
				<td>이름</td>
				<td>나이</td>
				<td>주소</td>
				<td>성별</td>
				<td>관심사</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${personList}">
				<tr>
					<td>${p.name }</td>
					<td>${p.age }</td>
					<td>${p.address }</td>
					<td>${p.gender }</td>
					<td>
						<c:forEach var="interest" items="${p.interests}">
							${interest}&nbsp;
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>