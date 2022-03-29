<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/header.css">
 	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
 	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
 	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
</head>
<body>
    <div id="header-layout">
    	<jsp:include page="header.jsp" />
    </div>
    
    <div id="container">
        <div id="sidebar-layout">
        	<div id="main-sidebar">
        		<br>
	            <div id="sidebar-area">
	                <i class="xi-at"></i>&nbsp;
	                <a href=""><b>Mail</b></a>
	                <br>
	                
	                <a href="email.form" class="side_subtitle side_subtitle">메일</a>

	                <br><br>
	
	                <i class="fi fi-rr-time-check"></i>&nbsp;
	                <a href="main.cm"><b>근태관리</b></a>

	                <br><br>
	                
	                <i class="xi-sitemap-o"></i>&nbsp;
	                <a href="officerList"><b>조직도</b></a>
	                <br><br>
	                
	                <i class="xi-document"></i>&nbsp;
	                <a href="signoffs.docu"><b>전자결재</b></a>

	                <br><br>
	                
	                <i class="xi-presentation"></i>&nbsp;
	                <a href="project.main"><b>프로젝트</b></a>
	                <br><br>
	                
	                <i class="xi-comment"></i>
	                <a href="list.co"><b>커뮤니티</b></a>

	                <br>
	                <a href="mylist.co" class="side_subtitle">내 게시글</a>
	                <br><br>
	                
	                <i class="xi-lightbulb-o"></i>&nbsp;
	                <a href="notice.no"><b>공지사항</b></a><br><br>
	                
	                <a href="logout.me">로그아웃</a>
	            </div>
        	</div>
        </div>

        <div id="content-layout">
           <div id="myproject-area">
               <span class="main_title_text">내 프로젝트</span><br><br>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div><br>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div>
               <div class="main_pj_div"></div>
           </div>

           <div id="commute-area">
             <!-- <span class="main_title_text">출퇴근</span> -->
             
             <button id="commute-on">출근</button>
             <button id="commute-off">퇴근</button>
           </div>
                </table>
            </div>
	        </div>
	    </div>
	    
	    <script>
	    	$(function(){
	    		$("#commute-on").click(function(){
	    			location.href = "on.cm";
	    			alert("출근 완료");
	    		})
	    		$("#commute-off").click(function(){
	    			location.href = "off.cm";
	    			alert("오늘 하루도 고생하셨습니다");
	    		})
	    		
	    	})
	   
	    </script>
           <div id="comming-sc-area">
             <span class="main_title_text">다가오는 일정</span>
             <ul>
               <li>Lorem</li>
               <li>Ipsum</li>
               <li>Dolor</li>
            </ul>
           </div>
           <div id="notice-area">
               <span class="main_title_text">공지사항</span>
               <br><br>
               <table id="noticeList" border="1">
				<thead style="text-align:center">
					<tr>
						<th style="width: 300px;">제목</th>
						<th style="width: 100px;">작성일</th> 
						<th style="width: 100px;"">작성자</th>
						<th style="width: 100px;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${ notice }">
						<tr>
							<td>${ n.boardTitle }</td>
							<td style="text-align:center">${ n.enrollDate }</td>
							<td class="writer" style="text-align:center">${ n.memberName }</td>
							<td style="text-align:center">${ n.count }</td>
							<td class="mno">${ n.boardWriter }</td>
							<td class="bno">${ n.boardNo }</td>
						</tr>
					</c:forEach>
				</tbody>
               </table>
           </div>
           <div id="todolist-area">
               <span class="main_title_text">TODOLIST</span>
               <ul>
                 <li><input type="checkbox" name="" id=""> ${loginUser.memberName}</li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-ss-Circle-small"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-ss-Circle-small"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-ss-Circle-small"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-rr-Angle-small-down"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-rr-Cross-circle"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-rr-Arrow-small-right"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-br-Angle-right"></i></li>
                 <li><input type="checkbox" name="" id=""><i class="fi fi-rs-inbox side_subtitle"></i></li>
                 <li><input type="checkbox" name="" id=""> <i class="fi fi-rr-folder"></i></li>
               </ul>
           </div>
        </div>
    </div>
    
	<script>
		window.onload = $(function(){
			$('.bno').hide();
			$('.mno').hide();
			
		})
		$(function(){
			$("#noticeList>tbody>tr").click(function(){
				location.href = 'detail.no?bno=' + $(this).children(".bno").text()+'&mno='+$(this).children(".mno").text();
				console.log($(this).children(".bno").text())
				console.log($(this).children(".writer").text())
				console.log($(this).children(".mno").text())
			})
		})
	</script>
</body>
</html>