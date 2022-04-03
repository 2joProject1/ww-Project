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
    
    <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    
<title>휴가 신청/조회</title>

<style>
#result {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 77%;
  margin-left: 9%;
  font-family: 'Nanum Gothic', sans-serif;
}

#result td, #result th {
  border: 1px solid #ddd;
  padding: 8px;
}

#result tr:nth-child(even){background-color: rgb(245, 248, 248);}

#result tr:hover {background-color: rgb(237, 241, 241);}

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
  	font-family: 'Nanum Gothic', sans-serif;
  }
  .commute_result_text{
  	font-size: 27px;
  	font-weight: bold;
  	margin-left: 4%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #result-area{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #commute-title{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #commute-main{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  
  #reason-t{
   width:420px;
   height:60px;
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
  	margin-left:12%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
    #check{
    font-size: 14px;
    background: none;
    color: white;
    border: 0;
    background-color:#72b1ca;
    border-radius: 10px;
    cursor: pointer;
}

#non{
    font-size: 14px;
    background: none;
    color: white;
    border: 0;
    background-color:#f0ae82;
    border-radius: 10px;
    cursor: pointer;
}
#wait{
    font-size: 14px;
    background: none;
    color: white;
    border: 0;
    background-color:#bcbcbc;
    border-radius: 10px;
    cursor: pointer;
}

#applyOff, #inq{
	font-size: 14px;
    background: none;
    color: white;
    border: 0;
    background-color:#66a4a6;
    border-radius: 4px;
    cursor: pointer;
}
#applyOff:hover{
background-color: #87cacc;
}
#inq:hover{
background-color: #87cacc;
}
  
</style>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/off.css">
</head>
<body>
<script>
	//휴가일수 자동계산 스크립트
	function dateresult(){
		var start = $("input[name=offStart]").val();
		var end = $("input[name=offEnd]").val();
		
		const date1 = new Date(end);
		const date2 = new Date(start);
		  
		const diffDate = date1.getTime() - date2.getTime();
		  
		const dateDays = Math.abs(diffDate / (1000 * 3600 * 24));
		  
		console.log(dateDays);
		$("input[name=offDays]").val(dateDays+1);
	}


</script>
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
		                
		                <i class="xi-cafe"></i>&nbsp;
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
						<c:if test="${loginUser.rankNo ge '5' }">
		                <div class="sub-menu">
							&nbsp;
							<a href="approval.of" class="">휴가신청승인</a>
							<br>
						</div>
						</c:if>
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
	        <div id="commute-title">
                <span class="commute_title_text">휴가 신청/조회</span>
                <hr>
	        </div>
	            <div id="commute-main">
	                <form action="insert.of" method="post" onsubmit='return insert()' name="insert">
			        	<input type="hidden" value="${loginUser.memberNo }" name="offWriter">
			            	<div id="date">
					          &nbsp;&nbsp;&nbsp;기간선택&nbsp; <input type="date" name = "offStart" onchange="dateresult();" required> - <input type="date" name = "offEnd" onchange="dateresult();"required> <br><br>
				            </div>
				              &nbsp;&nbsp;&nbsp;휴가일수&nbsp; <input type="number" name="offDays" id="days-t" readonly>   <br><br>  
				        &nbsp;&nbsp; &nbsp;&nbsp;사유&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					        <input type="text-area" name="offReason" placeholder="20자 이하" id="reason-t" required>  &nbsp;
				            <input type="submit" name="신청" value="신청" id="applyOff">
					<hr>
	                </form>
	            </div>
           
            <div id="result-area">
            	<form action="searchList.of" method="post">
            	<input type="hidden" value="${loginUser.memberNo }" name="offWriter"> 
              	&nbsp;&nbsp; 기간조회 &nbsp; <input type="date" name = "offStart" required> - <input type="date" name = "offEnd" required> 
              	&nbsp;<input type="submit" name="조회" value="조회" id="inq">
            	</form>
				<hr>
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
						  					<td><input type="button" value="대기" id="wait" class="button disabled"></td>
						  				</c:when>
						  				<c:when test="${o.status eq 'Y'}">
						  					<td><input type="button" value="승인" id="check" class="button disabled"></td>
						  				</c:when>
						  				<c:otherwise>
						  					<td><input type="button" value="반려" id="non" class="button disabled"></td>
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