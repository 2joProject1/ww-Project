<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 메인</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/commute.css">
</head>
<body>
        <div id="header-layout">
        	<jsp:include page="../common/header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
		            <ul id="sidebar-ul">
		                <i class="fi fi-rr-time-check"></i>&nbsp;
		                <a href=""><b>근태관리</b></a>
		                <br>
		                <div class="sub-menu">
							&nbsp;
							<a href="#" class="">출/퇴근관리</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="#" class="">월 근무내역</a>
							<br><br>
						</div>
		                
		                <i class="fi fi-rs-chart-tree"></i>&nbsp;
		                <a href="list.of"><b>휴가관리</b></a>
		                <br><br>
		               
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div id="commute-main">
                <span class="commute_title_text">출퇴근 관리</span><br><br>
              
            </div>

       
           
            <div id="result-area">
              기간선택  <input type="date" name = "date"> - <input type="date" name = "date"> 
              <button>조회</button> <br><br>
                <span class="commute_title_text">조회결과</span>
                
                <br><br>
       <table id="result">
		  <tr>
		    <th>날짜</th>
		    <th>출근시각</th>
		    <th>퇴근시각</th>
		    <th>근무상태</th>
		  </tr>
		</table>
            </div>
            
	        </div>
	    </div>
</body>
</html>