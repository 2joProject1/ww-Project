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
	        	사이드바에 들어갈 내용을 작성하세요
	        	</div>
	        </div>
	
	        <div id="content-layout">
				<div id="notice_title">
		            <div class="d-flex">
		                <div class="p-2">공지사항</div>
						
		                <div class="p-2 ml-auto">
		                    <a href="insert.no"><button>글작성</button></a>
		                   
		                </div>
		            </div>
		        </div>
		        <div id="notice_content">
		            <table border="1">
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
		                	
		                	<!--조회된 리스트 출력하기 -->
		<!--                 	
		                		<tr>
		                			<td colspan="6">등록된 공지사항이 없습니다</td>
		                		</tr>
		                         -->
		                		<tr>
		                		
		                            <td>1</td>
		                            <td>전직원</td>
		                            <td>소식</td>
		                            <td><a href="detail.no">회사가망함</a></td>
		                            <td>2022-02-02</td>
		                            <td>김회장</td>
		                            <td>1</td>
		                        
		                        </tr>
		                </tbody>
		
		              
		               
		            </table>
		        </div>
				
	        </div> <!-- content-layout끝 -->
	    </div>
</body>
</html>