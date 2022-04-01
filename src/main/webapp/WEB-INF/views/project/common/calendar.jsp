<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 메인</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function(){
        $('.btn-plan').click(function(){
            console.log('ㅎㅇ');
            $('.plan').show();
            $('.cal-type').val('1');
            $('.toDo').hide();
        });
        $('.btn-toDo').click(function(){
            $('.toDo').show();
            $('.cal-type').val('2');
            $('.plan').hide();
        });

    })

    var calFunc = {
        getFormValue :function(){

        }
    }

       document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                // locale: 'ko',
                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                    {
                        title:'일정',
                        start:'2022-03-30 00:00:00',
                        end:'2022-03-31 24:00:00' 
                        // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                    }
                ], headerToolbar: {
                    right: 'today prev,next',
                    left: 'addEventButton', // headerToolbar에 버튼을 추가
                    center: 'title'
                }, customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "일정 추가",  // 버튼 내용
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
                editable: true, // false로 변경 시 draggable 작동 x 
                displayEventTime: false // 시간 표시 x
            });
            calendar.render();
        });
</script>

<style>
    /* 캘린더 */
#calendarBox{
    width: 70%;
    padding-left: 15%;
}
/* ---------------- */
.project-title {
   padding: 15px;
   font-weight: 400;
   font-size: 24pt;
   margin-left: 10px;
   margin-bottom : 20px;
   
}

.project-list {
   width: 200px;
   height: 200px;
   display: inline-block;
   background-color: rgb(185, 207, 199);
   border-radius: 50px;
   margin-left: 10px;
   margin-bottom: 5px;
   text-align: center;
   text-decoration: none;
}

.project-list:hover {
   cursor: pointer;
   opacity: 0.7;
   border: 1px solid gray;
   text-decoration: none;
   
}
.project-list a:hover{
   text-decoration: none;
}

.project-list a {
   width: 100%;
   height: 100%;
   text-decoration: none;
   display: inline-block;
   float: left;
}

#projectTT {
   margin-top: 35px;
   margin-left: 5px;
   font-size: 18pt;
   color: black;
   text-decoration: none;
}

#projectMM {
   font-size: 15pt;
   color: gray;
   text-decoration: none;
}

/* 프로젝트 사이드바 */
.new-project {
   background-color: rgb(102, 164, 166);
   border: none;
   border-radius: 50px;
   width: 180px;
   height: 80px;
   margin-left: 25px;
   color: white;
   box-shadow: 1px 1px 1px 1px lightgray;
}

.sub-menu-title {
   margin-left: 40px;
   line-height: 40px;
}

.sub-menu {
   margin-left: 60px;
   line-height: 40px;
}

/* 프로젝트 생성*/
.modal-body {
   border: 1px solid gray;
   margin: 20px;
}

.newProject-table {
   width: 500px;
}

.newProject-table th {
   width: 250px;
   line-height: 50px;
   font-size: 15pt;
   margin-left: 10px;
}

.newProject-table td {
   width: 480px;
   line-height: 50px;
   font-size: 15pt;
   margin-left: 10px;
}

.newProject-date {
   border: none;
}

.newProject-content {
   width: 700px;
   height: 300px;
   border: 1px solid lightgray;
   resize: none;
   margin-left: 13px;
}

.newProject-count {
   margin: auto;
   margin-left: 43px;
}

div#addMemberArea {
   border: 1px solid lightgray;
   width: 700px;
   margin-left: 14px;
   border-radius: 10px;
   overflow: auto;
}

.newProject-member {
   width: 700px;
   height: 130px;
   padding: 10px;
   margin-left: 43px;
}

.newProject-member {
   width: 620px;
   height: 130px;
   padding: 10px;
   margin-left: 43px;
}

.newProject-input {
   width: 524px;
   border: 1px solid lightgray;
   border-radius: 10px;
}

*:focus {
   outline: none;
}

.btn-new, .btn-reset {
   width: 80px;
   height: 40px;
   border: 1px solid lightgray;
   border-radius: 10px;
}

.btn-new {
   background-color: rgb(102, 164, 166);
   margin-left: 20px;
}

.btn-area {
   margin-left: 38%;
}

/* 사원검색 */
input[type="search"] {
   width: 409px;
   height: 58px;
   border-radius: 15px;
   margin-top: -18px;
   margin-bottom: 33px;
   margin-left: 10px;
}

.search-member {
   width: 409px;
   height: 70px;
   text-align: center;
   margin-left: 10px;
   font-size: 13pt;
   line-height: 50px;
   border-radius: 10px;
}

#searchMemberResult {
   width: 409px;
   height: 100px;
   border: 1px solid lightgray;
   margin-left: 10px;
   overflow: auto;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr:hover
   {
   cursor: pointer;
   padding: 10px;
   background-color: #edf1f1;
   border-radius: 10px;
}

#searchMember>div>div>div.modal-body>div.search-area>table>tbody>tr>td {
   margin-left: 5px;
}

.btn-searchMember {
   width: 112px;
   height: 37px;
   background-color: rgb(102, 164, 164);
   color: white;
   border: 1px lightgray;
   border-radius: 10px;
   margin-left: 37%;
   margin-bottom: 16px;
}
</style>
</head>
<body>

   <div id="header-layout">
      <jsp:include page="../../common/header.jsp" />
   </div>
   <div id="container">
      <div id="sidebar-layout">
         <div id="main-sidebar">
            <!-- 부장급으로 들어가면 "새 프로젝트" 버튼 보이기  -->
            <c:if test="${ loginUser.rankNo ge  5 }">
               <button type="button" class="new-project" data-toggle="modal" data-target="#newProject">새 프로젝트</button>
               <br>
               <br>
            </c:if>

            <div class="sub-menu-title">
               <i class="fi fi-rr-menu-burger"></i>&nbsp;<b>프로젝트</b><br>
            </div>
            <div class="sub-menu">
               <i class="fi fi-rr-apps"></i>&nbsp;
               <a href="#" class="">&nbsp;전체</a>
            </div>
            <div class="sub-menu">
               <i class="fi fi-rr-apps"></i>&nbsp;
               <a href="notice.pro" class="">&nbsp;공지사항</a>
               <br>
            </div>
            <hr>
            <div class="sub-menu">
               &nbsp;
               <a href="#" class="">&nbsp;내 일정</a>
            </div>
         </div>
      </div>

      <div id="content-layout">
        <div id="calendarBox">
            <div id="calendar"></div>
        </div>
      </div>
   </div>

   <!-- 캘린더 모달 -->
    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <button class="btn-plan">일정</button>
                    <button class="btn-toDo">체크리스트</button>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#calendarModal').modal('hide');">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <form action="" class="cal-form" id="cal-form">
                <input type="hidden" name="type" class="cal-type">
                <div class="modal-body plan">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content" style="display:inline; width: 90%; margin-bottom: 16px;"><br>
                        <label for="taskId" class="col-form-label">시작</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date" style="display:inline; width: 30%;">
                        -
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date" style="display:inline; width: 30%; margin-bottom: 10px;"><br>
                        <label for="taskId" class="col-form-label">내용</label>
                        <textarea name="calendar_content" class="form-control" id="calendar_content" cols="30" rows="10" style="resize: none;"></textarea>
                    </div>
                </div>
                <div class="modal-body toDo" style="display: none;">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">To Do List</label>
                        <div>
                            <div>
                                <input type="checkbox" name="" id=""><label for="">체크리ㅏ스트</label>
                                <input type="checkbox" name="" id=""><label for="">체크리ㅏ스트</label>
                            </div>
                        </div>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content" placeholder="메모">
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                    id="sprintSettingModalClose" onclick="$('#calendarModal').modal('hide');">취소</button>
            </div>

        </div>
    </div>
   </div>

   <!-- The Modal -->
   <div class="modal fade" id="newProject">
      <div class="modal-dialog modal-lg">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">
                  <b>프로젝트 생성하기</b>
               </h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
               <form id="insertProjectForm" action="insert.pro" method="post">
                  <table class="newProject-table">
                     <tr>
                        <th>프로젝트명</th>
                        <td>
                           <input type="text" name="projectTitle" class="newProject-input" required>
                        </td>
                     </tr>
                     <tr>
                        <th>프로젝트 시작일자</th>
                        <td>
                           <input type="date" name="projectStartDate" class="newProject-date" required>
                        </td>
                     </tr>
                     <tr>
                        <th>프로젝트 마감일자</th>
                        <td>
                           <input type="date" name="projectEndDate" class="newProject-date" required>
                        </td>
                     </tr>
                     <tr>
                        <th>프로젝트 매니저</th>
                        <td>
                           <input type="text" name="projectWriter" class="newProject-input" value="${ loginUser.memberName }" readonly style="border: none;">
                        </td>
                     </tr>
                     <tr>
                        <th colspan="2">프로젝트 인원</th>
                     </tr>
                     <tr>
                        <th colspan="2">&nbsp;&nbsp;<span>
                              총
                              <span id="projectMemberCount"></span>
                              명
                           </span>
                           <button type="button" id="projectMemberBtn">아이콘</button>
                     </tr>
                     <tr>
                        <th colspan="2"><div class="newProject-member" name="projectMember" id="addMemberArea"></div></th>
                     </tr>
                     <tr>
                        <th colspan="2">프로젝트 개요</th>
                     </tr>
                     <tr>
                        <th colspan="2"><textarea class="newProject-content" name="projectSummary" required> </textarea></th>
                     </tr>
                  </table>
                  <div class="btn-area">
                     <button type="reset" class="btn-reset">취소</button>
                     <button type="submit" class="btn-new" id="inputProject">생성</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>



   <script>
      var projectAddedMembers = [];
      searchedMembers = []; //검색 전 빈 배열
      searchMember('', '', onMemberDataUpdated); //이름, 부서,

      $(document).ready(
            function() {
               $('#projectMemberBtn').on("click", function() {
                  $('#searchMember').modal('show');
               })

               $('#searchMember').on('click', '[data-member]',
                     onClickSearchedMember)

               $('#closeBtn').on('click', function() {
                  $(this).parents('.modal').modal('hide');
               })
            });

      function addMemberModal() {
         var html = $('#searchMemberResult').html();
         $('#addMemberArea').html(html);
         $('#searchMemberResult').empty();
         $('#searchMember').hide();

         for (var i = 0; i < projectAddedMembers.length; i++) {
            var html = '<input type="hidden" name="projectMemberNo" value="' + projectAddedMembers[i] + '" >';
            $('#insertProjectForm').append(html);
         }
         $('#projectMemberCount').text(projectAddedMembers.length);
      }

      function onClickSearchedMember() {
         var memberNo = $(this).attr('data-member');
         var memberName = $(this).children().eq(1).text().trim();
         var teamName = $(this).children().eq(2).text().trim();
         $('#searchMemberResult').append(
               '<li>' + teamName + ' ' + memberName + '</li>');
         projectAddedMembers.push(memberNo);
      }

      //사원 검색 - 
      function searchMember(name, dept, callback) {
         $.ajax({
            url : "search.member?name=" + name + "&dept=" + dept,
            success : function(res) {
               searchedMembers = res.members;
               callback(res.members);
            },
            error : function() {
               $('#searchMemberResult').html("조회 결과가 없습니다");
            }
         })
      }

      //검색에서 끝났을때
      function onSearchKeyUp() {
         var searchString = document.getElementById('ipSearchMemberText').value; //검색값
         searchMember(searchString, searchString, onMemberDataUpdated); //이름, 부서, 결과값
      }

      //검색결과
      function onMemberDataUpdated(members) {
         var memberTable = document.getElementById('tbMembers');
         memberTable.innerHTML = ''; //memberTable 비우고
         //반복문으로 결과값 출력
         for (var i = 0; i < members.length; i++) {
            memberTable.innerHTML += '<tr data-member="' + members[i].memberNo + '">'
                  + '<td><i class="xi-profile xi-3x"></i></td>'
                  + '<td>'
                  + members[i].memberName
                  + '</td>'
                  + '<td style="margin:10px">'
                  + members[i].deptName
                  + '/' + members[i].rankName + '</td>' + '</tr>'
         }
      }
   </script>

   <div class="modal" id="searchMember">
      <div class="modal-dialog">
         <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">사원검색</h4>
               <button id="closeBtn" type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
               <i class="fi fi-rr-search"></i>&nbsp;
               <input id="ipSearchMemberText" type="search" placeholder="    사원 또는 부서를 입력해주세요" onkeyup="onSearchKeyUp()">
               <br>
               <div class="search-area">
                  <table id="tbMembers" class="search-member">

                  </table>
               </div>
               <ul id="searchMemberResult"></ul>
            </div>
            <button type="button" class="btn-searchMember" onclick="addMemberModal()">추가</button>
         </div>
      </div>
   </div>

</body>
</html>