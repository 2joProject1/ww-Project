<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://malsup.github.com/min/jquery.form.min.js"></script>	
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

#title {
    width: 100%;
    height: 35px;
    display: inline-block;
    font-size: 20px;
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

							   
			  <form action="${pageContext.request.contextPath}/mail/mailSending" method="post">
			    <label>제목&nbsp;&nbsp;</label>
			    <input type="text" id="title" name="title" placeholder="제목.." style="height:30px;">
			
				<br>
			    <label>주소&nbsp;&nbsp;</label><br>
			    <input type="text" id="tomail" name="tomail" placeholder="메일주소.." style="height:30px;">&nbsp;
			
			    <br>
			
			    <label>내용</label>
			    <textarea id="content" name="content" placeholder="Write something.." style="height:200px"></textarea>
			 	<br>
				    <label>첨부파일&nbsp;&nbsp;</label><input type="file" class="btn btn-default form-join" id="uploadfile" multiple="multiple">&nbsp;
			    <br><br>
			    <div id="filelist">
			    </div>
			    <button type="button" class="btn btn-primary" id="btn-enroll">등록</button>
			    <br><br>
			    <input type="submit" value="보내기">
			   
			    </form>
			
			  
			  <br>
			  
			</div>
</div>
</div>			
			
<script>
/*
var index = 0;

$(document).ready(function () {
	$('body').on('click', '.x-btn', function () {
		$(this).parent().remove();
		var fileIndex = $(this).attr('data-file-index');
		$('#file_' + fileIndex).remove();
	})

});

function attachFile() {
	if($('#fileList').children().length === 3) {
		alert("첨부파일은 3개까지 가능합니다.");
		return;
	}
	
	//"파일"타입 생성하고 리스트에 추가
	var createFile = document.createElement("input");
	createFile.id = "file_" + index;
	createFile.name= 'attachment';
	createFile.type = "file";
	createFile.style.display = "none";
	
	//리스트에 추가 형식
	createFile.onchange = function() {
		var html = '<li>' + this.files[0].name + '<button type="button" class="x-btn" data-file-index="'+index+'">X</button></li>'
		$('#fileList').append(html);
	};

	document.getElementById('enrollForm').appendChild(createFile);
	createFile.click(); //첨부클릭할때마다
	index++; //data-file-index 값 하나씩 올리기
}
*/
//$(document).ready(function () {	
	var files = [];
	var filecount = 0;
	$('[data-toggle="tooltip"]').tooltip();
	
	$('#uploadfile').change(function(event){
		files[filecount]=event.target.files[0];
		
		var printHTML = "<label>첨부파일("+(filecount+1)+") " + event.target.file[0].name + "</label><br>";
		
		$('#filelist').append(printHTML);
		
		filecount++;
	});
	
	$('#btn-enroll').click(function(){
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
			url : "enrollajax",
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
				alert("error: " +retVal+" status: "+status+" er:"+er);
			}
		});
	});
//});	
</script>		

</body>
</html>