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
<title>휴가신청 승인</title>
<style>
#result {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 93%;
  margin-left:3%;
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
  	margin-left: 2%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #result-area{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 2%;
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
  	margin-left:12%;
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
.yes-btn, .no-btn{
	background-color:#white;
	border:1px solid black;
}
.yes-btn:hover, .no-btn:hover{
	background-color:#bcbcbc;
}

.pager_area{
	margin-left: 40%
}
  .sub-menu{
  	font-size: 17px;
  	margin-left:12%;
  	font-family: 'Nanum Gothic', sans-serif;
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
	               <span class="commute_title_text">휴가신청 승인</span>
                <hr>
	        </div>
            <div id="commute-main">
            	<form action="approval.of" method="get">
            		<input type="hidden" name="searchPage" value="2">
	                 &nbsp;&nbsp;기간 &nbsp; <input type="date" name = "offStart" required> - <input type="date" name = "offEnd" required>
	                <button class="check-btn" value="">조회</button>
            	</form>
	            <hr>
            </div>
           
            <div id="result-area">
	                <span class="commute_result_text">진행상태</span>
	                    <select name="status" onchange="changeSelect(this.value)">
				            <option value="st">선택</option>
				            <option value="승인">승인</option>
				            <option value="대기">대기</option>
				        </select>
                
                <br><br>
                <table id="result">
                <thead>
				  <tr>
				    <th width="150px">휴가신청일</th>
				    <th width="150px" id="hum">신청자</th>
				    <th>휴가기간</th>
				    <th width="300px">사유</th>
				    <th width="170px">승인여부</th>
				    <th width="100px">진행상태</th>
				  </tr>
                </thead>
                <tbody>
                	<c:forEach var="o" items="${ list }">
	                	<tr style="display:'';">
		                	<td>${o.requestDate}</td> 
		                	<td>${o.memberName}</td>
		                	<td>${o.offStart} ~ ${o.offEnd}</td>
		                	<td>${o.offReason}</td>
			                <td>
		                		<c:if test="${o.status eq 'W'}">
			                		<button class="yes-btn" value="${o.offNo}">승인</button> &nbsp;
			                		<button class="no-btn" value="${o.offNo}">반려</button>
		                		</c:if>
			                </td>
		                	<c:choose>
		                		<c:when test="${o.status eq 'W'}">
			                <td class="대기"><input type="button" value="대기" id="wait" class="button disabled"></td>
		                		</c:when>
		                		<c:when test="${o.status eq 'Y'}">
			                		<td class="승인"><input type="button" value="승인" id="check" class="button disabled"></td>
		                		</c:when>
		                		<c:otherwise>
		                			<td class="반려"><input type="button" value="반려" id="non" class="button disabled"></td>
		                		</c:otherwise>
		                	</c:choose>
	                	</tr>
                	</c:forEach>
                </tbody>
				  </table>
            </div>
            <br>
            <c:choose>
            	<c:when test="${searchPage == 1}">
            		<div class="pager_area" align="center">
			             <ul class="pagination"  >
			                   <c:choose>
			                    	<c:when test="${ pi.currentPage eq 1 }">
				                    	<li class="page-item disabled"><a class="page-link" href="approval.of">Previous</a></li>
			                    	</c:when>
			                    	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${ pi.currentPage -1 }">Previous</a></li>
			                    	</c:otherwise>
			                   </c:choose>
			                   
			                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${ p }">${ p }</a></li>
			                   </c:forEach>
			
			                   <c:choose>
			                    	<c:when test="${ pi.currentPage eq  pi.endPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#" >Previous</a></li>
			                    	</c:when>
			                    	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${ pi.currentPage +1 }">Next</a></li>
			                    	</c:otherwise>
			                   </c:choose>
			              
			             </ul>
			     	</div>
            	</c:when>
            	<c:otherwise>
            		<div class="pager_area" align="center">
			             <ul class="pagination"  >
			                   <c:choose>
			                    	<c:when test="${ pi.currentPage eq 1 }">
				                    	<li class="page-item disabled"><a class="page-link" href="approval.of?searchPage=2&offStart=${offStart }&offEnd=${offEnd}">Previous</a></li>
			                    	</c:when>
			                    	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${pi.currentPage -1 }&searchPage=2&offStart=${offStart }&offEnd=${offEnd}">Previous</a></li>
			                    	</c:otherwise>
			                   </c:choose>
			                   
			                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${ p }&searchPage=2&offStart=${offStart }&offEnd=${offEnd}">${ p }</a></li>
			                   </c:forEach>
			
			                   <c:choose>
			                    	<c:when test="${ pi.currentPage eq  pi.endPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#" >Previous</a></li>
			                    	</c:when>
			                    	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="approval.of?cpage=${ pi.currentPage +1 }&searchPage=2&offStart=${offStart }&offEnd=${offEnd}">Next</a></li>
			                    	</c:otherwise>
			                   </c:choose>
			              
			             </ul>
			     	</div>
            	</c:otherwise>
            </c:choose>
            
	        </div>
	        
	    </div>
	    
<script type="text/javascript">
	$(function(){
		$('.yes-btn').click(function(){
			var offNo = $(this).val();
			location.href="yesOrNo.of?status=Y&offNo="+offNo;
		})
		$('.no-btn').click(function(){
			var offNo = $(this).val();
			location.href="yesOrNo.of?status=N&offNo="+offNo;
		})
	})
	
	function changeSelect(e){
		
		$("#result").find("td").parent().css("display",'');
		
		if(e ==='st'){
		$("#result").find("td").parent().css("display",'');
		}else if(e ==='승인'){
		$("#result").find("td.대기").parent().css('display','none');
		$("#result").find("td.반려").parent().css('display','none');
		}else{
		$("#result").find("td.승인").parent().css('display','none');
		$("#result").find("td.반려").parent().css('display','none');
		}
		
		
		//if(e == "승인"){
		//	$("#result").find("td.승인")
		//}
		//var result = $("#result>tbody>tr").children.last().text();
		//console.log(result);
		//if(e == $("#result>tbody>tr").children.last().text()){
		//	$("#result>td").attr('style','display:none;')
					
		//}
	}
	
</script>    
</body>
</html>