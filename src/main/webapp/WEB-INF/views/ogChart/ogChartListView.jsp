<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>



<style>


table {
  border-collapse: collapse;
  width: 100%;
  
}

tr {
  border-bottom: 1px solid #ddd;
}

th,td {
    padding: 15px;
}

.chartTitle {
    border-bottom: 1px solid #ddd;
    font-size: 30px;
}



#content-layout {

    width: 1000px;
    margin: 0px auto;
    padding: 20px;
    box-sizing: border-box;
    position: relative;
    padding : 40px 0 40px 40px;
    height: 950px;

}

#content_side {
   
    float: left;
    border: 1px solid #ddd;
    width: 400px;
    padding: 20px;
    position: absolute;
    box-sizing: border-box;
    top: 190px;
    width: 200px;
    height: 569px;
    	
}

#content_chart {
    
    float: right;
    border: 1px solid #ddd;
    width: 850px;
    padding: 20px;
    box-sizing: border-box;
    position: absolute;
    left: 160px;
    padding: 15px 15px 0 15px;
    height: 570px;
    margin-top: 44px;
    
}

.search {
  
 
    

}

ul {
    list-style:none;
}

.pagination {
  display: block;
  text-align: center;
  
}

.pagination a {
  color: black;
  float: none;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination > li > a {
    float: none;
}

#chartList{text-align:center;}




.toggle-switch input[type=checkbox]{
  display: none;
}

.toggle-track{
  display: inline-block;
  position: relative;
  width: 60px;
  height: 25px;
  border-radius:60px;
  background: #8b8b8b;
}
.toggle-track:before{
  content:'';
  display: block;
  position: absolute;
  top: -8px;
  left: -15px;
  width: 30px;
  height: 30px; 
  margin: 5px;
  background: #fff;
  border-radius:100%;
  border:1px solid #8b8b8b;
  transition:left 0.3s;
}
.toggle-switch input[type=checkbox] + label .toggle-track:after{
  content:'OFF';
  display: inline-block;
  position: absolute;
  right: 8px;
  color: #fff;
}

.toggle-switch input[type=checkbox]:checked + label .toggle-track{
  background: #e51836;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:before{
  left: 30px;
  border:1px solid #e51737;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:after{
  content:'ON';
  left: 5px;
}
.goDept{
    	display : none;
    	width : 25px;
    	height : 25px;
    	box-sizing: border-box;
    	background-color : #e7e7e7; 
    	border: none;
    }
    .pickDept{
    	display : none;
    	margin-right : 10px;
   		width : 30px;
   		height : 23px;
   		vertical-align : middle;
   		margin-right : 10px;
   		padding :0;
   		font-size : 11px;
   		background-color : #5A3673;
   		color : white;
   		border : none;
   		border-radius:3px;
    	
    }
    .move_wrap{
        width: 710px;
        height: 50px;
        line-height: 52px;
    }
        .deptSelect{		
    	width : 100px;
    	height : 30px;   
    	border : 1px solid #a2a2a2; 
    	border-radius : 3px;
    	 box-sizing: border-box; 	
    	 margin-right : 5px;
    }
</style>

<script>
    	//부서 추가 알림
	    var result1='${message}';
		console.log(result1);
		if(result1 == "success") {
	        alert("부서가 추가되었습니다.");
	    }
		
		//부서 삭제 알림
		var result2='${message2}';
		console.log(result2);
		if(result2 == "success") {
	        alert("부서가 삭제되었습니다.");
	    } else if(result2 == "failed"){
	    	alert("사원이 존재하는 부서는 삭제하실 수 없습니다.");
	    }
		
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function() {
        	/*
	        $('.sidenav li.menu>a').on('click', function(){
			$(this).removeAttr('href');
			var element = $(this).parent('li');
			if (element.hasClass('open')) {
				element.removeClass('open');
				element.find('li').removeClass('open');
	            element.find('ul').slideUp();
			}
			else {
				element.addClass('open');
				element.children('ul').slideDown();
				element.siblings('li').children('ul').slideUp();
				element.siblings('li').removeClass('open');
				element.siblings('li').find('li').removeClass('open');
	            element.siblings('li').find('ul').slideUp();
			}
		 });
        	*/
	    	//부서 검색
	        $("#keyword").keyup(function() {
                var k = $(this).val();
                $(".parent_a").hide();
                var temp = $(".parent_a:contains('" + k + "')");
                $(temp).show();
            })
            /* //부서 리스트
       		$(".dname${e.count}").click(function() {
				var frm = document.listDept_frm;
				frm.action = "${pageContext.request.contextPath}deptlist"
				frm.method = "post"
				frm.submit();
			}); */
	        
            //부서 추가        
            $("#addBtn").click(function() {
                $("#adddeptName").css("display", "block");
                $(".goDept").css("display", "block");   
            })
            $("#adddeptName").keydown(function(key) {
				if (key.keyCode == 13) {
					var frm = document.dept_add_frm;
					frm.action = "${pageContext.request.contextPath}/ogChart/addDept"
					frm.method = "get"
					frm.submit();
				}
			});
            
            //부서 삭제
            $("#deleteBtn").click(function() {
            	$(".pickDept").css("display", "inline-block");
				/* var frm = document.dept_frm;
				frm.action = "${pageContext.request.contextPath}/ogChart/deptdel"
				frm.method = "get"
				frm.submit(); */
			});
        });
    </script>
</head>
<body>
	<div id="header-layout">
    	<jsp:include page="../common/header.jsp" />

    </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        	<br>
               		 
               		 	<form action="deptlist" method="get">
							<div class="search">
		                    	<input type="text" name="keyword" id="keyword" autocomplete="off"><i class="fi fi-rr-Search"></i>
		                    </div>
	                    </form>
	                    <br><br>
	                    <div>부서
	                        <ul>
	                        <br>
		                        <c:forEach var="dp" items="${selectDept}" varStatus="e">
			                        <li class="parent_a">
				                        <form name="listDept_frm" id="listDept_frm_${dp.deptNo}" action="${pageContext.request.contextPath}/ogChart/deptdel" method="post">
			                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<input type ="hidden" value="${dp.deptName}" name="deptName" class="deptName">
					                        <input type ="hidden" value="${dp.deptNo}" name="deptNo" class="deptNo">
				                        </form>
				                    <button type ="button"name="pickDept" onclick="goList('${dp.deptNo}');" 
				                        class="pickDept pickDept${e.count}" id="dept${e.count}">삭제</button>
			                        <a href="${pageContext.request.contextPath}/ogChart/deptlist?deptName=${dp.deptName}">
			                        ${dp.deptName}
			                        <input type ="hidden" value="${dp.deptNo}" name="deptNo" class="deptNo">
			                        </a>
			                        </li>
		                    
		                        </c:forEach>
	                             <script>
			                        function goList(deptNo){
			                        	var frmId = "#listDept_frm_"+deptNo;
			                        	console.log("frmId:" + frmId);
			                        	$(frmId).submit();
			                        }
		                        </script>   
	                        </ul>
	                    
                    
                    
	                    <div style="position:absolute;bottom:5%">
	                        <sec:authorize access="hasRole('ROLE_ADMIN')">
			                    <button id="addBtn"><img src="${pageContext.request.contextPath}/resources/images/add.png" style="width: 19px; height: 20px;"></button>
			                    <button id="deleteBtn"><img src="${pageContext.request.contextPath}/resources/images/trash (1).png" style="width: 19px; height: 20px;"></button>
			                </sec:authorize>
	                    </div>
                	</div>

	        	</div>
	        </div>
	
	        <div id="content-layout">
				
			    <br><br>
			        <div class="chartTitle">조직도</div>
			        <br><br>
            
	                <div id="content_chart">
	                    <div style="font-size: 25px;">${dname}</div>
	                    <span id="detpcount">총&nbsp;<span>${memberlistCount}</span>명</span>
	                    <div align="right"><button class="btn btn-secondary">수정</button>&nbsp;&nbsp;<button class="btn btn-secondary">확인</button></div>
	                    <br><br>
	                    
	                    <form class="change_frm" name="change_frm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div>
                        <table>
                            <tr>
                            	<th style="width : 50px;">
                            	<sec:authorize access="hasRole('ROLE_ADMIN')">
                                	선택
                                </sec:authorize>
                                </th>
                                <th style="width : 100px;">사원번호</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>이메일</th>
                                <th>재직상태</th>
                            </tr>
                            

                        <c:if test="${not empty list}">
						<c:forEach var="og" items="${list}" varStatus="status">
						
                            <tr><td style="width : 50px;">
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <input type="checkbox" name="chk" value="${og.memberNo}" class="chkbox">
                            </sec:authorize>
                            </td>
                                <td style="width : 100px;">${og.memberNo}</td>
                                <td>${og.memberName}</td>
                                <td>${og.rankName}</td>
                                <td>${og.email}</td>
                                <td>${og.status}</td>
                            </tr>
                        
                        </c:forEach>
                       	</c:if>
                       	
                       	<tr>
						<td colspan="5">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="oglistprev" value="deptlist">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${dflistprev}">&lt; &nbsp;</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color ="#da0f8e"><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="oglistchk" value="deptlist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${dflistchk}">${p}&nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}"> &gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="oglistnext" value="deptlist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${dflistnext}">&gt;</a>
							</c:if>
							</td>
					</tr>
                       	</table> 
                      </div>
                      
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="move_wrap">
                        <select name="deptSelect" class="deptSelect">  
	                        <c:forEach var="dp" items="${selectDept}" varStatus="e">
								    <option value="${dp.deptNo}">${dp.deptName}</option>  
							</c:forEach>
						</select>  
                        
                        <button id="moveBtn" onclick="changeDept();">다른 조직으로 이동</button>
                    </div> 
                    </sec:authorize>
                      
                      </form>
	                    <!--  
	                    <table id="chartList" style=font-size:14px;>
	                        <thead>
	                            <tr>
	                                <th>사원번호</th>
	                                <th>이름</th>
	                                <th>직급</th>
	                                <th>이메일</th>
	                                <th>재직상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="list" items="${ list }">
	                            <tr>
	                                <td><input type="checkbox">${ list.memberNo }</td>
	                                <td>${ list.memberName }</td>
	                                <td>${ list.rankNo }</td>
	                                <td>${ list.email }</td>
	                                <td>${ list.status }</td>
	                            </tr>
	                            </c:forEach>
	                        </tbody>
	
	                    </table>
	                    -->
	                    <br>
	
	<!--  
	                    <div class="pagination justify-content-center">
	                        <a href="#">&laquo;</a>
	                        <a href="#">1</a>
	                        <a href="#" class="active">2</a>
	                        <a href="#">3</a>
	                        <a href="#">4</a>
	                        <a href="#">5</a>
	                        
	                        <a href="#">&raquo;</a>
	                    </div>
	
	

						
	                      <br>
	                      /*
	                      <div align="right">
	                          <select name="" id="">
	                                <option value="">개발팀</option>
	                                <option value="">기획팀</option>
	                                <option value="">마케팅팀</option>
	                                <option value="">영업팀</option>
	                                <option value="">미배치</option>
	                          </select>
	                          <button type="submit" class="btn btn-secondary">다른 부서로 이동</button>
	                      </div>
	                                
	                    
	                </div>
-->
                
                  
                  <!-- The Modal -->
                  <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                  
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">사원정보</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                  
                        <!-- Modal body -->
                        <div class="modal-body">
				                            사번 : <br>
				                            이름 : <br>
				                            이메일 : <br>
				                            휴대폰번호 : <br>
				                            부서명 : <br>
				                            직급 : <br>
				                            내선번호 : <br>
                            <hr>
                            	권한 <div class="toggle-switch">
	                                <input type="checkbox" id="chkTog">
	                                <label for="chkTog">
	                                  <span class="toggle-track"></span>
	                                </label>
                              		</div>

                        </div>
                  
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                  
                      </div>
                    </div>
                  </div>
                
  			


	    	</div>
	    </div>
	    
	    <script>
/*	    
function checkOneS(a){
    console.log("###checkOneS");
    console.log("###this: " +  a);
    var obj1 = document.getElementsByClassName('deptNamechk');
    console.log("###obj1.length: " +  obj1.length);
    for (var i = 0; i < obj1.length; i++) {
       console.log("###obj1[i]: " +  obj1[i]);
       if (obj1[i] != a) {
          obj1[i].checked = false;
       }
    }
 }
 */
 
 function changeDept(){
	 var frm = document.change_frm;
		frm.action = "${pageContext.request.contextPath}/ogChart/organuserupdate"
		frm.method = "post"
		frm.submit();
 }
 
</script>
    
</body>
</html>