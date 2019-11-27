<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<tbody id="tBody">
			
			</tbody>
	</table>
	</div>
	<script>
		window.onload = function(){
			var xhr = new XMLHttpRequest();
			xhr.open('GET','/user/list/ajax')
			xhr.onreadystatechange = function(){
				if(xhr.readyState==4){
					if(xhr.status==200){
						var userList = JSON.parse(xhr.responseText);
						console.log(userList);
						var html='';
						for(var user of userList){
							html += '<tr>';
							html += '<td>' + user.uiNum + '</td>';
							html += '<td>' + user.uiName + '</td>';
							html += '<td>' + user.uiId + '</td>';
							html += '<td>' + user.credat + '</td>';
							html += '</tr>' 
						}
						document.querySelector('#tBody').innerHTML = html;
					}
		
				}
			}
			xhr.send();
		}
	</script>

</body>
</html>