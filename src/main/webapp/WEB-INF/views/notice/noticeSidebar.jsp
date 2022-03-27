<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li{
		list-style:none;
	}
</style>

</head>
<body>
	
		<ol class="nr"><a href="notice.no">공지사항</a>
			<li class="nr"><a href="range.no?noticeRange=전직원">전직원</a></li>
			<li class="nr"><a href="range.no?noticeRange=기획팀">기획팀</a></li>
			<li class="nr"><a href="range.no?noticeRange=운영팀">운영팀</a></li>
			<li class="nr"><a href="range.no?noticeRange=재무팀">재무팀</a></li>
			<li class="nr"><a href="range.no?noticeRange=서비스팀">서비스팀</a></li>
			<li class="nr"><a href="range.no?noticeRange=개발팀">개발팀</a></li>
			<li class="nr"><a href="range.no?noticeRange=인사팀">인사팀</a></li>
		</ol>

</body>
</html>