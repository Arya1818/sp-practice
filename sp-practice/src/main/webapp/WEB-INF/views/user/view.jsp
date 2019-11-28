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
	<h3>VIEW</h3>
	<table class="table table bordered">
			<tr>
				<th>번호</th>
				<td data-id="uiNum"><input type="hidden" value="${param.uiNum}"></td>
			</tr>
			<tr>	
				<th>이름</th>
				<td data-id="uiName"></td>
			</tr>
			<tr>	
				<th>아이디</th>
				<td data-id="uiId"></td>
			</tr>
			<tr>	
				<th>비밀번호</th>
				<td data-id="uiPwd"></td>
			</tr>
			<tr>	
				<th>가입일자</th>
				<td data-id="credat"></td>
			</tr>
			<tr>	
				<th>가입시간</th>
				<td data-id="cretim"></td>
			</tr>
			<tr>
			<th colspan="2">
				<button onclick="updateUser()">수정</button>
				<button onclick="deleteUser()">삭제</button>
				<button onclick="goPage('/user/list')">리스트가기</button>
			</th>
			</tr>
	</table>
	</div>
	
	<script>
	function goPage(url) {
		location.href = '/views' + url;

	}
		window.onload = function(){
			var xhr = new XMLHttpRequest();
			xhr.open('GET','/user/list/ajax/view?uiNum=${param.uiNum}');
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState ==xhr.DONE){
					if(xhr.status==200){
						user = JSON.parse(xhr.responseText);
						console.log(user);
						if(user==null){
							alert('존재하지않음');
						}else{
							var tds = document.querySelectorAll('td[data-id]');
							for(var t=0; t<tds.length; t++){
								var td = tds[t];
								var att = td.getAttribute('data-id');
								td.innerHTML = user[att];
							}
						}
					}
				}
			}
			xhr.send();
		}
		
		function updateUser(){
			var xhr = new XMLHttpRequest();
			xhr.open('PUT','/user/list/ajax');
			xhr.onreadystatechange = function(){
				if(xhr.readyState == xhr.DONE){
					if(xhr.status == 200){
						var res = JSON.parse(xhr.responseText);
						alert(res.cnt);
						if(res.cnt==1){
							goPage('/user/list');
						}
					}
				}
			}
			var param = {
				uiName : docmuent.querySelector('input[id=uiName]').value,
				uiPwd : document.querySelector('input[id=uiPwd]').value,
				uiNum : user.uiNum
			}
			param = JSON.stringify(param)
			xhr.send(param);
		}
		
		function deleteUser(){
			var xhr = new XMLHttpRequest();
			xhr.open('DELETE','/user/list/ajax');
			
		}
	</script>
</body>
</html>