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
	border: 1px solid #ECECEC;
}

h2.project-title {
	display: inline-block;
}

.project-end-btn{
	background-color: gray;
	border: none;
	border-radius: 5px;
	color: white;
	width: 70px;
	height: 30px;
}

.project-title-area>.project-end-btn{
	float: right;
	margin-right: 20px;
	margin-top: 10px;
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

.project-info {
	width: calc(100% - 30px);
	display: inline-block;
	min-height: 300px;
	padding: 30px;
	border: 1px solid black;
	margin-left: 15px;
}

.project-title{
	background: linear-gradient(to top, rgb(185,207,199) 50%, transparent 40%);
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

.add-team{
	border: 1px solid black;
	width: 180px;
	height: 150px;
	border: none;
}

/* 프로젝트 사이드바 */

.new-project{
	background-color: rgb(102, 164, 166);
	border: none;
	border-radius: 50px;
	width: 180px;
	height: 80px;
	margin-left: 25px;
	color: white;
	box-shadow: 1px 1px 1px 1px lightgray;
}

.sub-menu-title{
	margin-left: 40px;
	line-height: 40px;
}
.sub-menu{
	margin-left: 60px;
	line-height: 40px;
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
				<button type="button" class="new-project">새 프로젝트</button><br><br>
				<div class="sub-menu-title">
					<i class="fi fi-rr-menu-burger"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-apps"></i>&nbsp;<a href="#" class="">&nbsp;전체</a>
					<br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-check"></i>&nbsp;<a href="project.no-read" class="">&nbsp;읽지않음</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="calendar.pj" class="">&nbsp;내 일정</a>
					<br>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<div class="project-info">
				<div class="info-left">
					<div class="project-title-area">
						<h2 class="project-title">2022 공공 에너지 정보 개발</h2>&nbsp;&nbsp;&nbsp;
						<span class="title-label"><i>진행중</i></span>
						<button type="button" class="project-end-btn">완료</button>
					</div>

					<ul class="project-desc-list">
						<li><b>프로젝트 기간</b> <span></span></li>
						<li><b>프로젝트 개요</b>
							<div class="desc-wrapper">
								<p>여기는 공공에너지 정보에 대해서 각 에너지별로 소비량을 알려주는 프로그램을 만들까말까만들까말까 개발할까 말까 머 그런 어쩌구저쩌구</p>
							</div></li>
						<li><b>프로젝트 매니저(PM)</b> <span>김팀장</span></li>
						<li><b>프로젝트 인원</b> <span class="add-team" data-toggle="modal" data-target="#myModal"></span></li>
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
						<option>진행</option>
						<option>완료</option>
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
					<h4 class="modal-title">사원검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<input type="search" name="">
					<
					
				
				
				
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>