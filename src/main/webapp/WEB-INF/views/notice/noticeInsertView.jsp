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
 	
 	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
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
	  margin-bottom: 30px;
	  
	}
	.notice_content{
	    padding-left: 30px;
	    font-weight: bold;
	  font-size: 20px;
	  color: grey;
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
	}
	.notice_submit_btn>button:first-child{
	    margin-left: 450px;
	    margin-right: 50px;
	}
	#cancle_btn{
       text-decoration: none;
       color: black;
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
	        	사이드바에 들어갈 내용을 작성하세요
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div class="notice">
                <div class="notice_title">
                    <div class="d-flex">
                        <div class="p-2">
                            공지사항 작성
                            <hr>
                        </div>
                    </div>
                </div>
                
                
                <div class="notice_content">
                    <form action="insert.no" method="post" enctype="multipart/form-data" >
                    	<input type="hidden" name="boardWriter" value="${loginUser.memberNo}">
                    	<input type="hidden" name="memberName" value="${loginUser.memberName}">
                        <table>
                            <tr>
                                <td style="width: 100px;">공지대상</td>
                                <td>
                                    <select name="noticeRange" id="noticeRange">
                                        <option value="전직원">전직원</option>
                                        <option value="개발팀">기획팀</option>
                                        <option value="운영팀">운영팀</option>
                                        <option value="재무팀">재무팀</option>
                                        <option value="서비스팀">서비스팀</option>
                                        <option value="개발팀">개발팀</option>
                                        <option value="인사팀">인사팀</option>
                                    </select>
                                </td>
                               
                                
                                
                                <td style="width: 60px;">분류</td>
                                <td>                        
                                    <select name="noticeCategory" id="noticeCategory">
                                    <option value="소식">소식</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="채용">채용</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td colspan="3"><input type="text" name="boardTitle" required></td>
                            </tr>
                            <tr>
                                <td>기간</td>
                                <td  colspan="3"><input type="text" name="noticePeriod"></td>
                            </tr>
                            <tr>
                                <td>상단공지</td>
                                <td  colspan="3">
                                    <label class="switch">
                                        <input type="checkbox" name="topFix" value="N">
                                       
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td colspan="3">
                                    <textarea name="boardContent" id="" cols="100" rows="10"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>파일첨부</td>
	                                <td colspan="3"> <!-- 파일아이콘 나중에 맞추기 -->
		                                <label for="upfile" id="uplabel"><i class="xi-file-add-o"></i> </label>
		                                <span id="spanFile" name="spanFile" value="ㅋㅋ"></span>
		                               <!--  <input type="text" id="spanFile" name="spanFile" value="ㅋㅋ"> -->
	                                <td>
                                <div id="d_file">
            						</div>
                                </td>
                            </tr>
                        </table>
                        <div class="notice_submit_btn">
                            <button type="submit" id="btn">등록</button>
                            <button><a href="javascript:history.back();" style="text-decoration:none; color:black;">취소</a></button>
                        </div>
                    </form>
                </div>
            </div>
	        </div>
	    </div>
	    <input type="file" multiple="multiple"
	    id="upfile" class="form-control-file border"
	    name="upfile" onChange="onFileUpload(event)">
		                                
<script>

window.onload = $(function(){
	$('#upfile').hide();
	
})

function onFileUpload(event){
	    event.preventDefault();
	    
	    let file = event.target.files[0];
	    let file1 = event.target.files[1];
	    let file2 = event.target.files[2];
	    let file3 = event.target.files[3];
	    
	    let file4 =  event.target.files.length;
/* 	    console.log(file4+"45");
	    console.log(file);
	    
	    console.log(document.getElementById('upfile').files[0].name);
	    console.log(document.getElementById('upfile').files[1].name);
	    console.log(document.getElementById('upfile').files[2].name);  */
	    
	    console.log("길이"+event.target.files.length);
	    
	    $("upfile").text("event.target.files[0]");
	    
	    var a = "";
	    
	    for(var i = 0; i < event.target.files.length; i++){
	    	console.log(i+"ㅋㅋ");
	    }
	    for(var i = 0; i < event.target.files.length; i++){
	    	a += "파일"+(i+1)+" "+document.getElementById('upfile').files[i].name+" ";
	    }
	    console.log(a);
	    
	    if(event.target.files.length>3){
	    	alert("파일은 3개 이하만 업로드가 가능합니다.");
	    	$("#btn").attr("disabled", true);
	    } else{
	    	$("#btn").attr("disabled", false);
	    	console.log("됐냐");
	    
	    	$("#spanFile").val(a);
	    	$("#spanFile").text(a);
	    }     
}



</script>
</body>
</html>