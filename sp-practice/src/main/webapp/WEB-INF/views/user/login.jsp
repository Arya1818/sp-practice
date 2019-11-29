<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<style>
	div.container{
	height:200px;
	width:500px;
	border:1px solid #ffffff;
	}
</style>
</head>
<body>
<div class="container" id="loginForm">

 </div>
 <script>
window.onload = function(){
	var dhWin = new dhx.Window({width:500,height:300,title:'Login'});
	//dhWin.show();
	var form = new dhx.Form('loginForm',{
			cellCss: "dhx_widget--bordered",
			rows: [
				{
					type: "input",
					label: "아이디",
					icon: "dxi dxi-magnify",
					placeholder: "아이디를 넣어주세요",
					id : "uiId"
				},
				{
					type: "input",
					inputType: "password",
					label: "비밀번호",
					placeholder: "비밀번호를 넣어주세요",
					id : "uiPwd"
				},
				{
					type: "button",
					value: "Login",
					size: "medium",
					view: "flat",
					submit: true,
					color: "primary",
					id : 'loginBtn'
				},
			]
		});
	form.events.on("ButtonClick", function(id,e){
		if(id=='loginBtn'){
			doLogin();
		}
	});
		
	}

 function doLogin(){
	
	 var xhr = new XMLHttpRequest();
	 xhr.open('POST','/user/login');
	 xhr.setRequestHeader('Content-Type','application/json');
	 xhr.onreadystatechange = function(){
		 if(xhr.readyState==4){
			 if(xhr.status==200){
				var user = JSON.parse(xhr.responseText);
				alert(user.uiName + '님 반갑습니다.');
				location.href='/views/userInfo/list';
			 }
		 }
	 }
 
 var param = {
		 uiId : document.querySelector('#uiId').value,
		 uiPwd : document.querySelector('#uiPwd').value,
 }
 console.log(param);
 param = JSON.stringify(param);
 xhr.send(param);
 }
 </script>
</body>
</html>