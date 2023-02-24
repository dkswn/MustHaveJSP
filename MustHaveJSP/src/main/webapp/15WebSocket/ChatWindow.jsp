
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script>
	var webSocket = new WebSocket(
			"<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
	var chatWindow, chatMessage, ChatId;

	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById("chatId").value;
	}

	function sendMessage() {
		chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value
				+ "</div>"
		webSocket.send(chatId + '|' + chatMessage.value);
		chatMessage.value = "";
		chatWindow.scrollTop = chatWindow.scrollHeight;
	}

	function disconnect() {
		webSocket.close();
	}

	function enterkey() {
		if (window.event.keyCode == 13) {
			sendMessage();
		}
	}

	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
	};

	webSocket.onclose = function(event) {
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
	};

	webSocket.onerror = function(event) {
		alert(event.date);
		chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
	};

	webSocket.inMessage = function(event) {
		var message = event.date.split("|");
		var sender = message[0];
		var content = message[1];
		if (content != "") {
			if (content.match("/")) {
				if (content.math(("/" + chatId))) {
					var temp = content.replace(("/" + charId), "[귓속말] : ");
					chatWindow.innerHTML += "<div>" + sender + "" + temp
							+ "</div>";
				}
			} else {
				chatWindow.innerHTML += "<div" + sender + " : " + content
						+ "</div>";
			}
		}
		chatWindow.scrollTop = chatWindow.scrollHeight;
	};
</script>
<style>
	#chatWindow{border:1px solid black; width:270px; height:310px; overlow:scroll; padding:5px;}
	#chatMessage{width:236px; height:30px;}
	#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
	#closeBtn{margin-bottom:3px; pos\ition:relative; top:2px; left:-2px;}
	#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
	.myMsg{text-align:right;}
</style>
</head>
<body>
	대화명 : <input type="text" id="chatId" value="${ param.chatId }" readonly/>
	<button id = "closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id ="chatMessage" onkeyup="enterKey();">
		<button id = "sendBtn" onclick="sendMessage();">전송</button>
	</div>
</body>
</html>