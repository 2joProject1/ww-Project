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

#docu-format {
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

.docu-content-textarea {
	width: 1050px;
	height: 300px;
	vertical-align: top;
	resize: none;
}

#docuTitle {
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

.docu-format-base th {
	margin-right: 20px;
	text-align: left;
}

.docu-format-base td {
	margin-right: 20px;
	text-align: left;
}

.fi fi-rr-add document{
	width: 150px; 
	margin-left: 10px;
}

.fi-rr-add document:hover{
	cursor: pointer;
}

#fileList {
	width: 1050px;
	height: 150px;
	vertical-align: top;
	border: 1px solid #999;
	clear: both;
	display: inline-block;
}

#fileList>li {
	list-style: none;
}
</style>

</head>
<body>
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div id="container">
		<div id="sidebar-layout">
			<div id="main-sidebar">
				<br> <i class="fi fi-rr-menu-burger"></i>&nbsp;<b>전자결재</b>
				<div class="sub-menu">
					<i class="fi fi-rr-edit"></i>&nbsp;<a href="signoffs.docu">문서작성하기</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="docubox.draft">기안문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="">수신문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="">부서문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="">반려문서함</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<form id="enrollForm" class="enroll-form" action="docubox.insert" enctype="multipart/form-data" method="post">
				<div id="docu-header-area">
					<div id="docu-basic-area">
						<br>
						<h2>&nbsp;문서작성</h2>
						<hr>

						<table class="docu-format-base">
							<tr>
								<th>&nbsp;형식</th>
								<td><select id="docu-format" name="docuFormat" onchange="changeFormat(this)">
										<option value="1">기안문서</option>
										<option value="2">품의서</option>
								</select>&nbsp;&nbsp;</td>
								<th>&nbsp;문서보존기간</th>
								<td>&nbsp;5년</td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<th>&nbsp;수신부서</th>
								<td>&nbsp;재무기획팀</td>
							</tr>
							<tr>
								<th>&nbsp;기안일자</th>
								<td>&nbsp;2022-03-01</td>
								<th>&nbsp;소속</th>
								<td>&nbsp;개발팀</td>
							</tr>
						</table>
					</div>

					<br>
					<div id="docu-signoff-area">
						<table class="signoff-table-area" border="1">
							<tr>
								<th rowspan="3">결재</th>
								<th>대표이사</th>
								<th>팀장</th>
								<th>차장</th>
								<th>사원</th>
							</tr>
							<tr>
								<td>대표자</td>
								<td>서명</td>
								<td>서명</td>
								<td>서명</td>
							</tr>
							<tr>
								<td>결재일</td>
								<td>결재일</td>
								<td>결재일</td>
								<td>결재일</td>
							</tr>
						</table>
					</div>
				</div>
				<br> <br>
				<hr>
				<div id="docu-content">
					<br> <b>제목</b>&nbsp;&nbsp;<input type="text" name="docuTitle" value="" id="docuTitle"><br>
					<br> <b>내용</b>&nbsp;
					<textarea class="docu-content-textarea" name="docuContent" required></textarea>
					<br>
					<br>
					<b>첨부</b>&nbsp;
					<ul id="fileList" onclick="attachFile()"></ul>
				</div>
				<br>
				<div id="button-area">
					<button class="btn-custom" type="reset" style="margin-right: 30px;">취소</button>
					<button class="btn-custom" type="submit" id="draftDocu">기안</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		function attachFile() {
			if($('#fileList').children().length === 3) {
				alert("첨부파일은 3개까지 가능합니다.");
				return;
			}
			var createFile = document.createElement("input");
			createFile.type = "file";
			createFile.style.display = "none";

			createFile.onchange = function() {
				var html = '<li>' + this.files[0].name + '</li>'
				$('#fileList').append(html);
			};

			document.enrollForm.appendChild(createFile);
			createFile.click();
		}

		function changeFormat(target) {
			window.location.href = 'signoffs.docu?format=' + target.value;
		}
	</script>
</body>
</html>