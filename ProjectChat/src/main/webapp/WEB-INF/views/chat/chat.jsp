<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	const username = $("#userName").val();
    $("#button-send").on("click", (e) => {
        send();
    });
    const websocket = new WebSocket("ws://localhost:8588/ws/chat");

    websocket.onmessage = onMessage;
    websocket.onopen = onOpen;
    websocket.onclose = onClose;

    function send(){
		
        let msg = document.getElementById("msg");
	
        console.log(username + ":" + msg.value);
        websocket.send(username + ":" + msg.value);
        msg.value = '';
    }
    //enter 누르면 전송
    var input = document.getElementById("msg");

    input.addEventListener("keyup", function (event) {
      if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("button-send").click();
      }
    });
    //채팅방 퇴장
    function onClose(evt) {
        var str = username + ": 님이 방을 나가셨습니다.";
        websocket.send(str);
        
        websocket.close();
    }
    
    //채팅방 입장
    function onOpen(evt) {
        var str = username + ": 님이 입장하셨습니다.";
        websocket.send(str);
    }
    function onMessage(msg) {
        
        var data = msg.data;
        var sessionId = null;
        //데이터를 보낸 사람
        var message = null;
        var arr = data.split(":");

        for(var i=0; i<arr.length; i++){
            console.log('arr[' + i + ']: ' + arr[i]);
        }
        var cur_session = username;

        //현재 세션에 로그인 한 사람
        console.log("cur_session : " + cur_session);
        sessionId = arr[0];
        message = arr[1];

        console.log("sessionID : " + sessionId);
        console.log("cur_session : " + cur_session);

        //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
        if(sessionId == cur_session){
            var str = "<div>";
            str += "<div class='alert alert-primary'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
        }
        else{
            var str = "<div>";
            str += "<div class='alert alert-secondary'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
            $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
        }
    }
    $(window).on('beforeunload', function() {
    // onClose 함수를 호출합니다.
    onClose();
	});
})

</script>
<style>
    #msgArea {
        height: 470px;
        overflow-y: auto; /* 스크롤이 필요할 때만 표시되도록 설정 */
    }
    
</style>
<body>
    <div class="container">
       <div class="col-6">
           <label><b>채팅방</b></label>
          <input type="text" name="userName" id="userName" hidden="${userName}" value="${userName}"/>
       </div>
       <div>
       <div id="msgArea"></div>
       <div class="input-group mb-3">
           <input type="text" id="msg" class="form-control" aria-label="Recipient's username" 
           	aria-describedby="button-addon2">
           <div class="input-group-append">
               <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
           </div>
       </div>
       </div>
     </div>
</body>
</html>