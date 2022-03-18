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

input[type=text], textarea {
	
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
			  <form action="send"  method="post">
			    <label for="fname">제목</label>&nbsp;&nbsp;
			    <input type="text" id="subject" name="subject" placeholder="제목..">
			
				<br>
			    <label for="lname">주소&nbsp;&nbsp;</label><button>주소록</button>
			    <input type="text" id="receiver" name="receiver" placeholder="메일주소..">&nbsp;
			    
			
				<br>
			    	파일&nbsp;&nbsp;<button>파일찾기</button><input type="text" placeholder="파일첨부">&nbsp;
			    
					
			       
			      
			      <br>
			
			    <label for="subject">내용</label>
			    <textarea id="content" name="content" placeholder="Write something.." style="height:200px"></textarea>
			 	<br>
			    <input type="submit" value="보내기">
			   
			  </form>
			</div>
</div>
</body>
</html>