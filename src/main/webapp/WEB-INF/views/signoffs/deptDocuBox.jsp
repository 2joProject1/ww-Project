<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="header-layout">
        	<jsp:include page="../common/header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        		전자결재
	        		<a href="">문서작성하기</a>
	        		<a href="">기안문서함</a>
	        		<a href="">수신문서함</a>
	        		<a href="">부서문서함</a>
	        		<a href="">반려문서함</a>
	        	</div>
	        </div>
	
	        <div id="content-layout">
	        	content영역에 들어갈 내용을 작성하세요
	        </div>
	    </div>
</body>
</html>