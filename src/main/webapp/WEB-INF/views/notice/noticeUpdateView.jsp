<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            공지사항 수정
                            <hr>
                        </div>
                    </div>
                </div>
                
                
                <div class="notice_content">
                    <form action="">
                        <table>
                            <tr>
                                <td style="width: 100px;">공지대상</td>
                                <td>
                                    <select name="" id="">
                                        <option value="">전직원</option>
                                        <option value="">개발팀</option>
                                        <option value="">총무팀</option>
                                    </select>
                                </td>
                                <td style="width: 60px;">분류</td>
                                <td>                        
                                    <select name="" id="">
                                    <option value="">소식</option>
                                    <option value="">이벤트</option>
                                    <option value="">채용</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td  colspan="3"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>기간</td>
                                <td  colspan="3"><input type="text"></td>
                            </tr>
                            <tr>
                                <td>상단공지</td>
                                <td  colspan="3">
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td colspan="3">
                                    <textarea name="" id="" cols="100" rows="10"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>파일첨부</td>
                                <td  colspan="3"></td>
                            </tr>
                        </table>
                        <div class="notice_submit_btn">
                            <button>등록</button>
                            <button>취소</button>
                        </div>
                    </form>
                </div>
            </div>
	        </div>
	    </div>
</body>
</html>