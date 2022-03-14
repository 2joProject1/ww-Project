<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
  <title>Document</title>

<style>


.wrap {
    width: 940px;
    margin: 0px auto;
    padding: 20px;
    
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
</style>
</head>
<body>
    
  <div class="wrap">

    <div>
        <div align="right">
            <button type="submit" class="btn btn-primary">메일쓰기</button>
            <button type="delete" class="btn btn-danger">삭제하기</button>
            
        </div>
    </div>
 
    <hr>

    <div>
    <table class="table table-striped">
        <thead>
          <tr>
            <th>보낸사람</th>
            <th>제목</th>
            <th>날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
          <tr>
            <td><input type="checkbox"> 가나다</td>
            <td>제목</td>
            <td>2022.03.08</td>
          </tr>
        </tbody>
      </table>

      <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a href="#" class="active">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        
        <a href="#">&raquo;</a>
      </div>
    </div>
  </div>
</body>
</html>