<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css적용 -->
<link rel="stylesheet" href="resources/css/communityView.css">
<title>커뮤니티</title>
<style>
.sb {
	position: relative;
	top: 5px;
}

.sb1 {
	width: 50px;
}

.col-1{

	position:relative;
	top:15px;
}

.wrtie_button{
	width : 300px;
	height:100px;
}

</style>
</head>

<body>


	<div class="container-fluid">
		<div class="row">
			<div class="col-8">
				<h1>커뮤니티</h1>
			</div>
			<div class="input-group mb-3 col-3 sb">
				<input type="text" class="form-control" placeholder="검색"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary sb1" type="button"
					id="button-addon2">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
				</button>
			</div>

			<div class="col-1">
				<button class="write_button">글 작성</button>
				
			</div>
		</div>


		<hr>
		<br>
		<h3 style="text-align: center">이번 주 인기 게시글 Top 5</h3>



		<div id="row">
			<%-- <c:forEach var="변수명" items="목록 데이터" begin="시작 인덱스" end="종료 인덱스">
				<div class="col"></div>
			</c:forEach> --%>
		</div>




		<div class="container">
		<c:forEach var="c" items="${list }">
			<div class="row">
				<div class="col">
					<div>${c.boardTitle }</div>
					<div></div>
				</div>
				
				<div class="col">
				
				</div>
				
				<div class="col">
				
				</div>
				
				<div class="col">
				
				</div>
				
				<div class="col">
				
				</div>
			</div>

		</c:forEach>
	</div>



		<!--  페이징 바 -->
  		 <div id="pagingArea">
                <ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li><!-- 1번페이지일경우 -->
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.co?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	                    </c:otherwise>
					</c:choose>

					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.co?cpage=${ p }">${ p }</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li><!-- 마지막페이지일경우 -->
						</c:when>
						<c:otherwise>
		                    <li class="page-item"><a class="page-link" href="list.co?cpage=${ pi.currentPage + 1 }">Next</a></li><!-- 마지막페이지일경우 -->
						</c:otherwise>
					</c:choose>
                </ul>
            </div>

	</div>


</body>

</html>