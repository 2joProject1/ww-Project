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
	.nr{
		font-size:18px;
		font-weight:lighter;
	}
	.nt{
		font-weight:bold;
	}
	#side_wrap{
		margin-top:30px;
		margin-left:20px;
	}
</style>

</head>
<body>
	<div id="side_wrap">
		<ol class="nt"><a href="notice.no"><i class="xi-lightbulb-o"></i>&nbsp;공지사항</a>
			<li>&nbsp;</li>
			<li class="nr"><a href="range.no?noticeRange=전직원">&nbsp;&nbsp;&nbsp;&nbsp;전직원</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=기획팀">&nbsp;&nbsp;&nbsp;&nbsp;기획팀</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=운영팀">&nbsp;&nbsp;&nbsp;&nbsp;운영팀</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=재무팀">&nbsp;&nbsp;&nbsp;&nbsp;재무팀</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=서비스팀">&nbsp;&nbsp;&nbsp;&nbsp;서비스팀</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=개발팀">&nbsp;&nbsp;&nbsp;&nbsp;개발팀</a></li><br>
			<li class="nr"><a href="range.no?noticeRange=인사팀">&nbsp;&nbsp;&nbsp;&nbsp;인사팀</a></li>
		</ol>
		<br><br><br><br><br><br><br>
		<div style="text-align:center"><a href="logout.me">로그아웃</a></div>
	</div>
</body>
</html>