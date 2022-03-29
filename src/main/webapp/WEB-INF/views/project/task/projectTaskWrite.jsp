<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.project-write-field {
	width: 300px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.project-write-field-title {
	width: 520px;
	height: 40px;
	border: none;
}

.project-write-field:focus {
	outline: none;
}

.project-write-date {
	width: 300px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.project-write-date:focus {
	outline: none;
}

.project-write-field-content {
	width: 100%;
	height: 100px;
	resize: none;
	border: none;
}

.project-write-field-content:focus {
	outline: none;
}

/* filter css*/
.task-search-area {
	height: 40px;
}

.task-search-area>label {
	margin-right: 5px;
	font-size: 13pt;
}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #23a3a7;
	color: #fff;
}

/*파일첨부*/
#fileList {
	width: 300px;
	height: 100px;
	vertical-align: top;
	border: 1px solid lightgray;
	border-radius: 10px;
	clear: both;
	display: inline-block;
	list-style: none;
	overflow: auto;
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

/* 파일첨부 x버튼 css */
button.x-btn {
	line-height: 20px;
	vertical-align: middle;
	margin-left: 10px;
	background: #EEEE;
	transition: 0.05s;
}

/*담당자선택*/
#projectMemberList{
    display: inline-block;
    border: 1px solid #DDD;
    border-top: 0;
    width: 300px;
    border-radius: 10px;
    padding: 10px;
    cursor: pointer;
    transition: 0.3s;
}

#projectMemberList > li:hover {
    background: #EEE;
}

#projectMemberList > li {
    transition: 0.015s;
}

button.x-btn:hover {
	background: #CCC;
}

#content-layout {
	border: 1px solid lightgray;
	height: 60%;
	padding: 10px;
	margin-left: 30px;
}

.info-left, .info-right {
	float: left;
	display: inline-block;
}

.project-info {
	width: calc(100% - 30px);
	display: inline-block;
	min-height: 300px;
	padding: 30px;
	border: 1px solid black;
	margin-left: 15px;
}

.info-left {
	width: 700px;
}

.info-right {
	width: calc(100% - 700px);
	height: 400px;
	border: 1px solid #999;
}

h2.project-title {
	display: inline-block;
}

.project-title {
	background: linear-gradient(to top, rgb(185, 207, 199) 50%, transparent
		40%);
}


.section-title-wrapper {
	margin-bottom: 20px;
}

.project-notice, .project-task {
	padding: 30px;
}

h3.section-title {
	display: inline-block;
	font-weight: 600;
	margin-right: 20px;
}

table.section-table {
	width: 100%;
}

.section-table th, .section-table td {
	border-bottom: 1px solid #CCC;
	line-height: 40px;
	text-align: center;
}

.section-table th {
	background: #EEE;
	border-top: 1px solid #999;
}

.section-table tr:last-child td {
	border-bottom: 1px solid #999;
}

.section-table tr {
	cursor: pointer;
	transition: 0.05s;
}

.section-table tr:hover {
	background: #EEE;
}

ul.project-desc-list {
	list-style: none;
	line-height: 30px;
	margin-top: 20px;
	font-size: 20px;
	padding: 0;
}

.project-desc-list b {
	display: inline-block;
	vertical-align: top;
	width: 210px;
}
.project-desc-list span.desc-text {
	text-overflow: ellipsis;
	display: inline-block;
	white-space: normal;
	overflow: hidden;
	width: 400px;
	vertical-align: top;
}

.project-desc-list p {
	text-overflow: ellipsis;
	display: -webkit-box;
	white-space: normal;
	word-break: break-all;
	height: 150px;
	overflow: hidden;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	text-overflow: ellipsis;
}

.project-desc-list>li {
	margin: 5px 0 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #DDD;
}

.desc-wrapper {
	display: inline-block;
	width: 400px;
	vertical-align: top;
}

.title-filter {
	width: 130px;
	height: 35px;
	border-radius: 10px;
	margin-right: 10px;
}

.task-search-area {
	display: inline-block;
}

.button-area {
	margin: 30px 0;
	text-align: center;
}

.btn-custom {
	width: 130px;
	height: 40px;
	border-radius: 10px;
	border: none;
}

.project-title-area>.project-end-btn {
	float: right;
	margin-right: 20px;
	margin-top: 10px;
}

#project-enroll-btn {
	background-color: rgb(102, 164, 166);
	margin-left: 20px;
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
				<button type="button" class="new-project">새 프로젝트</button>
				<br> <br>
				<div class="sub-menu-title">
					<i class="fi fi-rr-menu-burger"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-apps"></i>&nbsp;
					<a href="#" class="">&nbsp;전체</a>
					<br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-check"></i>&nbsp;
					<a href="project.no-read" class="">&nbsp;읽지않음</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">&nbsp;내 일정</a>
					<br>
				</div>
				<a href="project.taskDetail">임시 디테일</a>

			</div>
		</div>

		<div id="content-layout">
			<div class="project-info">
				<c:forEach var="p" items="${ list }">
				<div class="info-left">
					<div class="project-title-area">
						<h2 class="project-title">${ p.projectTitle }</h2>
						&nbsp;&nbsp;&nbsp;
						<span class="title-label">
							<c:if test="${p.projectStatus == 0}">
								<i>완료</i>
							</c:if>
							<c:if test="${p.projectStatus == 1}">
								<i>진행중</i>
							</c:if>
						</span>
						<c:if test="${p.projectStatus == 1}">
							<button type="button" class="project-end-btn">완료</button>
						</c:if>
					</div>

					<ul class="project-desc-list">
						<li><b>프로젝트 기간</b>${ p.projectStartDate } - ${ p.projectEndDate }</li>
						<li><b>프로젝트 개요</b>
							<div class="desc-wrapper">
								<p>${ p.projectSummary }</p>
							</div></li>
						<li><b>프로젝트 매니저(PM)</b> <span>${ p.projectWriter }</span></li>
						<li><b>프로젝트 인원</b> <span class="add-team">${p.projectMemberStr}</span></li>
					</ul>
				</div>
				<div class="info-right"></div>
				</c:forEach>
			</div>
			<hr>
			<div class="project-task">
				<div class="section-title-wrapper">
					<h3 class="section-title">업무작성하기</h3>
				</div>
				<form action="insert.task" enctype="multipart/form-data" method="post" id="taskWriteForm">
					<input type="hidden" name="projectNo" value="${projectNo}">
					<ul class="project-desc-list">
						<li><input type="text" name="boardTitle" class="project-write-field-title" placeholder="제목을 입력해주세요" required></li>
						
						<li><b>진행상태</b>
							<div class="task-search-area">
								<label class="box-radio-input">
									<input type="radio" name="taskStatus" value="1" checked>
									<span>요청</span>
								</label>
								<label class="box-radio-input">
									<input type="radio" name="taskStatus" value="2" onclick="return(false);">
									<span>진행</span>
								</label>
								<label class="box-radio-input">
									<input type="radio" name="taskStatus" value="3" onclick="return(false);">
									<span>완료</span>
								</label>
							</div></li>
						<li>
							<div>
								<b>담당자</b> <input type="text" name="taskHandlername" 
									class="project-write-field" id="projectTaskHandler" 
									readonly >
							</div>
							<div>
								<input type="hidden" name="taskHandler" id="taskHandler">
								<b></b>
								<div id="projectMemberList" style="display: none;"></div>
							</div>
						</li>
						
						<li><b>마감기한</b> <input type="date" name="taskEndDate" class="project-write-date"></li>
						
						<li><b onclick="attachFile()">파일첨부</b>
							<ul id="fileList"></ul>
						</li>
						
						<li><textarea name="boardContent" class="project-write-field-content" placeholder="내용을 입력하세요" required></textarea></li>
						
					</ul>
					<div class="button-area">
						<button type="reset" class="btn-custom">취소</button>
						<button type="submit" class="btn-custom" id="project-enroll-btn">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		var index = 0;
		
		//파일첨부시 개별 삭제
		$(document).ready(function() {
			$('body').on('click', '.x-btn', function() {
				$(this).parent().remove();
				var fileIndex = $(this).attr('data-file-index');
				$('#file_' + fileIndex).remove();
			})
			$('body').on('click', '#projectMemberList > li', function() {
				$('#projectTaskHandler').val($(this).text().trim());
				$('#projectMemberList').hide();
				$('#taskHandler').val($(this).attr('data-member-no'));
			})
    	});
	
		//클릭해서 파일 첨부하기
		function attachFile() {
			if ($('#fileList').children().length === 3) {
				alert("첨부파일은 3개까지 가능합니다.");
				return;
			}

			//"파일"타입 생성하고 리스트에 추가
			var createFile = document.createElement("input");
			createFile.id = "file_" + index;
			createFile.name = 'attachment';
			createFile.type = "file";
			createFile.style.display = "none";

			//리스트에 추가 형식
			createFile.onchange = function() {
				var html = '<li>'
						+ this.files[0].name
						+ '<button type="button" class="x-btn" data-file-index="'+index+'">X</button></li>';
				$('#fileList').append(html);
			};

			document.getElementById('taskWriteForm').appendChild(createFile);
			createFile.click(); //첨부클릭할때마다
			index++; //data-file-index 값 하나씩 올리기
		}
		
		
		//업무 작성하기 : 담당자 지정
		$("#projectTaskHandler").on("click", function(){
			$('#projectMemberList').show();
			$('#projectMemberList').empty();
			$.ajax({
				url:"handler.task",
				data: { projectNo : '${projectNo}'},
				success: function(data){
					console.log(data);
					for(var i =0; i< data.length; i++){
						var html = '<li data-member-no="'+data[i].memberNo+'">' + data[i].memberName + '</li>';
						$('#projectMemberList').append(html);
					}
				}
			})
	    })
	</script>

</body>
</html>