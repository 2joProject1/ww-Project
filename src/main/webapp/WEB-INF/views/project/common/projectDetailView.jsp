<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세보기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>
<style>
#content-layout {
	border: 1px solid lightgray;
	height: 60%;
	padding: 10px;
	margin-left: 30px;
}

.info-left {
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

.task-report-wrap {
	width: 380px;
	height: 400px;
	border: 1px solid #ECECEC;
	float: right;
	border: 3px solid navy;
}

h2.project-title {
	display: inline-block;
}

.project-end-btn {
	background-color: gray;
	border: none;
	border-radius: 5px;
	color: white;
	width: 70px;
	height: 30px;
}

.project-title-area>.project-end-btn {
	float: right;
	margin-right: 20px;
	margin-top: 10px;
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

.project-info {
	width: calc(100% - 30px);
	display: inline-block;
	min-height: 300px;
	padding: 30px;
	border: 1px solid black;
	margin-left: 15px;
}

.project-title {
	background: linear-gradient(to top, rgb(185, 207, 199) 50%, transparent
		40%);
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

.project-desc-list>li {
	margin: 5px 0 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #DDD;
}

.add-team {
	border: 1px solid black;
	width: 180px;
	height: 150px;
	border: none;
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
</style>
</head>
<body>
	<div id="header-layout">
		<jsp:include page="../../common/header.jsp" />
	</div>
	<div id="container">
		<div id="sidebar-layout">
			<div id="main-sidebar">

				<div class="sub-menu-title">
				<br>
					<i class="fi fi-rr-menu-burger"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-apps"></i>&nbsp;
					<a href="project.main" class="">&nbsp;전체</a>
					<br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-apps"></i>&nbsp;
					<a href="notice.pro" class="">&nbsp;공지사항</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">&nbsp;내 일정</a>
					<br>
				</div>
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
				</c:forEach>
				<div class="task-report-wrap">
					<div class="task-report" width="400px" height="400px">
						<canvas id="taskChart"></canvas>
					</div>
				</div>
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
					<select id="taskFilter1" class="title-filter">
						<option value="0">전체</option>
						<option value="1">내 업무</option>
						<option value="2">요청한 업무</option>
					</select>
					<select id="taskFilter2" class="title-filter">
						<option value="0">전체</option>
						<option value="1">요청</option>
						<option value="2">진행</option>
						<option value="3">완료</option>
					</select>

					<button class="btn-write" type="button" onclick="onClickWrite()">작성하기</button>
				</div>

				<table id="taskTable" class="section-table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>상태</th>
							<th>업무</th>
							<th>담당자</th>
							<th>수정일자</th>
						</tr>
					</thead>
					<tbody id="taskListArea">
						<c:forEach var="p" items="${ taskList }">
							<tr data-board-no="${ p.boardNo }">
								<td>${p.boardNo }</td>
								<td>
									<c:if test="${p.taskStatus == 1}">
									요청
									</c:if>
									<c:if test="${p.taskStatus == 2}">
									진행
									</c:if>
									<c:if test="${p.taskStatus == 3}">
									완료
									</c:if>
								</td>
								<td>${p.boardTitle }</td>
								<td>${p.taskHandlerName }</td>
								<td>${p.taskModifyDate }</td>
							</tr>
						</c:forEach>
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
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							//필터별로 나누기(필터1: 내업무/요청한업무, 필터2: 요청, 진행, 완료)
							$('#taskFilter1, #taskFilter2')
									.on(
											'change',
											function() {
												var taskFilter1 = $(
														'#taskFilter1').val();
												var taskFilter2 = $(
														'#taskFilter2').val();
												$
														.ajax({
															url : 'project.taskList',
															method : 'GET',
															data : {
																taskFilter1 : taskFilter1,
																taskFilter2 : taskFilter2,
																projectNo : '${projectNo}'
															},
															beforeSend : function() { //ajax실행하기 전에 게시판 내용 비우기
																$(
																		'#taskListArea')
																		.empty();
															},
															success : function(
																	data) {
																console
																		.log(data);
																for (var i = 0; i < data.length; i++) {
																	var html = '<tr data-board-no="'+data[i].boardNo+'">';
																	html += '<td>'
																			+ data[i].boardNo
																			+ '</td>';
																	html += '	<td>';

																	if (data[i].taskStatus == 1)
																		html += '요청';
																	if (data[i].taskStatus == 2)
																		html += '진행';
																	if (data[i].taskStatus == 3)
																		html += '완료';
																	html += '	</td>';
																	html += '	<td>'
																			+ data[i].boardTitle
																			+ '</td>';
																	html += '	<td>'
																			+ data[i].boardWriter
																			+ '</td>';
																	html += '	<td>'
																			+ data[i].taskModifyDate
																			+ '</td>';
																	html += '</tr>';
																	$(
																			'#taskListArea')
																			.append(
																					html);
																}
															}
														})
											})
						})

		//프로젝트 상세보기에서 업무작성하기
		function onClickWrite() {
			window.location.href = 'project.taskWrite?projectNo='
					+ '${ projectNo }';
		}

		//프로젝트 상세보기에서 업무 상세로 이동
		$(function() {
			$('body').on(
					"click",
					'#taskTable tr',
					function() {
						location.href = 'project.taskDetail?boardNo='
								+ $(this).attr('data-board-no');
					})
		})

		//프로젝트 진행중, 완료 여부
		$('.project-end-btn').on("click", function() {
			var is = confirm("프로젝트를 완료하시겠습니까?");
			if (is) {
				$.ajax({
					url : "project.end",
					data : {
						projectNo : '${ projectNo }'
					},
					type : "post",
					success : function(data) {
						alert("프로젝트가 완료되었습니다");
						$('.project-end-btn').css('display', 'none');
						$('.title-label').html("`완료");
						return "project/common/projectDetailView";
					},
					error : function() {
						alert("다시 시도해주세요");
						return "common/errorPage";
					}
				})
			}
		})

		//차트
		$(function() {
			var ctx = document.getElementById('taskChart').getContext('2d');
			var pno = $
			{
				projectNo
			}
			;
			report();
			function report() {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/project/tstatereport",
							data : {
								pno : '${ projectNo }'
							},
							dataType : "json",
							success : function(data) {
								console.log("성공 들어옴");
								if (data != null || data != '') {
									createChart(data[0], data[1], data[2]);
									console.log(data + "데이터 null이 아닐때 값 ")
									return false;
								}
								console.log(data + "데이터데이터");
							},
							error : function() {
								console.log("update 실패");
							}
						});
			}
			;

			function createChart(s1, s2, s3) {
				if (s1 == null || s1 == '') {

					console.log("데이터 s1" + s1);
				}
				var myChart = new Chart(ctx, {
					type : 'doughnut',
					data : {
						labels : [ '요청', '진행', '완료', ],
						datasets : [ {
							label : 'Score',
							data : [ s1, s2, s3 ],
							backgroundColor : [ '#F27781', '#f17a19',
									'#50b766', ],
						} ]
					},
					options : {
						legend : {
							display : true,
							position : 'right',
						}
					}
				});
			}
			;
		});
	</script>

</body>
</html>