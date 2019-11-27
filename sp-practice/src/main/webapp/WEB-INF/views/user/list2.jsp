<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
	<h1>User List</h1>
	<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>가입일자</th>
			</tr>
			<c:forEach var="list" items="${strList}">
				<tr>
					<td>${list.uiNum}</td>
					<td>${list.uiName}</td>
					<td>${list.uiId}</td>
					<td>${list.credat}</td>
				</tr>
			</c:forEach>
	</table>
	</div>
	

</body>
</html>