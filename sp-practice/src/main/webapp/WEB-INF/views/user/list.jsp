	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1>USER LIST</h1>
		<div class="search">
			<label for="uiName">이름</label>
			<!-- label for=uiName 으로 되어있으니 밑에 id=uiName로 하면 텍스트만 눌러도 체크됨 -->
			<input type="checkbox" name="search" value="ui_name" id="uiName">
			<label for="uiId">ID</label> 
			<input type="checkbox" name="search" value="ui_id" id="uiId"> 
			<label for="uiNum">번호</label> 
			<input type="checkbox" name="search" value="ui_num" id="uiNum">
			<input type="text" id="searchStr">
			<button id="searchBtn">검색</button>
		</div>
		<table class="table table-hover">
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>가입일자</th>
			</tr>
			<tbody id="tBody">

			</tbody>
		</table>
		<button onclick="goPage('/user/signup')">회원가입</button>
		<button id="deleteBtn">삭제</button>
	</div>

	<script>
	function goPage(url) {
		location.href = '/views' + url;

	}
	
	function getUserList(user){
		var xhr = new XMLHttpRequest();
		xhr.open('GET','/user/list/ajax?' + user); //?꼭붙이기
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					var userList = JSON.parse(xhr.responseText);
					console.log(userList);
					var html='';
					for(var user of userList){
						html += '<tr>' 
						html += '<td data-col="checkRmv"><input type="checkbox" name="remove" value="'+user.uiNum+'"></td>';
						html += '<td onclick="goPage(\'/user/view?uiNum=' + user.uiNum + '\')">' + user.uiNum + '</td>';
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
		window.onload = function(){
			getUserList(''); //여기서 getUserList 호출
			var btn = document.querySelector('#searchBtn');
			btn.onclick = function(){
				var checks = document.querySelectorAll('[name=search]:checked'); // name이 search인것중에 checked만 가져와 (length)
				if(checks.length<1){
					alert('검색대상을 1개라도 선택해주세요');
					return;
				}
				var searchStr = document.querySelector('#searchStr');
				if(searchStr.value.trim().length<1){
					alert('검색어를 입력해주세요');
					return;
				}
				var search ='';
				for(var i=0; i<checks.length; i++){
					search += 'search=' + checks[i].value + '&';
				}
				search += 'searchStr=' + searchStr.value;
				alert(search);
				getUserList(search); //'조'라고 쳤을 때 search=uiName&searchStr=조 나오는데 이것을 getUserList에 넣어주면 됨!
				//UserController로 가서 RequestParam Map<String,String> param 넣어줌
			}
		}
		
		var deleteBtn = document.querySelector('#deleteBtn');
		deleteBtn.onclick = function(){
			var checkRmv = document.querySelectorAll('input[name=remove]:checked');
			if(checkRmv.length<1){
				alert('삭제할 사용자를 한명이상 선택해주세요');
				return;
			}
			var uiNums = '';
			for(var i=0;i<checkRmv.length;i++){
				uiNums += 'uiNums=' + [checkRmv[i].value] + '&';
			}
			console.log(uiNums);
		
			var dhr = new XMLHttpRequest();
			dhr.open('DELETE','/user/list/ajax?' + uiNums);
			dhr.setRequestHeader('Content-Type','application/json');
			dhr.onreadystatechange = function(){
				if(dhr.readyState==dhr.DONE){
					if(dhr.status==200){
						var res = JSON.parse(dhr.responseText);
						console.log(res);
						if(res.cnt!=0){
							location.href='/views/user/list';
					}
				}
			}
		}
		dhr.send(uiNums);
	}	
	</script>



</body>
</html>