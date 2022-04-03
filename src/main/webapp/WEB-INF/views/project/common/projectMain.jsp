<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 메인</title>

<style>

.project-title {
	padding: 15px;
	font-weight: 400;
	font-size: 24pt;
	margin-left: 10px;
	margin-bottom : 20px;
	
}

.project-list {
	width: 200px;
	height: 200px;
	display: inline-block;
	background-color: rgb(185, 207, 199);
	border-radius: 50px;
	margin-left: 20px;
	margin-bottom: 5px;
	text-align: center;
	text-decoration: none;
}

.project-list:hover {
	cursor: pointer;
	opacity: 0.7;
	border: 1px solid gray;
	text-decoration: none;
	
}
.project-list a:hover{
	text-decoration: none;
}

.project-list a {
	width: 100%;
	height: 100%;
	text-decoration: none;
	display: inline-block;
	float: left;
}

#projectTT {
	margin-top: 35px;
	margin-left: 5px;
	font-size: 18pt;
	color: black;
	text-decoration: none;
}

#projectMM {
	font-size: 15pt;
	color: gray;
	text-decoration: none;
}

/* 프로젝트 사이드바 */
.new-project {
	background-color: rgb(102, 164, 166);
	border: none;
	border-radius: 50px;
	width: 180px;
	height: 80px;
	margin-left: 25px;
	color: white;
	box-shadow: 1px 1px 1px 1px lightgray;
}

.sub-menu-title {
	margin-left: 40px;
	line-height: 40px;
}

.sub-menu {
	margin-left: 60px;
	line-height: 40px;
}

/* 프로젝트 생성*/
.modal-body {
	border: 1px solid gray;
	margin: 20px;
}

.newProject-table {
	width: 500px;
}

.newProject-table th {
	width: 250px;
	line-height: 50px;
	font-size: 15pt;
	margin-left: 10px;
}

.newProject-table td {
	width: 480px;
	line-height: 50px;
	font-size: 15pt;
	margin-left: 10px;
}

.newProject-date {
	border: none;
}

.newProject-content {
	width: 700px;
	height: 300px;
	border: 1px solid lightgray;
	resize: none;
	margin-left: 13px;
}

.newProject-count {
	margin: auto;
	margin-left: 43px;
}

div#addMemberArea {
	border: 1px solid lightgray;
	width: 700px;
	margin-left: 14px;
	border-radius: 10px;
	overflow: auto;
	list-style: none;
}

.newProject-member {
	width: 700px;
	height: 130px;
	padding: 10px;
	margin-left: 43px;
}

.newProject-member {
	width: 620px;
	height: 130px;
	padding: 10px;
	margin-left: 43px;
}

.newProject-input {
	width: 524px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

*:focus {
	outline: none;
}

.btn-new, .btn-reset {
	width: 80px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.btn-new {
	background-color: rgb(102, 164, 166);
	margin-left: 20px;
}

.btn-area {
	margin-left: 38%;
}

#projectMemberBtn{
 	border: none;
 	background-color: white;
}

/* 사원검색 */
input[type="search"] {
	width: 409px;
	height: 58px;
	border-radius: 15px;
	margin-top: -18px;
	margin-bottom: 33px;
	margin-left: 10px;
}

.search-member {
	width: 409px;
	height: 70px;
	text-align: center;
	margin-left: 10px;
	font-size: 13pt;
	line-height: 50px;
	border-radius: 10px;
}

#searchMemberResult {
	width: 409px;
	height: 100px;
	border: 1px solid lightgray;
	margin-left: 10px;
	overflow: auto;
	list-style: none;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr:hover
	{
	cursor: pointer;
	padding: 10px;
	background-color: #edf1f1;
	border-radius: 10px;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr>td {
	margin-left: 5px;
}

.btn-searchMember {
	width: 112px;
	height: 37px;
	background-color: rgb(102, 164, 166);
	color: white;
	border: 1px lightgray;
	border-radius: 10px;
	margin-left: 37%;
	margin-bottom: 16px;
}
</style>
</head>
<body>

	<div id="header-layout">
		<jsp:include page="../../common/header.jsp" />

	</div>
	<div id="container">
		<div id="sidebar-layout">
			<div id="main-sidebar">
				<!-- 부장급으로 들어가면 "새 프로젝트" 버튼 보이기  -->
				<c:if test="${ loginUser.rankNo ge  5 }">
					<button type="button" class="new-project" data-toggle="modal" data-target="#newProject">새 프로젝트</button>
					<br>
					<br>
				</c:if>

				<div class="sub-menu-title">
					<i class="xi-presentation"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="#">&nbsp;전체</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="noticeList.pro">&nbsp;공지사항</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="calendar.pj" class="">&nbsp;내 일정</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<span class="project-title">내 프로젝트</span>
			<br><br>
			<input type="hidden" name="projectMemberNo" value="${ loginUser.memberNo }">
			<c:forEach var="p" items="${ list }">
				<div class="project-list">
					<a href="project?projectNo=${p.projectNo }">
						<div id="projectTT">${ p.projectTitle }</div><br><br>
						<div id="projectMM">${ p.projectMemberStr }</div>
					</a>
				</div>
			</c:forEach>
			<hr>
			<h2 class="project-title">완료된 프로젝트</h2>
			<c:forEach var="p" items="${ flist }">
				<div class="project-list">
					<a href="project?projectNo=${p.projectNo }">
						<div id="projectTT">${ p.projectTitle }</div><br><br>
						<div id="projectMM">${ p.projectMemberStr }</div>
					</a>
				</div>
			</c:forEach>
			
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="newProject">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<b>프로젝트 생성하기</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="insertProjectForm" action="insert.pro" method="post">
						<table class="newProject-table">
							<tr>
								<th>프로젝트명</th>
								<td>
									<input type="text" name="projectTitle" class="newProject-input" required>
								</td>
							</tr>
							<tr>
								<th>프로젝트 시작일자</th>
								<td>
									<input type="date" name="projectStartDate" class="newProject-date" required>
								</td>
							</tr>
							<tr>
								<th>프로젝트 마감일자</th>
								<td>
									<input type="date" name="projectEndDate" class="newProject-date" required>
								</td>
							</tr>
							<tr>
								<th>프로젝트 매니저</th>
								<td>
									<input type="hidden" name="projectWriter" value="${loginUser.memberNo }">
									<input type="text" name="projectWriterName" class="newProject-input" value="${ loginUser.memberName }" readonly style="border: none;">
								</td>
							</tr>
							<tr>
								<th colspan="2">프로젝트 인원</th>
							</tr>
							<tr>
								<th colspan="2">&nbsp;&nbsp;<span>
										총
										<span id="projectMemberCount"></span>
										명
									</span>
									<button type="button" id="projectMemberBtn"><i class="xi-user-plus-o"></i></button>
							</tr>
							<tr>
								<th colspan="2"><div class="newProject-member" name="projectMember" id="addMemberArea"></div></th>
							</tr>
							<tr>
								<th colspan="2">프로젝트 개요</th>
							</tr>
							<tr>
								<th colspan="2"><textarea class="newProject-content" name="projectSummary" required> </textarea></th>
							</tr>
						</table>
						<div class="btn-area">
							<button type="reset" class="btn-reset">취소</button>
							<button type="submit" class="btn-new" id="inputProject">생성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<script>
		var projectAddedMembers = [];
		searchedMembers = []; //검색 전 빈 배열
		searchMember('', '', onMemberDataUpdated); //이름, 부서,

		$(document).ready(
				function() {
					$('#projectMemberBtn').on("click", function() {
						$('#searchMember').modal('show');
					})

					$('#searchMember').on('click', '[data-member]',
							onClickSearchedMember)

					$('#closeBtn').on('click', function() {
						$(this).parents('.modal').modal('hide');
					})
				});

		function addMemberModal() {
			var html = $('#searchMemberResult').html();
			$('#addMemberArea').html(html);
			$('#searchMemberResult').empty();
			$('#searchMember').modal('hide');

			for (var i = 0; i < projectAddedMembers.length; i++) {
				var html = '<input type="hidden" name="projectMemberNo" value="' + projectAddedMembers[i] + '" >';
				$('#insertProjectForm').append(html);
			}
			$('#projectMemberCount').text(projectAddedMembers.length);
		}

		function onClickSearchedMember() {
			var memberNo = $(this).attr('data-member');
			var memberName = $(this).children().eq(1).text().trim();
			var teamName = $(this).children().eq(2).text().trim();
			if (projectAddedMembers.indexOf(memberNo) > -1) {
				alert("중복된 사용자를 선택할 수 없습니다.");
				return;
			}
			$('#searchMemberResult').append(
					'<li>' + teamName + ' ' + memberName + '</li>');
			projectAddedMembers.push(memberNo);
		}

		//사원 검색 - 
		function searchMember(name, dept, callback) {
			$.ajax({
				url : "search.member?name=" + name + "&dept=" + dept,
				success : function(res) {
					searchedMembers = res.members;
					callback(res.members);
				},
				error : function() {
					$('#searchMemberResult').html("조회 결과가 없습니다");
				}
			})
		}

		//검색에서 끝났을때
		function onSearchKeyUp() {
			var searchString = document.getElementById('ipSearchMemberText').value; //검색값
			searchMember(searchString, searchString, onMemberDataUpdated); //이름, 부서, 결과값
		}

		//검색결과
		function onMemberDataUpdated(members) {
			var memberTable = document.getElementById('tbMembers');
			memberTable.innerHTML = ''; //memberTable 비우고
			//반복문으로 결과값 출력
			for (var i = 0; i < members.length; i++) {
				memberTable.innerHTML += '<tr data-member="' + members[i].memberNo + '">'
						+ '<td><i class="xi-profile xi-3x"></i></td>'
						+ '<td>'
						+ members[i].memberName
						+ '</td>'
						+ '<td style="margin:10px">'
						+ members[i].deptName
						+ '/' + members[i].rankName + '</td>' + '</tr>'
			}
		}
	</script>

	<div class="modal" id="searchMember">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사원검색</h4>
					<button id="closeBtn" type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<i class="fi fi-rr-search"></i>&nbsp;
					<input id="ipSearchMemberText" type="search" placeholder="    사원 또는 부서를 입력해주세요" onkeyup="onSearchKeyUp()">
					<br>
					<div class="search-area">
						<table id="tbMembers" class="search-member">

						</table>
					</div>
					<ul id="searchMemberResult"></ul>
				</div>
				<button type="button" class="btn-searchMember" onclick="addMemberModal()">추가</button>
			</div>
		</div>
	</div>

</body>
</html>