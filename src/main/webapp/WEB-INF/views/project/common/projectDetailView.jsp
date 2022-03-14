<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}

.info-left {
	width: 700px;
}

.info-right {
	width: 380px;
	height: 400px;
	border: 1px solid #999;
}

h2.project-title {
	display: inline-block;
}

ul.project-desc-list {
	list-style: none;
	line-height: 50px;
	margin-top: 20px;
	font-size: 20px;
}

.project-desc-list b {
	width: 210px;
	display: inline-block;
	vertical-align: top;
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

.title-label {
	margin-left: 200px;
}

.project-desc-list span {
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
}

.title-filter {
	width: 130px;
	height: 35px;
	border-radius: 10px;
	margin-right: 10px;
}

button.btn-write {
    transition: 0.15s;
    float: right;
    font-size: 16px;
    padding: 7px 30px;
    border: 1px solid #AAA;
    border-radius: 10px;
	width: 130px;
	height: 40px;
}

button.btn-write:hover {
    cursor: pointer;
    background: #DDD;
}

.project-desc-list > li {
    margin: 5px 0;
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
				프로젝트<br>
				<div class="sub-menu">
					&nbsp;
					<a href="#" class="">전체</a>
					<br>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="project.no-read" class="">읽지않음</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">내 일정</a>
					<br>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<div class="project-info">
				<div class="info-left">
					<div class="project-title-area">
						<h2 class="project-title">ㅁㄴㅇㅁㄴㅇㅁㄴㅇ</h2>
						<span class="title-label"><i>진행중</i></span>
					</div>

					<ul class="project-desc-list">
						<li><b>프로젝트 기간</b> <span>asdasd</span></li>
						<li><b>프로젝트 개요</b>
							<div class="desc-wrapper">
								<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd</p>
							</div></li>
						<li><b>프로젝트 매니저(PM)</b> <span>asdasd</span></li>
						<li><b>프로젝트 인원</b> <span><i class="fi fi-rr-edit" data-toggle="modal" data-target="#myModal"></i></span></li>
					</ul>
				</div>
				<div class="info-right"></div>
			</div>

			<hr>

			<div class="project-notice">
				<div class="section-title-wrapper">
					<h3 class="section-title">공지사항</h3>
				</div>

				<table class="section-table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>상태</th>
							<th>업무</th>
							<th>담당자</th>
							<th>수정일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>
			</div>

			<hr>

			<div class="project-task">
				<div class="section-title-wrapper">
					<h3 class="section-title">업무</h3>
					<select class="title-filter">
						<option>내 업무</option>
						<option>요청한 업무</option>
					</select>
					<select class="title-filter">
						<option>요청</option>
						<option>1</option>
						<option>1</option>
						<option>1</option>
					</select>
					
					<button class="btn-write" type="button" onclick="window.location.href='project.taskWrite'">작성하기</button>
				</div>

				<table class="section-table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>상태</th>
							<th>업무</th>
							<th>담당자</th>
							<th>수정일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>내상태</td>
							<td>업무는이것</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">어이없어 ㅎ</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Modal body..</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>