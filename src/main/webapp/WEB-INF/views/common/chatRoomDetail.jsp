<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
        $(function(){
            /* 팝업창 열릴 때 웹소켓 서버에 접속 시도 */
            var ws = new WebSocket("ws://localhost:8036/ww/sc");

            ws.onopen = function(){
                console.log("안뇽");
            }
            
        })
    </script>
    <h1>안뇽~</h1>
</body>
</html>