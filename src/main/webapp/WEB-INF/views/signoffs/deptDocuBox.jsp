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
	padding: 30px;
	margin-left: 30px;
}

.sub-menu {
	margin-left: 25px;
	line-height: 40px;
}

.docubox-title {
	width: 100%;
	font-size: 28pt;
}

.docubox-search-area {
	height: 40px;
}

.docubox-search-area>label {
	margin: 5px;
	font-size: 13pt;
}

.docubox-search {
	width: 180px;
	height: 40px;
	float: right;
	border-radius: 10px;
	border: 1px solid lightgray;
}

.table-hover {
	text-align: center;
}

.pagination {
	margin-left: 45%;
	color: black;
	border: none;
}

a.page-link {
	color: black;
	border: none;
}


/* filter css*/
.box-radio-input input[type="radio"]{
display:none;
}

.box-radio-input input[type="radio"] + span{
display:inline-block;
background:none;
border:1px solid #dfdfdf; 
padding:0px 10px;
text-align:center;
height:35px;
line-height:33px;
font-weight:500;
cursor:pointer;
}

.box-radio-input input[type="radio"]:checked + span{
border:1px solid #23a3a7;
background:#23a3a7;
color:#fff;
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
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="docubox.reseive">수신문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="docubox.dept">부서문서함</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-folder"></i>&nbsp;<a href="docubox.reject">반려문서함</a>
				</div>
			</div>
		</div>
		<div id="content-layout">
			<div class="docubox-title">부서문서함</div>
			<hr>
			<div class="docubox-search-area">
				<label class="box-radio-input">
				<input type="radio" name="docubox" value="day"><span>기안일자</span>
				</label>
				
				<label class="box-radio-input">
				<input type="radio" name="docubox" value="format"><span>결재양식</span>
				</label>
				
				<label class="box-radio-input">
				<input type="radio" name="docubox" value="status"><span>결재상태</span>
				</label>
				<input type="search" class="docubox-search" name="q">
			</div>
			<div class="docubox-board-area">
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기안일자</th>
							<th>문서번호</th>
							<th>결재양식</th>
							<th>제목</th>
							<th>기안자</th>
							<th>첨부</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2022-03-08</td>
							<td>20220301-1-2100</td>
							<td>품의</td>
							<td>소모품 비용처리의 건</td>
							<td>김사원</td>
							<td><i class="fi fi-rr-document"></i></td>
							<td>대기</td>
						</tr>
						<tr>
							<td>2022-03-07</td>
							<td>20220301-1-1100</td>
							<td>기안</td>
							<td>2022 하계 워크샵</td>
							<td>나사원</td>
							<td></td>
							<td>진행</td>
						</tr>
						<tr>
							<td>2022-03-06</td>
							<td>20220301-1-1100</td>
							<td>기안</td>
							<td>어쩌구저쩌구 전략회의</td>
							<td>당사원</td>
							<td><i class="fi fi-rr-document"></i></td>
							<td>완료</td>
						</tr>
					</tbody>
				</table>
				<div class="pagination-area">
					<ul class="pagination pagination-sm">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
								<!-- 1번페이지일 경우 비활성화되어있어야함 -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="docubox.draft?cpage=${ pi.currentPage - 1 }"><</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link" href="docubox.draft?cpage=${ p }">${ p }</a></li>
							<!-- requestParam으로 받는 cpage 로 쿼리스트링 키를 넘겨줘야함 (currentPage 가 아님) -->
						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="#">></a></li>
								<!-- 마지막페이지일경우  -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="docubox.draft?cpage=${ pi.currentPage + 1 }">></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>