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
    font-weight: 700;
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
    background: #CCC;
    margin: 2%;
    display: inline-block;
    float: left;
    border-radius: 20px;
    cursor: pointer;
    transition: 0.3s;
}

ul.project-list > li:hover {
    opacity: 0.7;
}

.project-list > li > a {
    display: inline-block;
    width: 100%;
    height: 100%;
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
				프로젝트<br>
				<div class="sub-menu">
					&nbsp;
					<a href="#" class="">전체</a>
					<br>
				</div>
				<div class="sub-menu">
					&nbsp;
					<a href="project.no-read" class="">읽지않음</a>
					<br>
				</div>
				<hr>
				<div class="sub-menu">
					&nbsp;
					<a href="" class="">내 일정</a>
					<br>
				</div>
			</div>
		</div>

		<div id="content-layout">
			<h2 class="project-title">내 프로젝트</h2>
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
			</ul>
			
			<hr>
			<h2 class="project-title">자기 부서이름</h2>
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

</body>
</html>