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
</head>
<body>
        <div id="header-layout">
        	<jsp:include page="header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        		<br>
		            <div id="sidebar-area">
		                <i class="fi fi-sr-at"></i>&nbsp;
		                <a href=""><b>Mail</b></a>
		                <br>
		                
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rr-envelope side_subtitle"></i>&nbsp;
		                <a href="email.form" class="side_subtitle side_subtitle">메일</a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-br-check side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle">읽지않음</a>
		                <br><br>
		
		                <i class="fi fi-rr-time-check"></i>&nbsp;
		                <a href=""><b>근태관리</b></a>
		                <br><br>
		                
		                <i class="fi fi-rs-chart-tree"></i>&nbsp;
		                <a href="chart.li"><b>조직도</b></a>
		                <br><br>
		                
		                <i class="fi fi-rr-edit"></i>&nbsp;
		                <a href="signoffs.docu"><b>전자결재</b></a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rs-inbox side_subtitle"></i>&nbsp;
		                <a href="docubox.draft" class="side_subtitle">기안문서함</a>
		                <br><br>
		                
		                <i class="fi fi-rs-calendar"></i>&nbsp;
		                <a href="project.main"><b>프로젝트</b></a>
		                <br><br>
		                
		                <i class="fi fi-rs-following"></i>
		                <a href=""><b>커뮤니티</b></a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rr-heart side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle">내 게시글</a>
		                <br><br>
		                
		                <i class="fi fi-rr-megaphone"></i>&nbsp;
		                <a href="notice.no"><b>공지사항</b></a><br><br>
		            </div>
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div id="myproject-area">
                <span class="main_title_text">내 프로젝트</span><br><br>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div><br>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div>
                <div class="main_pj_div"></div>
            </div>

            <div id="commute-area">
              <!-- <span class="main_title_text">출퇴근</span> -->
              
              <button>출근</button>
              <button>퇴근</button>
            </div>

            <div id="comming-sc-area">
              <span class="main_title_text">다가오는 일정</span>
              <ul>
                <li>Lorem</li>
                <li>Ipsum</li>
                <li>Dolor</li>
             </ul>
            </div>
            <div id="notice-area">
                <span class="main_title_text">공지사항</span>
                <br><br>
                <table border="1">
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                        
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>
                    <tr>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzz</td>
                        <td>zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz</td>
                    </tr>

                </table>
            </div>
            <div id="todolist-area">
                <span class="main_title_text">TODOLIST</span>
                <ul>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>
                  <li><input type="checkbox" name="" id=""> Lorem</li>

                </ul>
            </div>
	        </div>
	    </div>
</body>
</html>