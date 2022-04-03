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

  <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>


    <script type="text/javascript">
    var calendar = '';
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            	calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'KST',
            //  locale: "ko",
                initialView: 'dayGridMonth', 
                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                    {
                
                    }
                ], headerToolbar: {
                    center: 'addEventButton' // headerToolbar에 버튼을 추가
                }, customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "내 잔여휴가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기

                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                                var content = $("#calendar_content").val();
                                var start_date = $("#calendar_start_date").val();
                                var end_date = $("#calendar_end_date").val();
                                
                                //내용 입력 여부 확인
                                if(content == null || content == ""){
                                    alert("내용을 입력하세요.");
                                }else if(start_date == "" || end_date ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else{ // 정상적인 입력 시
                                    var obj = {
                                        "title" : content,
                                        "start" : start_date,
                                        "end" : end_date
                                    }//전송할 객체 생성

                                    console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                }
                            });
                        } 
                    }
                },
                editable: false, // false로 변경 시 draggable 작동 x 
                displayEventTime: false // 시간 표시 x
            });
            calendar.render();
        });
        
        
        
        $(function(){ 
        	
        	  $(".fc-addEventButton-button").click(function(){
        	    $(".modal2").fadeIn();
        	  });
        	  
        	  $(".modal_content2").click(function(){
        	    $(".modal2").fadeOut();
        	  });
        	  
        	});
    </script>
    <script>
    $(function(){
    	var rank = ${loginUser.rankNo}
    	console.log('rank:::'+rank);
    	if(rank >= 5){
    		$.ajax({
        		url : "adminSelectDto.of",
        		data : {deptNo : ${loginUser.deptNo} },
        		success : function(e){
        			for(var i=0; i< e.length;i++){
        			calendar.addEvent({
        				title:e[i].MEMBER_NAME,
        				start:e[i].OFF_START,
        				end:e[i].OFF_END
        				})
        			}
        			$('.fc-addEventButton-button').css("display","none");
        	    		
        		},
        		error : function(){
        			console.log("휴가신청인원 불러오기실패");
        		}
        	})
    	}else{
    		$.ajax({
        		url : "selectDto.of",
        		data : {memberNo : ${loginUser.deptNo} },
        		success : function(e){
        			var myOff = 0;
        			for(var i=0; i< e.length;i++){
        				if(e[i].OFF_WRITER == ${loginUser.memberNo}){
        					myOff = myOff + e[i].OFF_DAYS
        				}
        			calendar.addEvent({
        				title:e[i].MEMBER_NAME,
        				start:e[i].OFF_START,
        				end:e[i].OFF_END
        				})
        			}
        			console.log(e);
        			$('.myOff').text(myOff);
        		},
        		error : function(){
        			console.log("휴가신청인원 불러오기실패");
        		}
        	})
    	}
    	
    })
    
    
    </script>
    
<title>휴가현황</title>
<style type="text/css">

   #calendarBox{
            width: 80%;
            padding-left: 15%;
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
  	margin-left: 4%;
  	font-family: 'Nanum Gothic', sans-serif;
  }
  #calender-area{
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
    .sub-menu{
  	font-size: 17px;
  	margin-left: 12%;
  }
  
.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
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
  
  
  <!-- 모달창 -->
  .fc-addEventButton-button{
  position:absolute; top:50%; left:50%;
  width:120px; height:30px; margin-top:-15px; margin-left:-60px;
  line-height:15px; cursor:pointer;
}

.modal2{ 
  position:absolute; 
  width:100%; 
  height:100%; 
  background: rgba(0,0,0,0.5); 
  top:0; 
  left:0; 
  display:none;
  z-index:100;
}

.modal_content2{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:40px 0;
  line-height:23px; cursor:pointer;
}
  

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/off.css">
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
		                <br><br>
		                
		                <i class="xi-cafe"></i>&nbsp;
		                <a href="list.of"><b>휴가관리</b></a>
		                <br>
		                <div class="sub-menu">
							&nbsp;
							<a href="list.of" class="">휴가신청</a>
							<br>
						</div>
		                <div class="sub-menu">
							&nbsp;
							<a href="status.of" class="">휴가현황</a>
							<br>
						</div>
		                <c:if test="${loginUser.rankNo ge '5' }">
		                <div class="sub-menu">
							&nbsp;
							<a href="approval.of" class="">휴가신청승인</a>
							<br>
						</div>
						</c:if>
		            </ul>
	        	</div>
	        </div>
	
	        <div id="content-layout">
            <div id="commute-main">
                <span class="commute_title_text">휴가 현황</span><br>
            <hr>
            </div>

            <div id="calender-area">
				<br>
			                
   <div id="calendarBox">
        <div id="calendar"></div>
    </div>
    
    <!-- modal 추가 -->
   <div class="modal2">
		<div class="modal_content2" 
			title="클릭하면 창이 닫힙니다.">
			<br>
			- 내 휴가 확인 -<br>
			발생 휴가 : 20 <br> 
			사용 휴가 : <span class="myOff"></span> <br>
		</div>
	</div>

</body>
</html>