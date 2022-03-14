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
</style>
</head>
<body>

  
  <div class="container">
  <h3>메일</h3>
  <form action="/action_page.php">
    <label for="fname">제목</label>
    <input type="text" id="fname" name="firstname" placeholder="제목..">

    <label for="lname">주소&nbsp;&nbsp;&nbsp;<button>주소록</button></label>
    <input type="text" id="lname" name="lastname" placeholder="메일주소..">

    <input type="text" placeholder="파일첨부">
    <div class="upload-btn_wrap">
        <button type="button" title="파일찾기">
         <span>파일찾기</span>  
        </button>
       
      </div>
      <br>

    <label for="subject">내용</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="보내기">
  </form>
</div>

</body>
</html>