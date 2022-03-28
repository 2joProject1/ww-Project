<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/layout.css">

</head>
<body>
<div id="header-layout">
   	<jsp:include page="../common/header.jsp" />

</div>
<div id="container">
	<div id="sidebar-layout">
		<div id="main-sidebar">
   	<jsp:include page="noticeSidebar.jsp" />
		</div>
	</div>

<div id="content-layout">
	<div id="notice_title">
		<div class="d-flex">
			<div class="p-2">공지사항</div>
			<div class="p-2 ml-auto">
				<a href="enrollForm.no"><button>글작성</button></a>
			</div>
		</div>
	</div>
	<div id="notice_content">
		<table id="noticeList" border="1">
           
			<thead>
				<tr>
					<th><input type="checkbox" id="all" class="batch"></th>
					<th>글번호</th>
					<th>대상</th>
					<th>카테고리</th>
					<th style="width: 600px;">제목</th>
					<th>작성일</th> 
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>     	
				<c:forEach var="n" items="${ list }">
					<tr>
						<td class="mno">${ n.boardWriter }</td>
						<td class="bno">${ n.boardNo }</td>
						<td>${ n.noticeRange }</td>
						<td>${ n.noticeCategory }</td>
						<td>${ n.boardTitle }</td>
						<td>${ n.enrollDate }</td>
						<td class="writer">${ n.memberName }</td>
						<td>${ n.count }</td>
						<td>
						파일자리?
						</td>              
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	        
<script>
	$(function(){
		$("#noticeList>tbody>tr").click(function(){
			location.href = 'detail.no?bno=' + $(this).children(".bno").text()+'&mno='+$(this).children(".mno").text();
			console.log($(this).children(".bno").text())
			console.log($(this).children(".writer").text())
			console.log($(this).children(".mno").text())
		})
	})
       
       
</script>
	        
	        
	        
	        
	<div id="pagingArea">
		<ul class="pagination">
			<c:choose>
				<c:when test="${ pi.currentPage eq 1}">
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li><!-- 1번 페이지일 경우 디스에이블넣어줘야 -->
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="range.no?cpage=${ pi.currentPage -1 }&noticeRange=${noticeRange}">Previous</a></li>
				</c:otherwise>
			</c:choose>
			
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<li class="page-item"><a class="page-link" href="range.no?cpage=${ p }&noticeRange=${ noticeRange }">${ p }</a></li>
			</c:forEach>
			
			<c:choose>
				<c:when test="${ pi.currentPage eq pi.maxPage }">
					<li class="page-item disabled"><a class="page-link" href="#">Next</a></li><!-- 마지막페이지일경우 디스에이블넣어줘야 -->
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="range.no?cpage=${ pi.currentPage +1 }&noticeRange=${ noticeRange }">Next</a></li><!-- 마지막페이지일경우 디스에이블넣어줘야 -->                    	
				</c:otherwise>
			</c:choose>
		</ul>
	</div>



</div> <!-- content-layout끝 -->
</body>
</html>