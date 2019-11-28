<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
	<div class="container">
		<h3>Sign up</h3>
		<table class="table table-bordered">
			<tr>
				<th>이름</th>
				<td><input type="text" id="uiName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="uiId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="uiPwd"></td>
			</tr>
			<tr>
				<th colspan="2"><button onclick="save()">저장</button>
			</th>
		</table>
		<script>
		function goPage(url) {
			location.href = '/views' + url;

		}
			function save(){
				var xhr = new XMLHttpRequest();
				xhr.open('POST', '/user/list/ajax'); //userController url매핑
				xhr.setRequestHeader('Content-Type','application/json');
				xhr.onreadystatechange = function(){
					if(xhr.readyState==4){
						if(xhr.status==200){
							var res = JSON.parse(xhr.responseText);
							alert(res.cnt);
							if(res.cnt==1){
								goPage('/user/list');
							}
						}
					}
				}
				var param = {
						uiName : document.querySelector('#uiName').value,
						uiId : document.querySelector('#uiId').value,
						uiPwd : document.querySelector('#uiPwd').value
				}
				console.log(param);
				param = JSON.stringify(param)
				xhr.send(param);
			}
			
		</script>
	</div>
</body>
</html>