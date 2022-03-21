<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 부트스트랩 -->
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-straight/css/uicons-bold-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>휴가관리 메인</title>

<style>
#result {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 77%;
  margin-left: 9%
}

#result td, #result th {
  border: 1px solid #ddd;
  padding: 8px;
}

#result tr:nth-child(even){background-color: #f2f2f2;}

#result tr:hover {background-color: #ddd;}

#result th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #66a4a6;
  color: white;
}

#result td{
	text-align: center;
}
  .commute_title_text{
  	font-size: 30px;
  	font-weight: bold;
  	margin-left: 2%;
  }
  .commute_result_text{
  	font-size: 25px;
  	font-weight: bold;
  	margin-left: 4%;
  }
  #result-area{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 2%;
  }
  #commute-title{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  }
  #commute-main{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 2%;
  
  }
  
  #reason-t{
   width:600px;
   height:50px;
   border-radius : 7px;
   border: 1px solid #bcbcbc;
  }
  #days-t{
  	width:70px;
    border-radius : 7px;
    border: 1px solid #bcbcbc;
  }
  .sub-menu{
  	font-size: 17px;
  }
  
</style>
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
							<a href="list.of" class="">휴가신청</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="status.of" class="">휴가현황</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="approval.of" class="">휴가신청승인</a>
							<br>
						</div>
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
	        <div id="commute-title">
                <span class="commute_title_text">휴가 신청/조회</span>
                <hr>
	        </div>
	            <div id="commute-main">
	                <form action="insert.of" method="post">
	                
		                <input type="hidden" value="12345" name="offWriter">
		                <input type="hidden" value="0" name="offDept">
			                기간선택 <input type="date" name = "offStart"> - <input type="date" name = "offEnd"> <br><br>
			              휴가일수 <input type="text" name="offDays" id="days-t">   <br><br>  
			         &nbsp; 사유&nbsp;&nbsp;&nbsp;&nbsp; 
			         <input type="text-area" name="offReason" placeholder="20자 이하" id="reason-t">  &nbsp;
		               <input type="submit" value="신청">
	                </form>
				<hr>
	            </div>
           
            <div id="result-area">
              기간조회  <input type="date" name = "date"> - <input type="date" name = "date"> 
              <button>조회</button> <br><br>
            </div>
                
               
                
            <div id="result-area1">
                <span class="commute_result_text">조회결과</span><br><br>
		         <table id="result">
					  <thead>
						  <tr>
						    <th width="100px">신청번호</th>
						    <th width="270px">휴가날짜</th>
						    <th width="100px">휴가일수</th>
						    <th width="150px">휴가신청일</th>
						    <th width="100px">상태</th>
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