<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	
	.content1{
		width: 100%;
		height: 300px;
		float: right;
	}
	
	.content2{
		width: 50%;
		height: 300px;
		float: left;
	}
	
	.content3{
		width: 50%;
		height: 300px;
		float: right;
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
	        	<br>
	        		전자결재<br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="write.docu">문서작성하기</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">기안문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">수신문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">부서문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">반려문서함</a><br>
	        	</div>
	        </div>
	
	        <div id="content-layout">
	        	<div class="content1"></div>
	        	<div class="content2"></div>
	        	<div class="content3"></div>
	        </div>
	    </div>
</body>
</html>