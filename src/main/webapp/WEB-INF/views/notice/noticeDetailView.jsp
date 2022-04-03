<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/header.css">
<style>
/*  여기부터복붙 */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: rgb(102, 164, 166);
}

input:focus + .slider {
  box-shadow: 0 0 1px rgb(102, 164, 166)
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}




/*  */
.notice{   
    margin-top: 30px;
    margin-left: 30px;
}
.notice_title{
  font-weight: bold;
  font-size: 30px;
/*   margin-bottom: 30px; */
  
}
.notice_content{
    padding-left: 30px;
    font-weight: bold;
  font-size: 20px;
  color: grey;
  border: 1px solid grey;
  width:1500[x]
  /* background-color:rgb(185, 207, 199) */
}
.notice_content input{
    width: 270px;
}
.notice_content textarea{
    resize:none
}
.notice_content table td{
    height: 40px;
}
.notice_content table input{
    width: 1000px;
}

.notice_submit_btn>button{
    border: none;
    width: 100px;
    height: 40px;
    margin-top: 30px;
    margin-bottom: 30px;
    text-decoration : none;
    
}
/* .notice_submit_btn>button>a{
    text-decoration : none;
    color:black;
} */
.atag{
    text-decoration : none;
    color:black;
}
.atag:hover{
	text-decoration : none;
    color:black;
}
.notice_submit_btn>button:first-child{
    margin-left: 450px;
    margin-right: 50px;
}
.notice_content textarea:focus{
    outline: none;
}
.td2{
	font-size:19px;
	font-weight:lighter;	
}
#back_btn a{
	text-decoration:none;
	color:black;
}
#back_btn{
	margin-left:500px;
	
}
</style>
</head>
<body>
<div id="header-layout">
	<jsp:include page="../common/header.jsp" />
</div>
<div id="container">
    <div id="sidebar-layout">
    	<div id="main-sidebar">
   	<jsp:include page="noticeSidebar.jsp" />
    	</div>
    </div>

    <div id="content-layout">
       <div class="notice">
           <div class="notice_title">
               <div class="d-flex">
                   <div class="p-2">
                       	공지사항
                   </div>
               </div>
           </div>
           
           
           <div class="notice_content">
               <form action="updateForm.no" method="post">
               		<input type="hidden" id="boardWriter" name="boardWriter" value="${ rn.boardWriter }">
                   <table>
                   <tr>
                   &nbsp;
                   </tr>
                   <tr>
                       <td style="width: 100px;">공지대상</td>
                       <td class="td2">${ rn.noticeRange }</td>
                       <td style="width: 60px;">분류</td>
	                   <td class="td2">${ rn.noticeCategory }</td>
                   </tr>
                   <tr>
                       <td>제목</td>
                       <td colspan="3" class="td2" name="boardTitle" value=""> ${ rn.boardTitle }</td>
                   </tr>
                   <tr>
                       <td>작성자</td>
                       <td colspan="3" class="td2" name="memberName">${ rn.memberName }</td>
                   </tr>
                   <tr>
                       <td>기간</td>
                       <td colspan="3" class="td2" name="noticePeriod"> ${ rn.noticePeriod }</td>
                   </tr>
                   <tr>
                       <td>내용</td>
                       <td colspan="3" class="td2">
                       		<textarea name="boardContent" id="" cols="100" rows="10" readonly>${ rn.boardContent }</textarea>
                       </td>
                   </tr>
                   <tr>
                       <td>첨부파일</td>
                       <td colspan="3" class="td2" name="fileName">

							<c:if test="${ not empty file }">         
								              	
								<c:forEach var="n" items="${ file }">
									<a href="${n.filePath }${ n.fileName }" class="atag" style="color:gray">${n.fileOriginName }</a>
									
								</c:forEach>
		                  	</c:if>
		                  	
		                  	

                       </td>
                   </tr>
               </table>
               
               <!-- 로그인세션 작성자랑 이거 작성자랑 일치하는지 -->
				<c:if test="${ loginUser.memberNo == rn.boardWriter }">            
                   <div class="notice_submit_btn">
                       <button type="button" id="update_btn">수정</button>
                       <button type="button" id="delete_btn">삭제</button>
                   </div>
				</c:if>
				<c:if test="${ loginUser.memberNo != rn.boardWriter }">            
                   <div class="notice_submit_btn">
                       <button type="button" id="back_btn"><a href="notice.no" class="atag backbtn">돌아가기</a></button>
                   </div>
				</c:if>
               </form>
           </div>
       </div>
    </div>
</div>

<script>
$(function(){
	$("#delete_btn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			window.location = 'delete.no?bno='+${rn.boardNo}+'&&mno='+$('#boardWriter').val();	

		}
	})

	
	$("#update_btn").click(function(){
		if(confirm("수정하시겠습니까?")){
			window.location = 'updateForm.no?bno='+${rn.boardNo}+'&&mno='+$('#boardWriter').val();			
		}
	})
		
})


</script>
</body>
</html>