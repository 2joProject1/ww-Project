<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가관리 메인</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/off.css">
</head>
<body>
        <div id="header-layout">
        	<jsp:include page="../common/header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        		<br>
		            <ul id="sidebar-ul">
		                <i class="fi fi-rr-time-check"></i>&nbsp;
		                <a href="main.cm"><b>근태관리</b></a>
		                <br><br>
		                
		                <i class="fi fi-rs-chart-tree"></i>&nbsp;
		                <a href="list.of"><b>휴가관리</b></a>
		                <br>
		                <div class="sub-menu">
							&nbsp;
							<a href="#" class="">휴가신청</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="#" class="">휴가현황</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="#" class="">휴가신청승인</a>
							<br>
						</div>
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div id="commute-main">
                <span class="commute_title_text">휴가 신청/조회</span><br><br>
                <form action="insert.of" method="post">
	                <input type="hidden" value="12345" name="offWriter">
	                <input type="hidden" value="0" name="offDept">
	                기간  <input type="date" name = "offStart"> - <input type="date" name = "offEnd"> <br>
	              휴가일수 <input type="text" name="offDays">   <br>  
	                사유 <input type="text-area" name="offReason">
	               <input type="submit" value="신청하기">
                </form>
            </div>

       <br>
           
            <div id="result-area">
              기간선택  <input type="date" name = "date"> - <input type="date" name = "date"> 
              <button>조회</button> <br><br>
                <span class="commute_title_text">조회결과</span>
                
                <br><br>
         <table id="result">
			  <thead>
				  <tr>
				    <th>신청번호</th>
				    <th>휴가날짜</th>
				    <th>휴가일수</th>
				    <th>휴가신청일</th>
				    <th>상태</th>
				  </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="o" items="${ list }">
			  		<tr>
			  			<td>${o.offNo}</td>
			  			<td>${o.offStart} ~ ${o.offEnd}</td>
			  			<td>${o.offDays}</td>
			  			<td>${o.requestDate}</td>
				  			<c:choose>
				  				<c:when test="${o.status eq 'W'}">
				  					<td>대기</td>
				  				</c:when>
				  				<c:when test="${o.status eq 'Y'}">
				  					<td>승인</td>
				  				</c:when>
				  				<c:otherwise>
				  					<td>반려</td>
				  				</c:otherwise>
				  			</c:choose>
			  		</tr>
			  	</c:forEach>
			  </tbody>
		</table>
            </div>
            
	        </div>
	    </div>
</body>
</html>