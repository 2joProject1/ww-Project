<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 메인</title>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/commute.css">
</head>
<body>
        <div id="header-layout">
        	<jsp:include page="../common/header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        		<br>
		            <ul id="sidebar-ul">
		                <i class="fi fi-sr-at"></i>&nbsp;
		                <a href=""><b>Mail</b></a>
		                <br>
		                
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rr-envelope side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle side_subtitle">메일</a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-br-check side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle">읽지않음</a>
		                <br><br>
		
		                <i class="fi fi-rr-time-check"></i>&nbsp;
		                <a href=""><b>근태관리</b></a>
		                <br><br>
		                
		                <i class="fi fi-rs-chart-tree"></i>&nbsp;
		                <a href=""><b>조직도</b></a>
		                <br><br>
		                
		                <i class="fi fi-rr-edit"></i>&nbsp;
		                <a href=""><b>전자결재</b></a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rs-inbox side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle">기안문서함</a>
		                <br><br>
		                
		                <i class="fi fi-rs-calendar"></i>&nbsp;
		                <a href=""><b>프로젝트</b></a>
		                <br><br>
		                
		                <i class="fi fi-rs-following"></i>
		                <a href=""><b>커뮤니티</b></a>
		                <br>
		                &nbsp;&nbsp;&nbsp;<i class="fi fi-rr-heart side_subtitle"></i>&nbsp;
		                <a href="" class="side_subtitle">내 게시글</a>
		                <br><br>
		                
		                <i class="fi fi-rr-megaphone"></i>&nbsp;
		                <a href=""><b>공지사항</b></a><br><br>
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div id="commute-main">
                <span class="commute_title_text">출퇴근 관리</span><br><br>
              
            </div>

       
           
            <div id="result-area">
              기간선택  <input type="date" name = "date"> - <input type="date" name = "date"> 
              <button>조회</button> <br><br>
                <span class="commute_title_text">조회결과</span>
                
                <br><br>
                <table id="result">
		  <tr>
		    <th>날짜</th>
		    <th>출근시각</th>
		    <th>퇴근시각</th>
		    <th>근무상태</th>
		  </tr>
		  <tr>
		    <td>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>Berglunds snabbköp</td>
		    <td>Christina Berglund</td>
		    <td>Sweden</td>
		    <td>Sweden</td>
		  </tr>
		  <tr>
		    <td>Centro comercial Moctezuma</td>
		    <td>Francisco Chang</td>
		    <td>Mexico</td>
		    <td>Mexico</td>
		  </tr>
		  <tr>
		    <td>Ernst Handel</td>
		    <td>Roland Mendel</td>
		    <td>Austria</td>
		    <td>Austria</td>
		  </tr>
		  <tr>
		    <td>Island Trading</td>
		    <td>Helen Bennett</td>
		    <td>UK</td>
		    <td>UK</td>
		  </tr>
		  <tr>
		    <td>Königlich Essen</td>
		    <td>Philip Cramer</td>
		    <td>Germany</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>Laughing Bacchus Winecellars</td>
		    <td>Yoshi Tannamuri</td>
		    <td>Canada</td>
		    <td>Canada</td>
		  </tr>
		  <tr>
		    <td>Magazzini Alimentari Riuniti</td>
		    <td>Giovanni Rovelli</td>
		    <td>Italy</td>
		    <td>Italy</td>
		  </tr>
		  <tr>
		    <td>North/South</td>
		    <td>Simon Crowther</td>
		    <td>UK</td>
		    <td>UK</td>
		  </tr>
		  <tr>
		    <td>Paris spécialités</td>
		    <td>Paris spécialités</td>
		    <td>Marie Bertrand</td>
		    <td>France</td>
		  </tr>
		</table>
            </div>
            
	        </div>
	    </div>
</body>
</html>