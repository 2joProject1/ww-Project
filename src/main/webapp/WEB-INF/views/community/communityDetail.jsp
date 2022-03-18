<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WALK--WORK</title>
<!-- 부트스트랩관련 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/communityDetail.css">
</head>
<body>
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>

	<div id="container">
		<jsp:include page="../community/communitySidebar.jsp" />
		<div id="content-layout">
		<div class="container">
			<h1 onclick="location.href='list.co'">커뮤니티</h1>
			<hr>
				
		<div class="row">
			<div class="col-1">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			</div>
			<div class="col-11">
				<div class="dt_name">익명</div>
				<div><fmt:formatDate value="${detail.enrollDate }" pattern="MM/DD hh:mm"/></div>
			</div>
		</div>
		<div class="row dt_margin">
			<div class="col">
				<h2>${detail.boardTitle }</h2>			
			</div>
		</div>
		<div class="row dt_margin">
			<div class="col">
				<span>
					${detail.boardContent }
				</span>
			</div>
		</div>
		<div class="row dt_margin">
			<c:forEach var="a" items="${attachment }">
				<div class="col-4 imgCol">
					<img alt="이미지" src="/filepath/${a.fileName }" class="fileImg" width="100%">
				</div>
			</c:forEach>
		</div>
		<div class="row dt_margin">
			<div class="col">
				<!-- 사진 내용 -->
			</div>
		</div>
		<div class="row dt_margin dt_last">
			<div class="col-1">
				<p class="dt_thumbs">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
					  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
					</svg>
					${detail.communityGood }
				</p>
			</div>
			<div class="col-1">
				<p class="dt_chat">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
					  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
					</svg>
					0
				</p>	
			</div>
			<div class="col-10 dt_btns">
				<button onclick="location.href='modifyPage.co?pageNo=${detail.boardNo}'">수정</button>
				<button onclick="location.href='delete.co?pageNo=${detail.boardNo}'">삭제</button>
			</div>
		</div>
		<c:forEach items="${replys }" var="r">
			<div class="row replyDiv1">
				<div class="col-11 replymargin">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
					<b>익명1</b>
				</div>
				<div class="col-1">
					x
				</div>
				<div class="col-12 reply_margin">
					${r.replyContent }
				</div>
				<div class="col-12 reply_margin">
					<fmt:formatDate value="${r.enrollDate }" pattern="MM:DD hh:mm"/>
				</div>

			</div>
		</c:forEach>
		<div class="row replyDiv2" >
			<div class="col-12">
				<form action="insertReply.co" method="post" id="communityInsertForm">
					<input type="text" class="replyInput" placeholder="댓글을 입력해주세요 30자이내" name="replyContent" required="required"/>
					<img src="resources/images/send.svg" class="sendImg" id="sendImg" onclick="onclickImg()">
					<input type="hidden" name="boardNo" value="${detail.boardNo }"/>
				</form>
			</div>
		</div>
		</div>
	</div>
	</div>
		
	<script type="text/javascript">
		function onclickImg(){
			$('#communityInsertForm').submit();			
		}
		
		
	</script>
</body>
</html>