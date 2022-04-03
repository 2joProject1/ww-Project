<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/header.css">

<!-- 부트스트랩관련 -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<!-- 아이콘관련 -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">  
  

<title>Document</title>

<style>
	*{
	font-family: 'Nanum Gothic', sans-serif;
	}
  
  .pop{
    background-color: rgba(203, 212, 212, 0.918);
    width: 350px;
    height: 600px;
    position: absolute;
    right: 230px;
    display: none;
  }
  
  #title>a{
    text-decoration: none;
    color:black;
  }

  .chat-button{
    background-color: rgb(203, 212, 212);
    border: none;
    font-weight: bolder;
    color: rgb(66, 66, 66);
    margin: 13px 0 0 15px;
  }
  .scroll_div::-webkit-scrollbar {
  width: 6px;
  }
  .scroll_div::-webkit-scrollbar-thumb {
    background-color: #2f3b42;
  }
  .scroll_div::-webkit-scrollbar-track {
    background-color: grey;
  }
  .chat_li, .addr_li{
    height: 70px;
    align-content: center;
    align-items: center;
    padding: 8px 10px;
    background-color: rgba(236, 255, 255, 0.603);
  }
  .chat_li>*, .addr_li>*{
    display: inline-block;
    /* float: left; */
  }
  .chat_search{
    /* 클릭되었을 때 색상 바꾸는 법은 모징? */
    /* background-color: #2f3b42; */
  }
  
  .prof-info-wrap {
    background-color: rgb(245, 245, 245);
    border-radius: 5px;
    box-shadow: 0px 10px 20px -10px rgba(0,0,0,0.75);
    color: #747474;
    position: absolute;
    width: 350px;
    max-width: 100%;
    text-align: center;
    left: 700px;
    height: 350px;
    z-index: 3;
  }
  /* 버튼 색 바꾸깅 */
  button.primary {
    background-color: #03BFCB;
    border: 1px solid #03BFCB;
    border-radius: 3px;
    color: #231E39;
    font-weight: 500;
    padding: 10px 25px;
    margin-bottom: 15px;
    width: 300px;
  }
  .dim{
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0,0,0,0.4);
    position: fixed;
  }
  div.prof-info-wrap:target + .dim {
    position: fixed;
    z-index: 2;
    transition: all 0.5s;
  }
  .search-icon{
    position: absolute;
    left: 635px;
  }

  .prof-content{
    margin: 0;
    float: left;
    display: block;
  }
   .pElement{
     height: 24px;
     margin-left: 15px;
   }
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

<div id="header">
  <div id="title"> <!--  style="margin-bottom: -15px;" 강사님이 고쳐주신 코드. flex넣으니까 쳐지는거 해결되어서 삭제했는데 문제생기면 다시 추가 -->
    <a href="main">WALK-WORK</a>
  </div>
  <div id="search-area" style="position: relative;">
    <input type="text">
    <span class="search-icon">
    	<label>
	    	<i class="xi-search"></i>
    	</label>
    </span>
  </div>
  <div id="banner-area">
    <i class="xi-message-o popup" style="margin-right: 15px;"></i>
    <i class="xi-bell-o">&nbsp;</i>
    
    <i class="xi-profile" data-bs-toggle="modal" data-bs-target="#memberModal">&nbsp;</i>
    <div class="pop" style="font-size: 15px;">
        <div>
          <button class="chat-button" id="chat_btn">채팅</button>
          <button class="chat-button" id="addr_btn">연락처</button>
          <div style="display: inline; float: right; margin: 10px 15px 0 0;" onclick="chatInvite();">
            <i class="xi-plus-circle-o xi-2x"></i>
          </div>
        </div>
        <hr style="height: 2px; margin-bottom: 5px;">
        <div>
          <input class="form-control me-2 chat_search" type="search" placeholder="채팅방 또는 이름 검색" aria-label="Search" style="margin-bottom: 5px;">

          <div class="scroll_div" style="overflow-y: auto; height: 485px;">
            <!-- 채팅창 리스트 -->
            <ul class="list-group chat_ul">
              <li class="list-group-item justify-content-between align-items-center chat_li">
                <i class="xi-group xi-3x"></i>
                <div style="margin-left: 6px;">
                  <div>채팅방이름</div>
                  <div>안녕하세영</div>
                </div>
                <span class="badge bg-primary rounded-pill" style="float: right; margin-top: 15px;">14</span>
              </li>
            </ul>
            <!-- 연락처 리스트 -->
            <div class="list-group addr_ul">
            	<!-- 
              <li class="list-group-item justify-content-between align-items-center addr_li">
                <i class="xi-profile xi-3x"></i>
                <div  style="margin-left: 6px;">
                  <div>곽주현</div>
                  <div>010-1234-5678</div>
                </div>
              </li>
            -->
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 윤희 계정정보 Modal -->
		<div class="modal" id="memberModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="top: 55px; left: 18%;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container">
							<div class="row memberModalFont">
								<div class="col-4" style="margin-bottom: 10px">
									<img src="resources/coFile/${loginUser.file }" alt="person"
										class="img-circle" width="100%"
										onerror='this.src="resources/images/person-fill.svg"'>
								</div>
								<div class="col-8">
									<div>
										<span id="printDept"></span> <span id="printRank"></span>
									</div>
									<br>
									<div>${loginUser.memberName}</div>
									<input type="hidden" value="${loginUser.deptNo}" id="hd_deptNo">
									<input type="hidden" value="${loginUser.rankNo}" id="hd_rankNo">
								</div>
								<br> <br>
								<hr>
								<div class="col-12 memModal_end"
									onclick="location.href='information.me'">
									<img src="resources/images/gear-fill.svg" alt="setting"
										width="30px;"> 계정정보
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 연락처 레이어팝업 -->
	<div class="prof-info-wrap" id="prof-info-wrap" style="display: none;">
		<div style="float: right;">
			<i class="xi-close-thin xi-x addr_x"></i>
		</div>
		<br>
		<div class="prof-img">
			이미지 <img src="" alt="" width="300" height="150">
		</div>
		<input type="hidden" id="memberNo">
  		<input type="hidden" id="memberName">
		<div class="prof-info">
			<div class="prof-top">
				<span class="prof-name">고려진</span>
			</div>
			<div class="prof-bottom">
				<div class="pElement">
					<p class="prof-content">
						<i class="xi-at"></i> 
						<span class="prof-email">이메일</span>
					</p>
				</div>
				<div class="pElement">
					<p class="prof-content">
						<i class="xi-flickr"></i> 
						<span class="prof-dept">부서</span>
					</p>
				</div>
				<div class="pElement">
					<p class="prof-content">
						<i class="xi-sitemap-o"></i> 
						<span class="prof-rank">직급</span>
					</p>
				</div>
				 <button class="primary" onclick="showPopup(memberNo.value, memberName.value);">채팅하기</button>
			</div>
		</div>
	</div>

	<div class="dim" style="display: none;"></div>

	<script>
	$(".popup").click(function(){
	    console.log("zzzzz");
	    $(".pop").toggle();
	    $(".chat_ul").show();
	    $("#chat_btn").click();
	    $(".addr_ul").hide();
	    
	  })
	  $("#chat_btn").click(function(){
	    $(".chat_ul").show();
	    $(".addr_ul").hide();
	    
	    $.ajax({
	    	url: "chatList",
	    	success: function(object){
	    		console.log(object);
	    		$(".chat_ul").html("");
	    		var html = "";
	    			for(var i in object){
	    				html += "<li class='list-group-item justify-content-between align-items-center chat_li'>";
	    				html += "<input type='hidden' class='chatNo' value='" + object[i].chatNo + "'>";
	    				console.log(object[i].chatNo);
	    				html += "<i class='xi-group xi-3x'></i>";
	    				html += "<div style='margin-left: 6px;'>";
	    				html += "<div>"+ object[i].chatName +"</div>";
	    				html += "<div>"+ object[i].chatContent +"</div>";
	    				html += "</div>";
	    				html += "</li>";
	    			}
	    			$('.chat_ul').append(html);
	    	},
	    	error: function(request,status,error){
	    		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	}
	    })
	  });

	 // 연락처 부분 모달
	  $("#addr_btn").on('click', function(){
	    $(".addr_ul").show();
	    $(".chat_ul").hide();
	    
	    $.ajax({
	      url: "addrList",
	      success: function(object){
	        console.log(object);
	        $(".addr_ul").html("");
	        var html = "<ul class='list-group addr_ul'>";
	        	for(var i in object){
	              html += "<li class='list-group-item justify-content-between align-items-center addr_li'>";
	              /* input hidden 으로 정보 가져오깅 */
	              html += "<input type='hidden' class='memberNo' value='"+ object[i].memberNo + "'>";
	              html += "<input type='hidden' class='memberName' value='"+ object[i].memberName + "'>";
	              html += "<input type='hidden' class='rankName' value='"+ object[i].rankName + "'>";
	              html += "<input type='hidden' class='deptName' value='"+ object[i].deptName + "'>";
	              html += "<input type='hidden' class='email' value='"+ object[i].email + "'>";
	              html += "<input type='hidden' class='phone' value='"+ object[i].phone + "'>";
	              html += "<input type='hidden' class='filepath' value='"+ object[i].filepath + "'>";
	              /* 프로필 이미지 없을 때 있을 때 if 달아주깅 */
	              html += "<i class='xi-profile xi-3x'></i>";
	              html += "<div  style='margin-left: 6px;'>";
	                html += "<div>" + object[i].memberName + "</div>";
	                html += "<div>" + object[i].phone +"</div>";
	                html += "</div>";
	                html += "</li>";
	                console.log(i);
	              console.log(html);
	        	}
	        	html += "</ul>";
	        	$(".addr_ul").append(html);
	      	},
	      	error: function(){
	      		console.log("연락처 ajax 통신 실패");
	      	}
	    })
	  })
	  
	$(document).on('click', '.addr_li', function(){
	    /* memberNo, memberName, deptNo, rankNo, filepath */
		 var memberNo = $(this).find('.memberNo').val();
	    var memberName = $(this).find('.memberName').val();
	    var deptName = $(this).find('.deptName').val();
	    var rankName = $(this).find('.rankName').val();
	    var email = $(this).find('.email').val();
	    var phone = $(this).find('.phone').val();
	    var filepath = $(this).find('.filepath').val();
	
	    $('.prof-name').text(memberName);
	    $('.prof-email').text(email);
	    $('.prof-dept').text(deptName);
	    $('.prof-rank').text(rankName);
	    $(".prof-info-wrap").show();
	    $('#memberNo').val(memberNo);
	    $('#memberName').val(memberName);
	    $(".dim").show();
  	})

		$(".addr_x").click(function() {
			$(".prof-info-wrap").hide();
			$(".dim").hide();
		})

		/* 채팅창 팝업 */
		function showPopup($memberNo, $memnberName){
    		console.log($memberNo);
    		console.log($memnberName);
    	var win = window.open("/ww/chat/chatRoom?chatMemberNo="+$memberNo+"&chatMemberName="+$memnberName, 
                          "chatting_room", "width=470, height=650, left=300, top=50, scrollbars=no, status=no, resizable=no");
  		}
	 
		  $(document).on('click', '.chat_li', function(){
			  var chatNo = $(this).find('.chatNo').val();
			  console.log(chatNo);
			  console.log(this);
			  var win = window.open("/ww/chat/chatRoomDetail?chatNo="+chatNo, 
		                          "chatting_room", "width=470, height=650, left=300, top=50, scrollbars=no, status=no, resizable=no");
		  })
		  
		  function chatInvite(){
			  console.log('채팅 초대하러 가봅세다.');
			  window.open("/ww/chat/chatInvite", "chatting_room", "width=500, height=610, left=300, top=50");
		  }

		/* 나는 윤희쓰 */
		$('#memberModal').on('shown.bs.modal', function() {
			$(".modal-backdrop").css('background', 'none');
		})

		//윤희 모달 정보
		$(document).ready(function() {
			var dept = $('#hd_deptNo').val();
			var rank = $('#hd_rankNo').val();
			console.log(dept, rank);

			if (dept == 0) {
				$('#printDept').text('미배치');
			} else if (dept == 1) {
				$('#printDept').text('기획팀');
			} else if (dept == 2) {
				$('#printDept').text('운영팀');
			} else if (dept == 3) {
				$('#printDept').text('재무팀');
			} else if (dept == 4) {
				$('#printDept').text('서비스팀');
			} else if (dept == 5) {
				$('#printDept').text('개발팀');
			} else {
				$('#printDept').text('인사팀');
			}

			if (rank = 1) {
				$('#printRank').text('사원');
			} else if (rank == 2) {
				$('#printRank').text('대리');
			} else if (rank == 3) {
				$('#printRank').text('과장');
			} else if (rank == 4) {
				$('#printRank').text('차장');
			} else if (rank == 5) {
				$('#printRank').text('부장');
			} else {
				$('#printRank').text('전체관리자');
			}
		});
	</script>


</body>
</html>
