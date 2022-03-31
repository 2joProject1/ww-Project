<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 부트스트랩 -->
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-straight/css/uicons-bold-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    
     <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<title>근태관리 메인</title>
<style>
#result {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
  margin-left: 1%;
  font-family: 'Nanum Gothic', sans-serif;
}

#result td, #result th {
  border: 1px solid #ddd;
  padding: 8px;
  font-family: 'Nanum Gothic', sans-serif;
}

#result tr:nth-child(even){background-color: rgb(245, 248, 248);}

#result tr:hover {background-color: rgb(237, 241, 241);}

#result th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #66a4a6;
  color: white;
  font-family: 'Nanum Gothic', sans-serif;
}

#result td{
	text-align: center;
}
  .commute_title_text{
  	font-size: 30px;
  	font-weight: bold;
  	margin-left: 2%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  .commute_result_text{
  	font-size: 27px;
  	font-weight: bold;
  	margin-left: 2%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #result-area{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 2%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #commute-title{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #commute-main{
  	font-size: 15px;
  	font-weight: bold;
  	margin-left: 1%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  
  #reason-t{
   width:600px;
   height:50px;
   border-radius : 7px;
   border: 1px solid #bcbcbc;
  }
  #days-t{
  	width:70px;
    border-radius : 7px;
    border: 1px solid #bcbcbc;
  }
  .sub-menu{
  	font-size: 17px;
  	margin-left:12%;
  }
  
  .cal_top{
  	margin-right: 5%;
  }
  #cal_top_year, #cal_top_month{
  	font-size: 27px;
  }
  
  #movePrevMonth, #moveNextMonth {
  	color: black;
  	text-decoration: none; 
  	font-size: 15px;
  }
    .sub-menu{
  	font-size: 17px;
  	margin-left:12%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
</style>

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
					<i class="fi fi-rr-time-check"></i>&nbsp;
						<a href="main.cm"><b>근태관리</b></a>
					<br>
					<div class="sub-menu">
						&nbsp;
						<a href="main.cm" class="">출/퇴근조회</a>
						<br>
					</div>
					<div class="sub-menu">
						&nbsp;
						<a href="month.cm" class="">월 근무내역</a>
						<br><br>
					</div>
		               
		                <i class="xi-cafe"></i>&nbsp;
		                <a href="list.of"><b>휴가관리</b></a>
		                <br><br>
				</ul>
			</div>
		</div>
		<div id="content-layout">
			<div id="commute-main">
                <span class="commute_title_text">출/퇴근 조회</span><br>
                <hr>
            </div>
            <div id="result-area">
             
                <span class="commute_result_text">조회결과</span>
                <br><br>
				<div id="calender-area" align="center">
					<div class="cal_top">
						<a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"> &lt; PREV &nbsp;&nbsp;&nbsp;</span></a>
						<span id="cal_top_year"></span>
						<span id="cal_top_month"></span>
						<a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&nbsp;&nbsp;&nbsp; NEXT &gt;</span></a>
					</div>
					<br>
					<table id="result">
						<thead>
							<tr>
								<th width="270px">날짜</th>
								<th>출근시각</th>
								<th>퇴근시각</th>
								<th>근무상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${ list }"> 
								<tr>
									<td>${c.commuteDate}</td>
									<td>${c.commuteStart}</td>
									<td>${c.commuteEnd}</td>
									<c:choose>
										<c:when test="${c.workStatus eq 'Y'}"> 
											<td>정상출근</td>
										</c:when>
										<c:when test="${c.workStatus eq 'N'}">
											<td>지각</td>
										</c:when>
										<c:when test="${c.workStatus eq 'E'}">
											<td>조퇴</td>
										</c:when>
										<c:otherwise> 
											<td>근무태만</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
	        </div>
	    </div>
	</div>
	
<script type="text/javascript">
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        drawSche();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
  //  $('#month').change(function(){
   // 	location.href="asd./me?day=" + day;
   // })
    
    //Calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = ${year};
        month = ${month};
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        location.href = "main.cm?year=" + year + "&month=" + month;
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
       
        		
        location.href = "main.cm?commuteDate=" + year + "-" + month;
    }
    
    //정보갱신
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
        drawSche();
    }
    
    //2019-08-27 추가본
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2019":{
                "07":{
                    "17":"제헌절"
                }
                ,"08":{
                    "7":"칠석"
                    ,"15":"광복절"
                    ,"23":"처서"
                }
                ,"09":{
                    "13":"추석"
                    ,"23":"추분"
                }
            }
        }
    }
    
    //스케줄 그리기
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);
                }
            }
        }
    }
 
</script>
</body>
</html>