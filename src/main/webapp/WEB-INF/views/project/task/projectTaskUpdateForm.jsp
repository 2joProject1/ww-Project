<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

.project-desc-list>li {
	margin: 5px 0 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #DDD;
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

button.x-btn:hover {
    background: #CCC;
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
				<br>
				<br>
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
			<jsp:include page="../../project/common/projectInfo.jsp" />
			<hr>
			<div class="project-task">
				<div class="section-title-wrapper">
					<h3 class="section-title">업무 수정하기</h3>
				</div>
				<form action="insert.task" method="post" id="taskWriteForm">
					<input type="hidden" name="projectNo" value="${ projectNo }">
					<ul class="project-desc-list">
						<li><input type="text" name="taskTitle" class="project-write-field-title" placeholder="제목을 입력해주세요" required></li>
						<hr>
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
						<hr>
						<li><b>담당자</b>
						<input type="text" name="taskHandler" class="project-write-field">${ t.taskHandler }</li>
						<hr>
						<li><b>요청일자</b>
						<input type="date" name="enrollDate" class="project-write-date"></li>
						<hr>
						<li><b>마감기한</b>
						<input type="date" name="endDate" class="project-write-date"></li>
						<hr>
						<li><b>파일첨부</b>
						<ul id="fileList" onclick="attachFile()"></ul></li>
						<hr>
						<li><textarea class="project-write-field-content" placeholder="내용을 입력하세요" required></textarea></li>
						<hr>
					</ul>
					<div class="button-area">
						<button type="reset" class="btn-custom">취소</button>
						<button type="submit" class="btn-custom" id="project-enroll-btn">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	
	//파일첨부시 개별 삭제
	$(document).ready(function () {
		$('body').on('click', '.x-btn', function () {
			$(this).parent().remove();
			var fileIndex = $(this).attr('data-file-index');
			$('#file_' + fileIndex).remove();
		})
	});


	//클릭해서 파일 첨부하기
	function attachFile() {
		if($('#fileList').children().length === 3) {
			alert("첨부파일은 3개까지 가능합니다.");
			return;
		}
		
		//"파일"타입 생성하고 리스트에 추가
		var createFile = document.createElement("input");
		createFile.id = "file_" + index;
		createFile.name= 'attachment';
		createFile.type = "file";
		createFile.style.display = "none";
		
		//리스트에 추가 형식
		createFile.onchange = function() {
			var html = '<li>' + this.files[0].name + '<button type="button" class="x-btn" data-file-index="'+index+'">X</button></li>'
			$('#fileList').append(html);
		};

		document.getElementById('taskWriteForm').appendChild(createFile);
		createFile.click(); //첨부클릭할때마다
		index++; //data-file-index 값 하나씩 올리기
	}

		function attachFile() {
			var createFile = document.createElement("input");
			createFile.type = "file";
			createFile.style.display = "none";

			createFile.onchange = function() {
				var html = '<li>' + this.files[0].name + '</li>'
				$('#fileList').append(html);
			};

			document.body.appendChild(createFile);
			createFile.click();
		}

	</script>

</body>
</html>