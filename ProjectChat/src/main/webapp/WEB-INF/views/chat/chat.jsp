<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	.container{
		width: 500px;
		margin: 0 auto;
		padding: 25px
	}
	.container h1{
		text-align: left;
		padding: 5px 5px 5px 15px;
		color: #FFBB00;
		border-left: 3px solid #FFBB00;
		margin-bottom: 20px;
	}
	.chating{
		background-color: #000;
		width: 500px;
		height: 500px;
		overflow: auto;
	}
	.chating p{
		color: #fff;
		text-align: left;
	}
	input{
		width: 330px;
		height: 25px;
	}
</style>
</head>
<script type="text/javascript">
	var ws;

	onload = function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<p>" + msg + "</p>");
			}
		}
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
		
		var data = { name: uN, chatting: msg};
		var json = JSON.stringify(data);
		var xhr = new XMLHttpRequest();
		
		xhr.open("POST", "chatting", true);
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.onreadystatechange = function() {
		    if (xhr.readyState === 4 && xhr.status === 200) {
		        var response = JSON.parse(xhr.responseText);
		        console.log(response);
		    }
		};
		xhr.send(json);
	}
</script>
<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th><input type="text" name="userName" id="userName" hidden="${userName}" value="${userName}"/></th>
				</tr>
			</table>
		</div> 
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
	
</body>
</html>