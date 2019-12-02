<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<style>
div#userGrid{
	width:403px;
	height:600px;}
</style>

</head>
<body>
<div id="userGrid"></div>
<button onclick="pickData()">데이터</button>
<script>
function pickData(){
	var row = grid.data.getItem(141); //getItem은 function
	console.log(row);
}
var list = [];
var grid;
function getUserList(user){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?' + user); //?꼭붙이기
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				list = JSON.parse(xhr.responseText);
				list.forEach(ui=>{
					ui.id = ui.uiNum; //uiNum 이 특정 row의 id가 됨
				})
				console.log(list);
				grid = new dhx.Grid('userGrid',{
					columns : [
						{width:100,id:'uiNum',header:[{text:'번호'}],editing:false},
						{width:100,id:'uiId',header:[{text:'아이디'}]},
						{width:100,id:'uiName',header:[{text:'이름'}]},
						{width:100,id:'credat',header:[{text:'가입일'}]}
					],
					headerRowHeight:20,
					data : list,
					editing : true	
				});
				grid.events.on("CellClick",function(row,column){
					console.log(row);
					console.log(column);
				})
			}else{
				console.log(xhr.responseText);
				alert('로그인이 필요한 요청입니다');
				location.href='/views/user/login';
			}

		}
	}
	xhr.send();
}
window.onload = function(){
	getUserList();
}
</script>
</body>
</html>