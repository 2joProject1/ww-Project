<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/header.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	



	<c:choose>
		<c:when test="${ loginUser ne null }">
			<script>
				window.onload = $(function(){
					location.replace('main') 
				})
			</script>
		</c:when>
		<c:otherwise>
			<jsp:forward page="WEB-INF/views/common/login.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>

