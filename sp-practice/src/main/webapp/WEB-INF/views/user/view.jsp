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
				<button onclick="update(this)">수정</button>
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
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.onreadystatechange = function(){
				if(xhr.readyState ==xhr.DONE){
					if(xhr.status==200){
						user = JSON.parse(xhr.responseText);
						//console.log(user);
						if(user==null){
							alert('존재하지않음');
						}else{
							var tds = document.querySelectorAll('td[data-id]');
							for(var idx=0; idx<tds.length; idx++){
								var td = tds[idx];
								var key = td.getAttribute('data-id');
								td.innerHTML = user[key];
							}
						}
					}
				}
			}
			xhr.send();
		}
		
		function update(btn) {
			btn.onclick = updateUser;
			var res = document.querySelectorAll('td[data-id]');
			for (var i = 0; i < res.length; i++) {
				var td = res[i];
				var id = td.getAttribute('data-id');
				console.log(id);
				td.innerHTML = '<input type="text" id="' + id + '" value="'+ user[id]+'">';
				
			}

		}
		function updateUser(){
			var xhr = new XMLHttpRequest();
			xhr.open('PUT','/user/list/ajax');
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.onreadystatechange = function(){
				if(xhr.readyState == xhr.DONE){
					if(xhr.status == 200){
						var res = JSON.parse(xhr.responseText);
						alert(res.cnt);
						if(res.cnt==1){
							goPage('/user/list');
							alert('수정 완료');
						}
					}
				}
			}
			var param = {
				uiNum : user.uiNum,
				uiName : document.querySelector('#uiName').value,
				uiId : document.querySelector('#uiId').value,
				uiPwd : document.querySelector('#uiPwd').value,
				credat : user.credat,
				cretim : user.cretim,
			
			}
			param = JSON.stringify(param);
			xhr.send(param);
		}
		
	</script>
</body>
</html>