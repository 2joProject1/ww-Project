<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문서 작성하기</title>

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
					<a href="notice.pro" class="">&nbsp;공지사항</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">&nbsp;내 일정</a>
				</div>
			</div>
		</div>
		<div id="content-layout">
			<form id="enrollFormNoticePro" class="enroll-form" action="notice.pro" method="post">
						<br>
						<h2>&nbsp;프로젝트 공지사항</h2>
						<hr>
				<div id="docu-content">
					<br> <b>제목</b>&nbsp;&nbsp;<input type="text" name="boardTitle" id="docuTitle1"><br>
					<br> <b>내용</b>&nbsp;
					<textarea class="docu-content-textarea1" name="boardContent" required></textarea>
					<br>
				</div>
				<br>
				<div id="button-area">
					<button class="btn-custom" type="reset" style="margin-right: 30px;">취소</button>
					<button type="submit" class="btn-custom" type="button" id="noticeProBtn">등록</button>
				</div>
			</form>
		</div>

</body>
</html>