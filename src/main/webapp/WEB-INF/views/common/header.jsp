<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-straight/css/uicons-bold-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <title>Document</title>

	<style>
    .pop{
      background-color: rgba(203, 212, 212, 0.918);
      width: 350px;
      height: 600px;
      position: absolute;
      right: 230px;
      display: none;
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
    
    .card_container {
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
    .card_container h4 {
      margin: 10px 0;
    }

    .card_container h6 {
      margin: 5px 0;
      text-transform: uppercase;
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
    }
    div.card_container:target + .dim {
    position: fixed;
    z-index: 2;
    transition: all 0.5s;
}
	</style>
</head>
<body>

<div id="header">
  <div id="title"> <!--  style="margin-bottom: -15px;" 강사님이 고쳐주신 코드. flex넣으니까 쳐지는거 해결되어서 삭제했는데 문제생기면 다시 추가 -->
    WALK-WORK
  </div>
  <div id="search-area">
    <i class="fi fi-rr-search" style="margin-right: 5px;"></i>
    <input type="text">
  </div>
  <!-- 모달 나오는 버튼
    data-bs-toggle="modal" data-bs-target="#exampleModal" 
   -->
  <div id="banner-area">
    <i class="fi fi-rr-comment popup" style="margin-right: 15px;"></i>
    <i class="fi fi-rs-bell popup">&nbsp;</i>
    
    <i class="fi fi-rr-user">&nbsp;</i>
    <div class="pop" style="font-size: 15px;">
        <div>
          <button class="chat-button" id="chat_btn">채팅</button><button class="chat-button" id="addr_btn">연락처</button>
          <div style="display: inline; float: right; margin: 10px 15px 0 0;"><i class="xi-plus-circle-o xi-2x"></i></div>
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
            <ul class="list-group addr_ul">
              <li class="list-group-item justify-content-between align-items-center addr_li" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class="xi-profile xi-3x"></i>
                <div  style="margin-left: 6px;">
                  <div>곽주현</div>
                  <div>010-1234-5678</div>
                </div>
              </li>
            </ul>
          </div>
      </div>
    </div>
  </div>
</div>
<!-- 연락처 레이어팝업 -->
<div class="card_container" id="card_container" style="display: none;">
  <div style="float: right;"><i class="xi-close-thin xi-x addr_x"></i></div><br>
  <img src="" alt="" width="300" height="150">
  <h4>고려진</h4>
  <h6>어쩌궁 저쩌궁 ㅈㅈㄱㅈ더개졷ㄹ냉ㄹ</h6>
  <h6>어쩌궁 저쩌궁 ㅈㅈㄱㅈ더개졷ㄹ냉ㄹ</h6>
  <button class="primary" onclick="showPopup();">채팅하기</button>
</div>

<div class="dim" style="display: none;"></div>

<script>
  $(function(){
    $(".popup").click(function(){
      $(".pop").toggle();
      $(".addr_ul").hide();
    })
  })
  $("#chat_btn").click(function(){
    $(".chat_ul").show();
    $(".addr_ul").hide();
  });
  
  $("#addr_btn").click(function(){
    $(".addr_ul").show();
    $(".chat_ul").hide();
    
  })
  
  $(".addr_li").click(function(){
    $(".card_container").show();
    $(".dim").show();
  })

  $(".addr_x").click(function(){
    $(".card_container").hide();
    $(".dim").hide();
  })

  /* 채팅창 팝업 */
  function showPopup(){
    window.open("/ww/chattingRoom", "chatting_room", "width=400, height=600, left=100, top=50");
  }

</script>

		
		
<!-- Modal -->
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->

</body>
</html>
