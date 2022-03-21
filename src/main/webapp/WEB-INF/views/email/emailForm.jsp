<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>



body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}


input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width: 940px;
  margin: 0px auto;
}

#title{
	
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
	        <br>

	        </div>
	      </div>
	
	      <div id="content-layout">
  
		    <div class="container">
			  <h3>메일</h3>
			   <br> <br>
			  <form action="${pageContext.request.contextPath}/mail/mailSending" method="post" action="upload" enctype="multipart/form-data">
			    <label>제목</label>&nbsp;&nbsp;
			    <input type="text" id="title" name="title" placeholder="제목..">
			
				<br>
			    <label>주소&nbsp;&nbsp;</label><button>주소록</button>
			    <input type="text" id="tomail" name="tomail" placeholder="메일주소..">&nbsp;
			    
			
				<br>
			    <label>첨부파일&nbsp;&nbsp;</label><input type="file" id="uploadfile" name="files" multiple placeholder="파일첨부">&nbsp;
			    
       			
			      
			      <br>
			
			    <label>내용</label>
			    <textarea id="content" name="content" placeholder="Write something.." style="height:200px"></textarea>
			 	<br>
			    <input type="submit" value="보내기">
			   
			  </form>
			</div>
			
			
<script>
	/*
	var files = [];
	var filecount = 0;
	$('[data-toggle="tooltip"]').tooltip();
	
	$('#uploadfile').change(function(event){
		files[filecount]=event.target.files[0];
		
		var printHTML = "<label>첨부파일("+(filecount+1)+")" + event.target.file[0].name + "</label><br>";
		
		$('#filelist').append(printHTML);
		
		filecount++;
	});
	
	$('btn-enroll').click(function(){
		var titletext = $('#title').val();
		var contenttext = $('#content').val();
		var arraycount = files.length;
		
		var formData = new FormData();
		
		formData.append("title", titletext);
		formData.append("content", contenttext);
		
		for(var i=0; i<arraycount; i++){
			formData.append("uploadfile["+i+"]", files[i]);
		}
		
		$.ajax({
			type : 'POST',
			url : 'http://localhost:8036'/controller/enrollajax,
			data : formData,
			processData : false,
			contentType : false,
			beforeSend : function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			},
			success : function(retVal) {
				alert('email success');
				
				$('#filelist').empty();
				filecount=0;
			},
			error : function(retVal, status, er) {
				alert("error: " + retVal + " status: "+status+" er:"+er);
			}
		});
	});
	*/		
</script>		
</div>
</body>
</html>