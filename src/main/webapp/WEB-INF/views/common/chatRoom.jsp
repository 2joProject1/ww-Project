<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet"
		href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<style>
        div{
        box-sizing: border-box;
    }
    .scroll_div::-webkit-scrollbar {
        width: 6px;
    }
    .scroll_div::-webkit-scrollbar-thumb {
        background-color: #2f3b42;
    }
    .scroll_div::-webkit-scrollbar-track {
        background-color: grey;
    }

    /*스크롤바 변경*/
    ::-webkit-scrollbar { width: 5px; height: 0px; }
    /* 스크롤바의 width */
    ::-webkit-scrollbar-track { background-color: #f0f0f0; }
    /* 스크롤바의 전체 배경색 */
    ::-webkit-scrollbar-thumb { 
        background: linear-gradient(to bottom, #5A3673, #432D73); 
    }
    /* 스크롤바 색 */
    ::-webkit-scrollbar-button { display: none; }
    body{
        width: 470px;
        height: 650px;
        margin: 0;
    }
    .chat-wrap{
        background-color: rgba(203, 212, 212, 0.918);
        width: 470px;
        height: 650px;
        /* position: absolute; */
        /* right: 230px; */
    }

    .chat-header{
        height: 7%;
        background-color: #4084ac;
    }
    .chat-name{
        font-weight: bolder;
        font-size: x-large;
        color: rgb(66, 66, 66);
        margin: 13px 0 0 15px;
    }
    .chat_ul{
        padding: 0 20px;
    }
    .chat-con{
        background-color: rgba(236, 255, 255, 0.603);
        height: auto;
        padding: 8px 10px;

    }
    .chat_li{
        /* width: auto; */
        width: max-content;
        align-content: center;
        align-items: center;
        margin-bottom: 50px;
        list-style: none;
    }
    .myself{
        float: right;
    }
    .chat-area{
        resize: none;
        margin: 4px 0 5px 5px;
    }
    .chat-content{
        overflow-y: auto;
        height: 73%;
    }
    .chat-footer{
        background-color: #2f3b42;
        width: 100%;
        height: 20%;
    }
    .chat-footer>div{
        float: left;
    }
    .chat-text-area{
        width: 82%;
        height: 100%;
    }
    .chat-area{
        width: 370px;
        height: 115px;
    }
    .button-area{
        width: 18%;
        height: 100%;
    }
    .chat-button{
        margin-top: 5px;
        margin-left: 1px;
        background-color: rgb(203, 212, 212);
        border: none;
        font-weight: bolder;
        color: rgb(66, 66, 66);
        width: 97%;
        height: 47%;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <input type="hidden" name="chatNo" id="chatNo" value="${ chatNo }">
    <input type="hidden" name="chatName" id="chatName" value="${ chatName }">
    <input type="hidden" name="memberNo" id="memberNo" value="${ loginUser.memberNo }">
    <input type="hidden" name="memberName" id="memberName" value="${ loginUser.memberName }">
    <script> 
            /* 팝업창 열릴 때 웹소켓 서버에 접속 시도 */
            var chatNo = $('#chatNo').val();
            console.log(chatNo);
            var socket = new WebSocket("ws://localhost:8036/ww/sc?chatNo=" +chatNo);
            console.log(socket + "소켓");

            socket.onopen = function(){
                console.log("안뇽");
            }
            
            console.log($('#chatNo').val());
            console.log($('#chatName').val());
            console.log($('#memberNo').val());
            console.log($('#memberName').val());


        $(function(){
        	
        	$('.scroll_div').scrollTop($('.scroll_div')[0].scrollHeight);
        	
            socket.onmessage = onMessage;
            socket.onclose = onClose;
            
            $('#message').keypress(function(e){
                if(e.which == 13){
                    $('#sendBtn').click();
                    return false;
                }
            });

            $('#sendBtn').click(function(){
            	var text = $('#message').val();
            	if(!text){
            		return;
            	}
                console.log('send message 하러 간다');
                // DB에 채팅 Content 저장하러 간다
                $.ajax({
                    url: "contentAdd",
                    data: {
                        message : $('#message').val(),
                        chatNo : $('#chatNo').val(),
                        memberNo : $('#memberNo').val()
                    },
                    success: function(result){
                        console.log(result);
                    },
                    error: function(request, status, error){
                    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        console.log("실패");
                    }
                });
                sendMessage();
            });

            function sendMessage(){
                // WebSocket 으로 메세지 전송
                var msg = $('#message').val();
                var chatNo = $('#chatNo').val();
                var memberName = $('#memberName').val();
                socket.send(chatNo+","+msg+","+memberName);
                
                console.log(chatNo);

                console.log('메세지 보냈습니다.');

                $('#message').val('');
            };

            function onMessage(e){
                console.log("websocket이 보내준 data : " + e);
                
                var data = e.data;
                var memberName = null;
                var message = null;
                
                var strArray = data.split('|');
                
                for(var i=0; i<strArray.length; i++){
                	console.log('str[' + i + '] : ' + strArray[i]);
                }
                
                var currentMemberName = $('#memberName').val();
                
                console.log("현재 currentMemberName : " + currentMemberName);
                
                memberName = strArray[0];	// 현재 메세지를 보낸 사람 이름
                message = strArray[1];		// 현재 메세지
                
                console.log("보낸 사람 MemberName : " + memberName);
                if(memberName == currentMemberName) { // 내가 보낸게 인식이 안댕
                    var printHTML = "<li class='chat_li myself'>";
                        printHTML += "<div class='chat-con'>" + message + "</div>";
                        printHTML += "<div class='chat-time'>시간</div>";
                        printHTML += "</li>";
                        printHTML += "<br clear='both'>"
                    
                    $('.chat_ul').append(printHTML);
                } else {
                    var printHTML = "<li class='chat_li other'>";
                        printHTML += "<div class='chat-othername'>" + memberName + "</div>";
                        printHTML += "<div class='chat-con'>" + message + "</div>";
                        printHTML += "<div class='chat-time'>시간</div>";
                        printHTML += "</li>";
                    $('.chat_ul').append(printHTML);
                }

                $('.scroll_div').scrollTop($('.scroll_div')[0].scrollHeight);
            };
            
            function onClose(e){
            	
            };
            
            // function resizeWindow(win) {
            //     var wid = win.document.body.offsetWidth + 30;
            //     var hei = win.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임
            //     win.resizeTo(wid,hei);
            // }
        })
    </script>

<div class="chat-wrap" style="font-size: 15px;">
    <div class="chat-header">
        <span class="chat-name">${ chatName }</span>
    </div>
    <div class="scroll_div chat-content">
        <!-- 채팅창 리스트 -->
        <ul class="list-group chat_ul">
        	<c:forEach items="${ conList }" var="list">
        		<c:if test="${ list.memberName ne loginUser.memberName }">
        			<li class="chat_li other">
        				<div class="chat-othername">${ list.memberName }</div>
        				<div class="chat-con">${ list.chatContent }</div>
        				<div class="chat-time">${ list.formatDate }</div>
        			</li>
        		</c:if>
        		<c:if test="${ list.memberName eq loginUser.memberName }">
		            <li class="chat_li myself">
		                <div class="chat-con">${ list.chatContent }</div>
		                <div class="chat-time">${ list.formatDate }</div>
		            </li>
		            <br clear="both">
        		</c:if>
        	</c:forEach>
            <!-- <li class="chat_li other">
                <div class="chat-othername">상대방 이름</div>
                <div class="chat-con">채팅 내용</div>
                <div class="chat-time">채팅 시간</div>
            </li>
            <li class="chat_li myself">
                <div class="chat-con">채팅 내용</div>
                <div class="chat-time">시간</div>
            </li> -->
        </ul>
    </div>
    <div class="chat-footer">
        <div class="chat-text-area"><input type="text" class="chat-area" id="message" name="message"></input></div>
        <div class="button-area"><input type="submit" class="chat-button" id="sendBtn" value="전송"></div>
    </div>
</div>
</body>
</html>