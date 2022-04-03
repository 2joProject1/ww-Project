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
	overflow: auto;
}

#fileList>li {
	list-style: none;
}

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


/* 사원검색 */
input[type="search"] {
	width: 409px;
	height: 58px;
	border-radius: 15px;
	margin-top: -18px;
	margin-bottom: 33px;
	margin-left: 10px;
}

.search-member {
	width: 409px;
	height: 70px;
	text-align: center;
	margin-left: 10px;
	font-size: 13pt;
	line-height: 50px;
	border-radius: 10px;
}

#searchMemberResult, #searchDeptResult {
	width: 409px;
	height: 100px;
	border: 1px solid lightgray;
	margin-left: 10px;
	overflow: auto;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr:hover,
#searchDept>div>div>div.modal-body>div.search-area>table>tbody>tr:hover
	{
	cursor: pointer;
	padding: 10px;
	background-color: #edf1f1;
	border-radius: 10px;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr>td,
#searchDept>div>div>div.modal-body>div.search-area>table>tbody>tr>td {
	margin-left: 5px;
}

.btn-searchMember {
	width: 112px;
	height: 37px;
	background-color: rgb(102, 164, 164);
	color: white;
	border: 1px lightgray;
	border-radius: 10px;
	margin-left: 37%;
	margin-bottom: 16px;
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
				<br> <i class="xi-document"></i>&nbsp;<b>전자결재</b>
				<div class="sub-menu">
					<i class="fi fi-rr-edit"></i>&nbsp;
					<a href="signoffs.docu?format=1">문서작성하기</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="docubox.draft">기안문서함</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="docubox.receive">수신문서함</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="docubox.dept">부서문서함</a>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="docubox.reject">반려문서함</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<form id="enrollForm" class="enroll-form" action="docubox.insert" enctype="multipart/form-data" method="post">
				<input type="hidden" name="signoffs" data-signoffs-index="1">
				<input type="hidden" name="signoffs" data-signoffs-index="2">
				<input type="hidden" name="signoffsDeptNo" id="signoffsDeptNo" value="0" >
				<input type="hidden" id="loginMemberNo" value="${loginUser.memberNo}">
			
				<div id="docu-header-area">
					<div id="docu-basic-area">
						<br>
						<h2>&nbsp;문서작성</h2>
						<hr>

						<table class="docu-format-base">
							<tr>
								<th>&nbsp;형식</th>
								<td><select id="docuFormat" name="docuFormat" onchange="changeFormat(this)">
										<option value="1" <c:if test="${format == '1'}">selected</c:if> >기안문서</option>
										<option value="2" <c:if test="${format == '2'}">selected</c:if> >품의서</option>
								</select>&nbsp;&nbsp;</td>
								<th style="float: right;">&nbsp;문서보존기간</th>
								<td>&nbsp;5년</td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<th>&nbsp;수신부서</th>
								<td id="signoffsDept" 
									style="cursor: pointer; border: 1px solid lightgray; 
										text-align: center" onclick="selectDeptModal()">
									선택
								</td>
							</tr>
							<tr>
								<th>&nbsp;<c:if test="${format == '1'}">기안일자</c:if><c:if test="${format == '2'}">품의일자</c:if></th>
								<td width="240px;">&nbsp;${now}</td>
								<th>&nbsp;소속</th>
								<td>&nbsp;${writerDept.deptName}</td>
							</tr>
						</table>
					</div>

					<br>
					<div id="docu-signoff-area">
						<table class="signoff-table-area" style="border:1px solid lightgray">
							<tr>
								<th rowspan="3" style="background-color:#edf1f1; border=none;">결재</th>
								<th style="border:1px solid lightgray">대표이사</th>
								<c:if test="${format == '1'}">
									<th style="border:1px solid lightgray">팀장</th>
									<th style="border:1px solid lightgray">차장</th>
								</c:if>
								<c:if test="${format == '2'}">
									<th style="border:1px solid lightgray">팀장</th>
								</c:if>
								<th style="border:1px solid lightgray">기안자</th>
							</tr>
							<tr>
								<td style="border:1px solid lightgray">대표자</td>
								<c:if test="${format == '1'}">
									<td style="cursor: pointer; border: 1px solid lightgray;" onclick="selectMemberModal(1)" data-index="1">서명</td>
									<td style="cursor: pointer; border: 1px solid lightgray;" onclick="selectMemberModal(2)" data-index="2">서명</td>
								</c:if>
								<c:if test="${format == '2'}">
									<td style="cursor: pointer; border: 1px solid lightgray;" onclick="selectMemberModal(1)" data-index="1">서명</td>
								</c:if>
								<td style="border:1px solid lightgray">서명</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray">결재일</td>
								<c:if test="${format == '1'}">
									<td style="border:1px solid lightgray">결재일</td>
									<td style="border:1px solid lightgray">결재일</td>
								</c:if>
								<c:if test="${format == '2'}">
									<td style="border:1px solid lightgray">결재일</td>
								</c:if>
								<td style="border:1px solid lightgray">결재일</td>
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
					<b style="cursor: pointer;" onclick="attachFile()">첨부</b>&nbsp;
					<ul id="fileList"></ul>
				</div>
				<br>
				<div id="button-area">
					<button class="btn-custom" type="reset" style="margin-right: 30px;">취소</button>
					<button class="btn-custom" type="button" onclick="submitDocument()" id="draftDocu">
						<c:if test="${format == '1'}">기안</c:if>
						<c:if test="${format == '2'}">품의</c:if>
					</button>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/signoffs/enrollDeptModal.jsp" />
	<jsp:include page="/WEB-INF/views/signoffs/enrollMemberModal.jsp" />
	<jsp:include page="/WEB-INF/views/signoffs/enrollFormJs.jsp" />
</body>
</html>