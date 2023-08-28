<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
   width: 620px;
   height: 550px;
   margin: 0px auto;
}
#chatArea{
  height: 400px;
  overflow-y:auto;
  border:1px solid black;
  background-color: #E0F8F7;
}

#recvMsg > h5 {
  font-size: 13pt;
  border-radius:10px;
  margin-top: 5px;
  width:170px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
function connection() // 연결
{
	 // websocket => 웹에서 연결이 되게 만드는 소프트웨어 
	 websocket=new WebSocket("ws://localhost/web/site/chat/chat-ws");
	 websocket.onopen=onOpen;//callback(시스템 자동으로 호출)
	 websocket.onclose=onClose;
	 websocket.onmessage=onMessage;
}
function onOpen(event) // 연결되었을때 처리 
{
	 alert("채팅서버와 연결되었습니다!!");
}
function onClose(event) // 퇴장시 처리 
{
	 alert("채팅서버와 연결 종료되었습니다");
}
// roomin , makeroom , roomout
function onMessage(event) // 채팅 메세지 전송시 
{
	let data=event.data;
	if(data.substring(0,4)=="msg:")
	{
		appendMessage(data.substring(4));
	}
	
}
function disconnection() 
{
	//퇴장 버튼 클릭 
	websocket.close(); // onclose()
}
function send()
{
	let name=$('#name').val();
	if(name.trim()=="")
	{
		$('#name').focus();
		return;
	}
	let msg=$('#sendMsg').val();
	if(msg.trim()=="")
	{
		$('#sendMsg').focus();
		return;
	}
	let cur_session = '${sessionScope.name }';
	console.log("cur_session "+cur_session );
	console.log("name"+name);
	if(name == cur_session ) {
		websocket.send("msg:🐢["+name+"]: "+"<h5 style=background-color:yellow;>"+msg+"</h5>"); 
	} else {
		websocket.send("msg:🐢["+name+"]: "+"<h5 style=background-color:gray;>"+msg+"</h5>"); 
	}
	// onMessage
	$('#sendMsg').val("");
	$('#sendMsg').focus();
}
function appendMessage(msg)// 채팅 문자열 추가
{
	$('#recvMsg').append(msg+"<br>");
	let ch=$('#chatArea').height();
    let m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);
}
$(function(){
	$('#startBtn').click(function(){
		connection();
	})
	
	$('#endBtn').click(function(){
	    disconnection();
    })
    
    $('#sendBtn').click(function(){
	     send();
    })
    
    $('#sendMsg').keydown(function(key){
    	if(key.keyCode==13)
    	{
    	   send();	
    	}
    })
    
})
</script>
</head>
<body>
  <div class="container">
    <div class="row row1">
      <h1 class="text-center">쌍용 인테리어</h1>
      <table class="table">
       <tr>
        <td>
         이름:<input type=text id="name" size=15 class="input-sm" value="${sessionScope.name }" style="border: none;font-size: 20px;" readonly> 
         <input type=button id="startBtn" value="👋 문의하기" class="btn btn-sm btn-primary" style="margin-left:170px;">
         <input type=button id="endBtn" value="💨💣 퇴장" class="btn btn-sm btn-danger">
        </td>
       </tr>
       <tr>
         <td>
	         <div id="chatArea" style="border: none">
	           <div id="recvMsg"></div>
	         </div>
         </td>
       </tr>
       <tr>
         <td>
           <input type="text" id="sendMsg" size=80 class="input-sm" placeholder="메세지를 입력해주세요.">
           <input type=button id="sendBtn" value="💌" class="btn btn-sm btn-primary">
         </td>
       </tr>
      </table>
    </div>
  </div>
</body>
</html>