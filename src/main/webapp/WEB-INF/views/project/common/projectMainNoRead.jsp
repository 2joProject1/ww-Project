<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2.project-title {
    padding: 20px;
    font-weight: 400;
    margin-left: 20px;
}

ul.project-list {
    list-style: none;
    display: inline-block;
    width: 100%;
}

ul.project-list > li {
    width: 21%;
    height: 200px;
    line-height: 200px;
    background: #edf1f1;
    margin: 2%;
    display: inline-block;
    float: left;
    border-radius: 50px;
    cursor: pointer;
    transition: 0.3s;
    
}

ul.project-list > li:hover {
    opacity: 0.7;
    border: 0.7px solid gray;
}

.project-list > li > a {
    display: inline-block;
    width: 100%;
    height: 100%;
}

/* 프로젝트 사이드바 */

.new-project{
	background-color: rgb(102, 164, 166);
	border: none;
	border-radius: 50px;
	width: 180px;
	height: 80px;
	margin-left: 25px;
	color: white;
	box-shadow: 1px 1px 1px 1px lightgray;
}

.sub-menu-title{
	margin-left: 40px;
	line-height: 40px;
}
.sub-menu{
	margin-left: 60px;
	line-height: 40px;
}

/* 프로젝트 생성*/

.modal-body{
	border: 1px solid gray;
	margin: 20px;
}
.newProject-table{
	width: 500px;
}

.newProject-table th{
	width: 250px;
	line-height: 50px;
	font-size: 15pt;
	margin-left: 10px;
}

.newProject-table td{
	width: 480px;
	line-height: 50px;
	font-size: 15pt;
	margin-left: 10px;
}

.newProject-date{
	border: none;
}

.newProject-content{
	width: 700px;
	height: 300px;
	border: 1px solid lightgray;
	resize: none;
	margin-left: 13px;
}

.newProject-count{
	margin: auto;
	margin-left: 43px;
}

.newProject-member{
	width: 700px;
    height: 130px;
    padding: 10px;
    margin-left: 43px;
    border: 1px solid lightray;
    border-radius: 10px;
}

.newProject-member{
	width: 620px;
    height: 130px;
    padding: 10px;
    margin-left: 43px;
}

.newProject-input{
	width: 524px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

*:focus{
	outline: none;
}

.btn-new, .btn-reset{
	width: 80px;
	height: 40px;
	border: 1px solid lightgray;
	border-radius: 10px;
}

.btn-new{
	background-color: rgb(102,164,166);
	margin-left: 20px;
}

.btn-area{
	margin-left: 38%;
}

</style>
</head>
<body>
	<div id="header-layout">
		<jsp:include page="../../common/header.jsp" />

	</div>
	<div id="container">
		<div id="sidebar-layout">
			<div id="main-sidebar">
				<button type="button" class="new-project" data-toggle="modal" data-target="#newProject">새 프로젝트</button><br><br>
				<div class="sub-menu-title">
					<i class="fi fi-rr-menu-burger"></i>&nbsp;<b>프로젝트</b><br>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-apps"></i>&nbsp;<a href="project.main" class="">&nbsp;전체</a>
				</div>
				<div class="sub-menu">
					<i class="fi fi-rr-check"></i>&nbsp;<a href="#" class="">&nbsp;읽지않음</a>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">&nbsp;내 일정</a>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<h2 class="project-title">내 프로젝트</h2>
			<ul class="project-list">
				<li>
					<a href="project?pno=1"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
			</ul>
			
			<hr>
			<h2 class="project-title">개발팀</h2>
			<ul class="project-list">
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
				<li>
					<a href="#"></a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- The Modal -->
  <div class="modal fade" id="newProject">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><b>프로젝트 생성하기</b></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <form action="" method="post">
          <table class="newProject-table">
          	<tr>
          		<th>프로젝트명</th>
          		<td><input type="text" name="" class="newProject-input"></td>
          	</tr>
          	<tr>
          		<th>프로젝트 시작일자</th>
          		<td><input type="date" name="" class="newProject-date"></td>
          	</tr>
          	<tr>
          		<th>프로젝트 마감일자</th>
          		<td><input type="date" name="" class="newProject-date"></td>
          	</tr>
          	<tr>
          		<th>프로젝트 매니저</th>
          		<td><input type="text" name="" class="newProject-input" value="${ loginUser }" readonly></td>
          	</tr>
          	<tr>
          		<th colspan="2">프로젝트 인원</th>
          	</tr>
          	<tr>
          		<th colspan="2">&nbsp;&nbsp;총 6명
          	</tr>
          	<tr>
          		<th colspan="2"><div class="newProject-member" id="addMember"></div></th>
          	</tr>
          	<tr>
          		<th colspan="2">프로젝트 개요</th>
          	</tr>
          	<tr>
          		<th colspan="2"><textarea class="newProject-content" name="" required>내용을 여기다가 </textarea></th>
          	</tr>
          </table>
          <div class="btn-area">
	          <button type="reset" class="btn-reset">취소</button>
	          <button type="submit" class="btn-new">생성</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script>
  
  $('#addMember').on("click",function(){
		$('#searchMember').modal('show');
  })

  </script>
  
  <div class="modal fade" id="searchMember">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사원검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<i class="fi fi-rr-search"></i>&nbsp;<input type="search" name="" placeholder="이름/부서 검색">
					<ul>
						<li></li>
					
					
					</ul>
				
				
				
				
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>