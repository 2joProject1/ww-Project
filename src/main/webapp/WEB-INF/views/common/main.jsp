<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<a href="officerList">
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
			<table id="noticeList" border="1">
				<thead style="text-align: center">
					<tr>
						<th style="width: 350px; height:40px;">제목</th>
						<th style="width: 100px;">작성일</th>
						<th style="width: 100px;"">작성자</th>
						<th style="width: 100px;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${ notice }">
						<tr>
							<td style="height:40px">&nbsp&nbsp ${ n.boardTitle }</td>
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
			<br>
			<table id="todo_tb">
				<tbody>
<%-- 					<c:forEach var="n" items="${ todo }">
						<tr style="height:35px;">
							<td class="boardNo">${n.boardNo}</td>
							<td class="check">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkList" class="check"></td>
							<td class="content">${n.content}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
			
			
<%-- 			<ul>
				<c:forEach var="n" items="${ todo }">
					<li>
						<input type="checkbox" name="checkList" value="${n.content}">
						<label for="checkList">${n.content}</label>
					</li>
				</c:forEach>

			</ul> --%>
		</div>
		</div>
	</div>
	<script>
		window.onload = $(function() {
			$('.bno').hide();
			$('.mno').hide();
			$('.boardNo').hide();

		})
		
		


	</script>
</body>
</html>