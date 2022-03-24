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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			<div class="col-1" onclick="thumbClick()">
				<p class="dt_thumbs">
					<span id="thumb_before">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
						  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
						</svg>
					</span>
					<span id="thumb_after">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
						  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
						</svg>
					</span>
					<span id="showGood">
						${detail.communityGood }
					</span>
					
				</p>
			</div>
			<div class="col-1">
				<p class="dt_chat">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
					  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
					</svg>
					${detail.replyCnt }
				</p>	
			</div>
			<div class="col-10 dt_btns">
				<button onclick="location.href='modifyPage.co?pageNo=${detail.boardNo}'">수정</button>
				<button onclick="location.href='delete.co?pageNo=${detail.boardNo}'">삭제</button>
			</div>
		</div>
		<c:forEach items="${replys}" var="r">
			<form id="CommunityDeleteForm" method="post" action="deleteReply.co">
			<div class="row replyDiv1">
				<div class="col-11 replymargin">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
					<b>익명</b>
					
				</div>
				<div class="col-1" >
					<button type="submit" class="replyDeleteBtn">x</button>
				</div>
				<div class="col-12 reply_margin">
					${r.replyContent }
				</div>
				<div class="col-12 reply_margin">
					<fmt:formatDate value="${r.enrollDate }" pattern="MM/dd hh:mm"/>
				</div>
				<input type="hidden" name="replyNo" value="${r.replyNo}">
				<input type="hidden" name="boardNo" value="${r.boardNo}">
			</div>
			</form>
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
		<input type="hidden" name="communityGood" value="${detail.communityGood}" id="d_communityGood"/>
		<input type="hidden" name="boardNo" value="${detail.boardNo}" id="d_boardNo"/>
		<input type="hidden" id="loginUserInfo" value="${loginUser.memberNo}"/>
		</div>
	</div>
	</div>
		
	<script type="text/javascript">
		var isClick = false;
		// 추천 후 이모지 숨기기
		$(document).ready(function(){
			$('#thumb_after').css('display','none');
		})
	
		// 이미지 클릭
		function onclickImg(){
			$('#communityInsertForm').submit();			
		}
		
		// 공감 수 증가
		function thumbClick(){
			var boardNo = $('#d_boardNo').val();
			var communityGood = $('#d_communityGood').val();
			var nowMember = $('#loginUserInfo').val();
			var param = {'boardNo' : boardNo, 'communityGood' : communityGood, 'boardWriter' : nowMember};
			if(isClick == false){
				$('#thumb_before').css('display','none');
				$('#thumb_after').css('display','');
				
				$.ajax({
						url : "thumbsPlus.co",
						type : "POST",
						data: param,
						async : false,
						dataType : 'text',
						success:function(data){
							if(data == 's'){
								alert('추천 완료!');
								isClick = !isClick;
								$('#showGood').text(Number(communityGood)+1);
							}else if(data =='f'){
								alert('추천 오류!');
							}else{
								alert('이미 추천했습니다!');
							}
							
							
						},
						error:function(err){
							console.log(err)
						}
				 })
			}else{
				$('#thumb_before').css('display','');
				$('#thumb_after').css('display','none');
				
				$.ajax({
					url : "thumbsMinus.co",
					type : "POST",
					data: param,
					async : false,
					success:function(data){
						alert('추천 취소');
						isClick = !isClick;
						$('#showGood').text(communityGood);
					},
					error:function(err){
						console.log(err)
					}
			 })
				
			}
			
			
		
		}
		
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</body>
</html>