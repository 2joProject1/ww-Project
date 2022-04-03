<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<style>
 		#content-layout{
		padding-left:50px;
	}
		#notice_banner{
		font-size:30px;
	}
	#write_btn{
		background:rgb(102, 164, 166);
		color:white;
	}
 	table th{
		font-size : 20px;
	}
	table thead{
		background:rgb(102, 164, 166);
		color:white;
	}
	table tbody td{
		height:30px;
	}
	.td_center{
		text-align:center;
	}
	#pagingArea{
		padding-left:480px;
		padding-top:30px;

	}
	.centerTd{
		text-align:center;
	}
 	#noticeList>tbody>tr:hover{
		background-color:rgb(237, 241, 241);
		cursor: pointer;
	}
	.centerTd{
		height:50px;
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
   			<jsp:include page="noticeSidebar.jsp" />
		</div>
	</div>

	<div id="content-layout">
		<div id="notice_title">
			<div class="d-flex">
				<div class="p-2" id="notice_banner">${ list[0].noticeRange }&nbsp;공지사항</div>
				<div class="p-2 ml-auto" style="margin-bottom:20px">
					<c:if test="${ loginUser.rankNo eq 9 }">
						<a href="enrollForm.no"><button id="write_btn" class="btn">글작성</button></a>				
					</c:if>
				</div>
			</div>
		</div>
		<div id="notice_content">
			<table id="noticeList" border="1">
	           
				<thead>
					<tr style="text-align:center;">
						<th></th>
						<th style="width:150px; height:35px">카테고리</th>
						<th style="width:1000px;">제목</th>
						<th style="width:300px;">작성일</th> 
						<th style="width:100px;">작성자</th>
						<th style="width:100px;">조회수</th>
					</tr>
				</thead>
				<tbody>     	
					<c:forEach var="n" items="${ list }">
						<tr>
							<td></td>
							<td class="mno centerTd">${ n.boardWriter }</td>
							<td class="bno centerTd">${ n.boardNo }</td>
							<td class="centerTd">${ n.noticeCategory }</td>
							<td>${ n.boardTitle }</td>
							<td class="centerTd">${ n.enrollDate }</td>
							<td class="writer centerTd">${ n.memberName }</td>
							<td class="centerTd">${ n.count }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	        
<script>
window.onload = $(function(){
	$('.bno').hide();
	$('.mno').hide();
	
})
	$(function(){
		$("#noticeList>tbody>tr").click(function(){
			location.href = 'detail.no?bno=' + $(this).children(".bno").text()+'&mno='+$(this).children(".mno").text();
		})
	})
       
       
</script>
	        
	        
	        
	        
	<div id="pagingArea">
		<ul class="pagination">
			<c:choose>
				<c:when test="${ pi.currentPage eq 1}">
					<li class="page-item disabled"><a class="page-link" href="#" style="color:grey;">이전</a></li><!-- 1번 페이지일 경우 디스에이블넣어줘야 -->
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="notice.no?cpage=${ pi.currentPage -1 }" style="color:rgb(102, 164, 166);">이전</a></li>
				</c:otherwise>
			</c:choose>
			
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<li class="page-item"><a class="page-link" href="notice.no?cpage=${ p }" style="color:rgb(102, 164, 166);">${ p }</a></li>
			</c:forEach>
			
			<c:choose>
				<c:when test="${ pi.currentPage eq pi.maxPage }">
					<li class="page-item disabled"><a class="page-link" href="#" style="color:grey;">다음</a></li><!-- 마지막페이지일경우 디스에이블넣어줘야 -->
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="notice.no?cpage=${ pi.currentPage +1 }" style="color:rgb(102, 164, 166);">다음</a></li><!-- 마지막페이지일경우 디스에이블넣어줘야 -->                    	
				</c:otherwise>
			</c:choose>
		</ul>
	</div>



</div> <!-- content-layout끝 -->
</body>
</html>