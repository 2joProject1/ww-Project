<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 공지사항</title>

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

*:focus{
	outline: none;
}


/*공지사항버튼*/
#noticeProBtn{
	background-color: rgb(102, 164, 166);
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
						<br>
						<h2>&nbsp;프로젝트 공지사항</h2>
						<hr>
				<div id="docu-content">
				<input type="hidden" name="projectNo" value="${ item.projectNo }">
					<br> <b>제목</b>&nbsp;&nbsp;
					<c:if test="${isAdmin}">
						<input type="text" name="boardTitle" id="docuTitle1" value="${ item.boardTitle }" >
					</c:if>
					<c:if test="${!isAdmin}">
						<b>${ item.boardTitle }</b>
					</c:if>
					
					<br>
					<br> <b>내용</b>&nbsp;
					<c:if test="${isAdmin}">
						<textarea class="docu-content-textarea1" name="boardContent" id="ttBoardContent" required >${ item.boardContent }</textarea>
					</c:if>
					<c:if test="${!isAdmin}">
						<p>${ item.boardContent }</p>
					</c:if>
					
					<br>
				</div>
				<br>
				<div id="button-area">
					<button class="btn-custom" type="reset" style="margin-right: 30px;" onclick="history.back()">뒤로가기</button>
					
					<c:if test="${isAdmin}">
						<button class="btn-custom" type="reset" style="margin-right: 30px;" onclick="onClickDelete()">삭제</button>
						<button type="submit" class="btn-custom" type="button" id="noticeProBtn" onclick="onClickModify()">수정</button>
					</c:if>
				</div>
		
		</div>
	</div>
</body>
<script>
function onClickModify(){
	sendAjax('UPDATE');
}
function onClickDelete(){
	sendAjax('DELETE');
}

function sendAjax(type){
	var payload = {
			type:  type  ,
			boardNo:'${item.boardNo}' ,
			title: '' ,
			content: ''
	}
	
	payload.title = document.getElementById('docuTitle1').value;
	payload.content = document.getElementById('ttBoardContent').value;
	console.log(payload)
	
	$.ajax({
		url: 'noticeUD.pro',
		method: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		data: JSON.stringify(payload),
		success: goBack,
		error: showError,
	});
}

function showError(){
	alert('공지사항 변경에 실패했습니다.')
}

function goBack(){
	history.back()
}

</script>
</html>