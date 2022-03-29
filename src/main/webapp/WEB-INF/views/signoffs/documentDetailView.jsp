<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문서 상세조회</title>

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
	overflow: auto;
}

#fileList>li {
	list-style: none;
}
</style>

</head>
<body>
	<input type="hidden" id="docuNo" value="${documentItem.docuNo }">
	<input type="hidden" id="approvalNo" value="${documentItem.approvalNo }">
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>
	<div id="container">
		<div id="sidebar-layout">
			<div id="main-sidebar">
				<br> <i class="fi fi-rr-menu-burger"></i>&nbsp;<b>전자결재</b>
				<div class="sub-menu">
					<i class="fi fi-rr-edit"></i>&nbsp;
					<a href="signoffs.docu?format=1">문서작성하기</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;
					<a href="docubox.draft">기안문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;
					<a href="docubox.receive">수신문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;
					<a href="docubox.dept">부서문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;
					<a href="docubox.reject">반려문서함</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<form id="enrollForm" class="enroll-form" action="docubox.update" enctype="multipart/form-data" method="post">
				<div id="docu-header-area">
					<div id="docu-basic-area">
						<br>
						<h2>
							<c:choose>
								<c:when test="${isReceiver}">
									수신문서
								</c:when>
								<c:otherwise>
									<c:if test="${documentItem.docuFormat == '1'}">
									기안문서
									</c:if>
									<c:if test="${documentItem.docuFormat == '2'}">
									품의서
									</c:if>
								</c:otherwise>
							</c:choose>
						</h2>
						<hr>

						<table class="docu-format-base">
							<tr>
								<th>형식</th>
								<td>
									<c:if test="${documentItem.docuFormat == '1'}">
									기안문서
									</c:if>
									<c:if test="${documentItem.docuFormat == '2'}">
									품의서
									</c:if>
								</td>
								<th>문서보존기간</th>
								<td>5년</td>
							</tr>
							<tr>
								<th>문서번호</th>
								<td>${documentItem.docuNo}</td>
								<th>수신부서</th>
								<td>${dept.deptName}</td>
							</tr>
							<tr>
								<th>
									<c:if test="${documentItem.docuFormat == '1'}">
										기안일자
									</c:if>
									<c:if test="${documentItem.docuFormat == '2'}">
										품의일자
									</c:if>
								</th>
								<td><fmt:formatDate value="${documentItem.docuWriteDate}" pattern="yyyy-MM-dd"/></td>
								<th>소속</th>
								<td>${writerDept.deptName}</td>
							</tr>
						</table>
					</div>

					<br>
					<div id="docu-signoff-area">
						<table class="signoff-table-area" border="1">
							<tr>
								<th rowspan="3">결재</th>
								<th>대표이사</th>
								<c:if test="${documentItem.docuFormat == '1'}">
									<th>팀장</th>
									<th>차장</th>
								</c:if>
								<c:if test="${documentItem.docuFormat == '2'}">
									<th>팀장</th>
								</c:if>
								<th>사원</th>
							</tr>
							<tr>
								<td>대표자</td>
								<c:forEach var="item" items="${signoffsList}">
									<td>${item.memberName}</td>
								</c:forEach>
								<td>${writerInfo.memberName}</td>
							</tr>
							<tr>
								<td style="font-size: 8pt"></td>
								<c:forEach var="item" items="${signoffsList}">
									<c:choose>
										<c:when test="${item.approvalStatus == 1}">
											<td style="font-size: 8pt"><fmt:formatDate value="${item.approvalDate}" pattern="MM/dd hh:mm"/></td>
										</c:when>
										<c:when test="${item.approvalStatus == 2}">
											<td style="font-size: 8pt">반려</td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<td style="font-size: 8pt"><fmt:formatDate value="${documentItem.docuWriteDate}" pattern="MM/dd hh:mm"/></td>
							</tr>
						</table>
					</div>
				</div>
				<br> <br>
				<hr>
				<div id="docu-content">
					<br> <b>제목</b>&nbsp;&nbsp;<input type="text" name="docuTitle" value="${documentItem.docuTitle}" id="docuTitle" readonly><br>
					<br> <b>내용</b>&nbsp;
					<textarea class="docu-content-textarea" name="docuContent" readonly>${documentItem.docuContent}</textarea>
					<br>
					<br>
					<b>첨부</b>&nbsp;
					<ul id="fileList">
						<c:forEach var="item" items="${fileList}">
							<li><a href="${item.fileName}" target="_blank">${item.fileOriginName}</a></li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<div id="button-area">
					<button class="btn-custom" type="button" onclick="history.back()" id="draftDocu">목록</button>
					<c:if test="${isReceiver}">
						<button class="btn-custom" type="button" onclick="approveSignoffs(${receiverSignoffs.approvalNo})" id="draftDocuApprove">승인</button>
						<button class="btn-custom" type="button" onclick="denySignoffs(${receiverSignoffs.approvalNo})" id="draftDocuReject">반려</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<script>
		function changeFormat(target) {
			window.location.href = 'signoffs.docu?format=' + target.value;
		}

		//승인
		function approveSignoffs(approvalNo) {
			var is = confirm("승인하시겠습니까?");
			if (is) {
				$.ajax({
					url: 'docubox.approve',
					method: 'POST',
					data: {
						approvalNo : approvalNo,
						docuNo: $('#docuNo').val()
					},
					success : function (data) {
						console.log(data);
						window.location.reload();
					}
				})
			}
		}
	
		//반려
		function denySignoffs(approvalNo) {
			var is = confirm("반려하시겠습니까?");
			if (is) {
				$.ajax({
					url: 'docubox.deny',
					method: 'POST',
					data: {
						approvalNo : approvalNo,
						docuNo: $('#docuNo').val()
					},
					success : function (data) {
						console.log(data);
						window.location.reload();
					}
				})
			}
		}
	</script>
</body>
</html>