<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>


<style>
.wrap>div {
            width: 100%;
}

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



.wrap {
    width: 940px;
    margin: 0px auto;
    padding: 20px;
    
}

#content_side {
   
    float: left;
    border: 1px solid #ddd;
    width: 260px;
    padding: 20px;
}

#content_chart {
    
    float: right;
    border: 1px solid #ddd;
    width: 620px;
    padding: 20px;
    
}

.search {
    
    border: 1px solid #ddd;
    width: 260px;
    padding: 20px;

   
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
</style>
</head>
<body>

<div class="wrap">
    <br><br>
        <div class="chartTitle">조직도</div>
        <br><br>
            
                <div id="content_side">

                    <input type="text" name="keyword" id="keyword">
                    <br><br>
                    <div>
                        <ul>
                            <li>부서
                                <br><br>
                                <ul>
                                    <li>개발팀</li>
                                    <br>
                                    <li>기획팀</li>
                                    <br>
                                    <li>마케팅팀</li>
                                    <br>
                                    <li>영업팀</li>
                                    <br>
                                    <li>미배치</li>
                                </ul>
                            </li>    
                        </ul>
                    </div>
                    
                    <br><br><br><br><br><br><br><br><br>
                    <div>
                        <i class="fi fi-rr-Bulb">12</i>
                        <i class="fi fi-rr-Trash">12</i>
                    </div>
                </div>
                <div id="content_chart">
                    <div style="font-size: 25px;">개발팀</div>
                    <div align="right"><button class="btn btn-secondary">수정</button>&nbsp;&nbsp;<button class="btn btn-secondary">확인</button></div>
                    <br><br>
                    <table id="chartList">
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
                            <tr>
                                <td><input type="checkbox">123</td>
                                <td><button type="button" class="" data-toggle="modal" data-target="#myModal">
                                   		 가나다
                                  </button></td>
                                <td>사원</td>
                                <td>123@123.com</td>
                                <td>Y</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox">123</td>
                                <td>가나다</td>
                                <td>사원</td>
                                <td>123@123.com</td>
                                <td>Y</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox">123</td>
                                <td>가나다</td>
                                <td>사원</td>
                                <td>123@123.com</td>
                                <td>Y</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox">123</td>
                                <td>가나다</td>
                                <td>사원</td>
                                <td>123@123.com</td>
                                <td>Y</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox">123</td>
                                <td>가나다</td>
                                <td>사원</td>
                                <td>123@123.com</td>
                                <td>Y</td>
                            </tr>
                        </tbody>

                    </table>
                    <br>

                    <div class="pagination">
                        <a href="#">&laquo;</a>
                        <a href="#">1</a>
                        <a href="#" class="active">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        
                        <a href="#">&raquo;</a>
                    </div>

                      <br><br>
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


</body>
</html>