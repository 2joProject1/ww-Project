<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#content-layout {
	border: 1px solid lightgray;
	padding: 30px;
	margin-left: 30px;
}

#docu-header-area {
	width: 100%;
	height: 100%;
	display: inline-block;
}

#docu-basic-area {
	width: 600px;
	height: 100%;
	font-size: 16pt;
	float: left;
}

#docu-signoff-area {
	width: 500px;
	height: 100%;
	font-size: 16pt;
	float: right;
	padding-left: 25px;
}

#docuFormat {
	width: 160px;
}

.signoff-table-area {
	border: 1px solid black;
	width: 450px;
	height: 130px;
	font-size: 14pt;
	text-align: center;
}

#docu-content {
	font-size: 16pt;
}

.docu-content-textarea1 {
	width: 1050px;
	height: 300px;
	vertical-align: top;
	resize: none;
}

#docuTitle1 {
	width: 1050px;
}

#button-area {
	text-align: center;
}

#draftDocu {
	background-color: rgb(102, 164, 166);
}

.btn-custom {
	width: 130px;
	height: 40px;
	border-radius: 15px;
	border: none;
}

.sub-menu {
	margin-left: 25px;
	line-height: 40px;
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

*:focus {
	outline: none;
}

/*공지사항버튼*/
#noticeProBtn {
	background-color: rgb(102, 164, 166);
}

table#noticeProjectTable {
    text-align: center;
}

table#noticeProjectTable tbody tr:hover {
	cursor: pointer;
	background: #EEE;
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
					<i class="xi-presentation"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="project.main" class="">&nbsp;전체</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="noticeList.pro" class="">&nbsp;공지사항</a>
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
			<h2>프로젝트 공지사항</h2>
			<hr>
			<table class="table" id="noticeProjectTable" text-align="center;">
				<thead>
					<tr>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="pn" items="${ list }">
					<tr data-notice-no="${ pn.boardNo }">
						<td>${ pn.boardTitle }</td>
						<td>${ pn.memberName }</td>
						<td>${ pn.enrollDate }</td>
						<td>${ pn.count }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="pagination-area">
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
								<!-- 1번페이지일 경우 비활성화되어있어야함 -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="noticeList.pro?cpage=${ pi.currentPage - 1 }"><</a></li>
							</c:otherwise>
						</c:choose>
	
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="noticeList.pro?cpage=${ p }">${ p }</a></li>
							<!-- requestParam으로 받는 cpage 로 쿼리스트링 키를 넘겨줘야함 (currentPage 가 아님) -->
						</c:forEach>
	
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">></a></li>
								<!-- 마지막페이지일경우  -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="noticeList.pro?cpage=${ pi.currentPage + 1 }">></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

<script>
//프로젝트 상세보기에서 공지로 이동하기
$(function() {
	$('body').on("click", '#noticeProjectTable tbody tr', function() {
		location.href = 'project.noticeDetail?boardNo=' + $(this).attr('data-notice-no');
	})
})
</script>
</body>
</html>