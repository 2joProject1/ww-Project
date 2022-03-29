<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css적용 -->
<link rel="stylesheet" href="resources/css/communityView.css">
<title>커뮤니티</title>
<!-- 부트스트랩관련 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>




	<div id="container">
		<jsp:include page="../community/communitySidebar.jsp" />
		<div id="content-layout">
			<div class="container">
				<div class="row">
					<div class="col-8">
						<h1 onclick="location.href='list.co'">내 게시물</h1>
					</div>
					<div class="col-3 searchView">
						<form action="list.co" method="get" accept-charset="utf-8">
							<input type="text" name="search" placeholder="검색어 입력"
								class="searchInput"> <img
								src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
								class="searchImg">
						</form>

					</div>
					<div class="col-1">
						<button class="write_button" onclick="location.href='write.co'">글
							작성</button>

					</div>
				</div>
				<hr>
				<br>
				<div class="container" style="padding-top: 65px;">
					<c:forEach var="c" items="${list }" varStatus="status">
						<div class="row cm_row"
							onclick="location.href='detail.co?pageNo=${c.boardNo}'">
							<div class="col-8" style="margin-top:30px">
								<div class="cm_title" style="font-size: 25px;">${c.boardTitle }</div>
								<br />
								<div class="cm_content">${c.boardContent }</div>
							</div>

							<div class="col-4 cm_end"
								style="padding-bottom: 10px; margin-top: 50px">
								<span class="cm_ends"><fmt:formatDate
										value="${c.enrollDate }" pattern="hh:mm" /></span>
								<%-- <span class="cm_ends">${listImg[status.index].boardNo} 랑 ${c.boardNo}</span> --%>
								<c:if test="${c.fileName != null}">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-paperclip"
										viewBox="0 0 16 16">
									  <path
											d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z" />
									</svg>
								</c:if>
								<span class="thumbs cm_ends"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-hand-thumbs-up"
										viewBox="0 0 16 16">
									  <path
											d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
									</svg> ${c.communityGood }
								</span> <span class="chat cm_ends"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
									  <path
											d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
									</svg> ${c.replyCnt }
								</span>
								<c:if test="${c.fileName != null}">
									<span class="cm_ends"> <img alt="img"
										src="/filepath/${c.fileName}"
										onerror="this.style.display='none';" width="100px;"  class="cm_imgs">
									</span>
								</c:if>
							</div>


						</div>

					</c:forEach>
				</div>

				<div id="pagingArea" style="padding-left: 30%; padding-top: 78px;">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#">Previous</a></li>
								<!-- 1번페이지일경우 -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="list.co?cpage=${ pi.currentPage - 1 }&&search=${search}">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<li class="page-item"><a class="page-link"
								href="list.co?cpage=${ p }&&search=${search}">${ p }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#">다음</a></li>
								<!-- 마지막페이지일경우 -->
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="list.co?cpage=${ pi.currentPage + 1 }&&search=${search}">다음</a></li>
								<!-- 마지막페이지일경우 -->
							</c:otherwise>
						</c:choose>
					</ul>
				</div>


			</div>
		</div>
	</div>

</body>

</html>