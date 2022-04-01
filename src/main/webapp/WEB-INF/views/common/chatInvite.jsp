<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<style>
         body {
            width: 100%;
            position: relative;
            color: #333333;
            font-size: 14px;
            line-height: 1.15;
            height: 650px;
            margin: 0;
        }
        /* 인풋 박스 클릭시 테두리 없애기 */
        input:focus {outline:none;}
        .invite-search-wrap{
            width: 100%;
        }
        
        /*스크롤바 변경*/
		::-webkit-scrollbar { width: 5px; height: 0px; }
		/* 스크롤바의 width */
		::-webkit-scrollbar-track { background-color: #f0f0f0; }
		/* 스크롤바의 전체 배경색 */
		::-webkit-scrollbar-thumb { 
		    background: linear-gradient(to bottom, #505050, #505050); 
		}
		/* 스크롤바 색 */
		::-webkit-scrollbar-button { display: none; }
        .search-box {
            margin: 10px 12px;
            height: 32px;
            width: 445px;
            line-height: 32px !important;
            border: 1px solid #e7e7e7;
            border-radius: 4px;
        }
        .chat-search-input {
            border: none;
            width: 400px;
            line-height: 25px;
            padding-left: 10px;
        }
        .chat-search {
            padding-top: 12px;
            margin-top: 10px;
            vertical-align: middle;
            margin-right: 5px;
        }
 
        .chat-invite-top {
            width: 470px;
            height: 65px;
            background-color:#e7e7e7;
            margin:0 auto;
        }
        .chat-invite-wrap {
            line-height: 60px;
            color: #333333;
            font-weight: bold;
            text-align: center;
        }
        .invite-exit{
            float: right;
            margin: 20px;
            width: 25px;
            height: 25px;
        }
        .invite-search{
            padding-left:10px;
        }
        .invite-rs{
            line-height: 40px;
            height: 520px;
            overflow: scroll;
        }
        .tel-my-img{
	        line-height: 68px;
	        width: 100px;
	        display:inline-block;
	        float:right;
        }
        .invite-names{
	        width: 300px;
	        height:50px;
	        line-height:20px;
	        padding-top:5px;
	        display:inline-block;
        }
        .invite-name{
        	font-size:13px;
        	color:#333333;
        	font-weight: bold;
        	padding-left:20px;
        
        }
        .invite-email{
        	font-size:10px;
        	color:#787878;
        }
        .invite-check-wrap{
	        line-height: 50px;
	        width: 100px;
	        display:inline-block;
	        float:right;
	        text-align: right;
	    }
	    
	    .invite-check{
	        border-radius: 70%;
		    border: 1px solid #bebebe;
		    width: 15px;
		    height: 15px;
		    cursor: pointer;
        
        }
			
        .invite-img-file{
      		width: 30px;
      		height: 30px;
      		border-radius:15px !important;
        }
        .invite-img{
        	line-height: 50px;
        	padding:10px;
        	vertical-align: middle;
        	margin-left:10px;
        }
        .invite-imgs{
       	    border-radius: 90px;
    		box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
        }
      
        .tel-other{
           vertical-align: middle;
        }
        .submit-wrap{
            padding: 6px 0;
		    border-top-color: #e8e8e8;
		    border-top-width: 1px;
		    border-top-style: solid;
		    position: fixed;
		    text-align: center;
		    bottom:0px;
		    background-color: #fff;
		    height :40px;
		    width: 100%;
		    vertical-align: middle;
        }
        .resetbtn{
        	width: 100px;
        	height: 40px;
        	border: 1px solid #432D73;
        	color:#432D73;
        	font-size:12px;
        	border-radius: 3px;
        	background: #fff;
        }
        .submitbtn{
            width: 100px;
        	height: 40px;
        	border: 1px solid #fff;
        	color:#fff;
        	font-size:12px;
        	border-radius: 3px;
        	background: #432D73;
        	margin-left:5px;
        }
</style>
</head>
<body>

    <script>
        $(function(){
            // console.log('${list}');

            //상대방 검색기능
            $(".chat-search-input").keyup(function(){
                var c = $(this).val();
                $(".inviteList-table tr").hide();
                console.log("검색어:"+c);
                var temp = $(".inviteList-table td:contains('"+c+"')");
                console.log("temp"+temp);
                
                $(temp).parent().show();
            });
        })

        function _submit(e){
            if(typeof(e.elements['memberNo'].length) == 'undefined'){
                if(e.elements['memberNo'].checked == false){
                    e.elements['memberName'].disabled=true;
                }
            }
            else{
                for(i=0; i<e.elements['memberNo'].length; i++){
                    if(e.elements['memberNo'][i].checked == false){
                        e.elements['memberName'][i].disabled=true;
                    }
                }
            }
            return true;
        }


    </script>

    <div class="invite-search-wrap">
        <div class="chat-invite-top">
            <p class="chat-invite-wrap">
                <span class="invite-title">대화상대 초대</span>
                <a href=""></a>
            </p>
        </div>
        <div class="search-box">
            <span class="invite-search"></span>
            <input type="text" class="chat-search-input" placeholder="이름, 이메일으로 검색">
        </div>
            <form action="chatInviteAdd" method="post" class="chatfrm1" onsubmit="_submit(this);">
                <div class="invite-rs">
                    <!-- c:if, c:forEach -->
                    <c:if test="${ empty list }">
                        검색 결과가 없습니다.
                    </c:if>
                    <table class="inviteList-table">
                        <c:if test="${ not empty list }">
                            <c:forEach items="${ list }" var="list" varStatus="e">
                                <tr class="tel-other">
                                    <td class="invite-img">
                                        
                                    </td>
                                    <td class="invite-names">
                                        <input type="hidden" name="memberName" value="${ list.memberName }">
                                        <p class="invite-name">${ list.memberName }
                                            <span class="invite-email">${ list.email }</span>
                                        </p>
                                    </td>
                                    <td class="invite-check-wrap">
                                        <input type="checkbox" class="invite-check" name="memberNo" value="${ list.memberNo }" id="check${ e.count }">
                                        <label for="check${ e.count }"></label>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                    </table>
                    
                    <div class="submit-wrap">
                        <button type="reset" class="resetbtn">취소</button>
                        <button type="submit" class="submitbtn">대화방 초대</button>
                    </div>
                </form>
        </div>
    </div>
</body>
</html>