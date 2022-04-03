<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>

<div class="project-info">
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
		</div>

		<ul class="project-desc-list">
			<li><b>프로젝트 기간</b>${ p.projectStartDate } - ${ p.projectEndDate }</li>
			<li><b>프로젝트 개요</b>
				<div class="desc-wrapper">
					<p>${ p.projectSummary }</p>
				</div></li>
			<li><b>프로젝트 매니저(PM)</b> <span>${ p.projectWriterName }</span></li>
			<li><b>프로젝트 인원</b> <span class="add-team">${p.projectMemberStr}</span></li>
		</ul>
	</div>
	<div class="task-report-wrap">
		<div class="task-report" width="400px" height="400px">
			<canvas id="taskChart" style="width: 378px; height: 400px;"></canvas>
		</div>
	</div>
</div>

<script>
//차트
var ctx = document.getElementById('taskChart').getContext('2d');
var pno = '${p.projectNo}';
report();

function report() {
	$.ajax({
		url : "${pageContext.request.contextPath}/project/tstatereport",
		data : {
			projectNo : '${ p.projectNo }'
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
				backgroundColor : [ '#56B37F', '#8AB78A', '#288C28', ],
			} ]
		},
		options : {
			responsive: false,
			legend : {
				display : true,
				position : 'right',
			}
		}
	});
}
</script>