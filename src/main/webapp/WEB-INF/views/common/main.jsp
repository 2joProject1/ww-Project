<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WALK-WORK</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
<style>
/* div{
	border:1px solid red;
} */
	#comming-sc-area li{
		list-style:none;
	}
	.atag{
		text-decoration:none;
		color:black;
	}
	.atag:hover{
		text-decoration:none;
		color:black;
	}
	.main_pj_div{
		text-align:center;
		padding-top:32px;
		color:white;
		margin-bottom:5px;
		margin-left:4px;
	}
	.main_pj_div div{
		color:black;
	}
	#noticeList>tbody>tr:hover{
		background-color:rgb(237, 241, 241);
	}
	#noticeList>thead>tr{
        
        	BORDER-BOTTOM: solid 1px grey;
			BORDER-LEFT: medium none;
			BORDER-RIGHT: medium none;
			BORDER-TOP: medium none;
			outline: none;
        
	}

	


</style>

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
					<a href="">
						<b>Mail</b>
					</a>
					<br>

					<a href="email.form" class="side_subtitle side_subtitle">메일</a>

					<br> <br> <i class="fi fi-rr-time-check"></i>&nbsp;
					<a href="main.cm">
						<b>근태관리</b>
					</a>

					<br> <br> <i class="xi-sitemap-o"></i>&nbsp;
					<a href="officerList.li">
						<b>조직도</b>
					</a>
					<br> <br> <i class="xi-document"></i>&nbsp;
					<a href="signoffs.docu?format=1">
						<b>전자결재</b>
					</a>

					<br> <br> <i class="xi-presentation"></i>&nbsp;
					<a href="project.main">
						<b>프로젝트</b>
					</a>
					<br> <br> <i class="xi-comment"></i>
					<a href="list.co">
						<b>커뮤니티</b>
					</a>

					<br>
					<a href="mylist.co" class="side_subtitle">내 게시글</a>
					<br> <br> <i class="xi-lightbulb-o"></i>&nbsp;
					<a href="notice.no">
						<b>공지사항</b>
					</a>
					<br> <br>
					<br><br><br><br><br><br><br>
					<a href="logout.me" style="font-size:18px;">로그아웃</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<div id="myproject-area">
				<span class="main_title_text">내 프로젝트</span>
				<br> <br>
					<c:forEach var="n" items="${ project }">
						<a href="project?projectNo=${n.projectNo }" class="atag"> 
							<div class="main_pj_div">
								<div class="ptitle" style="font-size: 13pt; ">${ n.projectTitle }</div><br>
								<div class="pmember" style="font-size: 13px; color:gray;">${ n.projectMemberStr }</div>
							</div>
						</a>

					</c:forEach>

			</div>

			<div id="commute-area">
				<!-- <span class="main_title_text">출퇴근</span> -->
				<button id="commute-on">출근</button>
				<button id="commute-off">퇴근</button>
			</div>
		
		<script>
			$(function() {
				$("#commute-on").click(function() {
					location.href = "on.cm";
					alert("출근 완료");
				})
				$("#commute-off").click(function() {
					location.href = "off.cm";
					alert("오늘 하루도 고생하셨습니다");
				})

			})
		</script>
		<div id="comming-sc-area">
			<span class="main_title_text">다가오는 일정</span>
			<hr>
				<c:forEach var="n" items="${ schedule }">
					<li>
						${n.startDate}&nbsp&nbsp${n.title}
					</li>
				</c:forEach>
		</div>
		<div id="notice-area">
			<span class="main_title_text">공지사항</span>
			<br> <br>
			<table id="noticeList">
				<thead style="text-align: center">
					<tr>
						<th style="width: 390px; height:40px;">제목</th>
						<th style="width: 100px;">작성일</th>
						<th style="width: 80px;"">작성자</th>
						<th style="width: 80px;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${ notice }">
						<tr>
							<td style="height:40px">&nbsp;&nbsp; ${ n.boardTitle }</td>
							<td style="text-align: center">${ n.enrollDate }</td>
							<td class="writer" style="text-align: center">${ n.memberName }</td>
							<td style="text-align: center">${ n.count }</td>
							<td class="mno">${ n.boardWriter }</td>
							<td class="bno">${ n.boardNo }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="todolist-area">
			<span class="main_title_text">TODOLIST</span>
			<br><br>
			<table id="todo_tb" style="margin-left:30px">
				<tbody>
				
				</tbody>
			</table>
			

		</div>
		</div>
	</div>
	<script>
 		window.onload = $(function() {
			$('.bno').hide();
			$('.mno').hide();
		})


		
		
		$(function() {
			$("#noticeList>tbody>tr").click(
				function() {
					location.href = 'detail.no?bno='
							+ $(this).children(".bno").text() + '&mno='
							+ $(this).children(".mno").text();
				})
		})
		
	//동적추가
 		window.onload = $(function() {
			$(function() {
				$.ajax({
	    			url : "test.main",
					success : function(data){
						let value="";
						for(let i in data){
							value += "<tr style='height:35px;'>"
									+ "<td class='boardNo'>" + data[i].boardNo + "</td>"
									+ "<td class=check'>" + "<input type='checkbox' name='checkList' class='check'>" + "</td>"
									+ "<td class='content'>" + data[i].content + "</td>"
									+ "</tr>";
									
						$("#todo_tb>tbody").html(value);
						$('.boardNo').hide();
						}
	    			}
				})
			})
		}) 


	//동적
		$(function() {
			$(document).on("click", "#todo_tb>tbody>tr", function() {
				var $boardNo = $(this).children(".boardNo").text();
				var $content = $(this).children(".content").text();
	            var $memberNo = ${loginUser.memberNo};
	            console.log($memberNo);
	            
	            
	            $(this).find(".check").attr("checked", true);
	            $(this).children(".content").css('text-decoration', 'line-through');
	            
		        alert($content + "을(를) 완료합니다.");
		            
	            setTimeout(function(){
		            $.ajax({
						
		            	url : "complete.to",
		    			data : {
		    						boardNo : $boardNo,
		    						content : $content,
		    						memberNo : $memberNo
		    					},
		    			success : function(data){
							let value="";
							
							for(let i in data){
								value += "<tr style='height:35px;'>"
										+ "<td class='boardNo'>" + data[i].boardNo + "</td>"
										+ "<td class=check'>" + "<input type='checkbox' name='checkList' class='check'>" + "</td>"
										+ "<td class='content'>" + data[i].content + "</td>"
										+ "</tr>";
										
							$("#todo_tb>tbody").html(value);
							$('.boardNo').hide();
							}
		    			}
		    		}) //ajax끝
	            },   3000); //set time 끝
			})
		})
 		

		

	</script>
</body>
</html>