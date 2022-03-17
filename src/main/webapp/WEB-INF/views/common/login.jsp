<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 부트스트랩관련 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 아이콘관련 -->
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-straight/css/uicons-bold-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
 	<link rel="stylesheet" href="resources/css/layout.css">

<!-- 제이쿼리 --> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 <!-- 자바스크립트 -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
 
<style>
        body{
            background-color: white;
        }
        div {
            box-sizing: border-box;
        }
        #container {
            width: 1500px;
            height: 800px;
            margin: auto;
            display: flex;
        }
        #container>div{
            width:50%;
            display: inline-block;
        }
        #logo_layout{
            font-size: 50px;
            margin: auto;
            text-align: center;
            font-weight: bold;

            
        }
        #login_form{
            margin: auto;
            padding-top: 300px;
            /* padding-left: 100px; */
        }
        #login_form div{
            width: 500px;
        }
        #login_top{
            border-radius: 5px 5px 0 0;
            margin: 0px 0px 0px;
            border: 1px solid rgb(78, 137, 140);
            height: 40px;
            text-align: center;
            line-height: 38px;
            background: rgb(78, 137, 140);
            color:white;
        }
        .login_input{
            width: 492px;
            height: 50px;
            margin-bottom: 10px;
            
        }
        #login_button>button{
            background: rgb(78, 137, 140);
            color:white;   
            height: 50px;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 100%;
            font-weight: bold;
            font-size: 20px;
            border: 1px solid rgb(78, 137, 140);

        }
        .login_text{
            color:darkgray;
            text-align: center;
        }
        #login_option{
            text-align: center;
            margin-bottom: 10px;
        }


        /* 모달 */
        .modal{
            /* 모달창 위치(높이) 조정 */
            padding-top: 150px;
        }
        .modal-backdrop{
            /* 모달 배경 뒤 검게 흐려지는 현상 사라지도록 */
            background: none;
        }
        .modal-content{
            /* 모달창내부 배경색 */
            background-color: rgb(102, 164, 166);
            height: 600px;
        }

        .modal-title{
            color: white;
            font-weight: bold;
            font-size: 20px;
            text-align: center;    
            width: 500px;
        }

        .login_form_title{
            /* 모달창 내 walk-work 글씨 위치 */
            text-align: center;
        }
        #login_modal_content{
            /* 모달 바디 내부 하얀 배경 */
            width: 468px;
            height: 450px;
            background-color: white;
            border-radius: 3px;
        
        }
        #login_searchId_information{
            margin: auto;
        }
        #login_searchId_information td{
            height: 60px;
        }
        .login_td1{
            width: 100px;
        }
        .login_td2{
            width: 250px;
        }
        .login_td2>input{
            width: 250px;
        }
        .modal-footer{
            padding: 0px;
            display: inline-block;
            border: none;
        }
        .modal-footer>button{
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 90px;
        }
        #searchPwd_form{
            margin-top: 30px;
            margin-left: 55px;
        }
        #searchPwd_form td{
            height: 60px;
        }
        /* #searchPwd_form button{
            border: none;
            보류
        } */
        #login_searchPwd .modal-footer>button{
            margin-top: 10px;
        }
        a{
        	text-decoration:none;
        	color:black;
        }
</style>

</head>
<body>

	<!-- 로그인관련 alert창 출력 -->
<%--  	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>  --%>
	
<script>

</script>

    <div id="container">
        <div id="logo_layout">
            WALK-WORK<br>
            [워크:워크]
        </div>

        <div id="login_layout">
            <div id="login_form">
                <form action="login.me" method="post">
                    <div id="login_top">
                        <a>ID/PW 로그인</a>
                    </div>
                    <input type="text" class="login_input" name="memberNo" id="memberNo" placeholder="아이디(사번)를 입력하세요"><br>
                    <input type="password" class="login_input" name="memberPwd" id="memberPwd" placeholder="비밀번호를 입력하세요"><br>
                    <div class="login_text">
                        <!-- if문사용하기 -->
                        
	                    <c:if test="${not empty errorMsg}">
	    					<font color="red">
	       					 <p>로그인에 실패했습니다.<br/>
	           			 	${errorMsg}</p>
	   					 </font>
						</c:if>
                        원하는 서비스를 이용하시려면 로그인이 필요합니다.
                        <br> 
                        로그인 실패 1회. 5회 실패 시 임시비밀번호 발급 창으로 이동합니다.
                    </div>
                    <div id="login_button">
                        <button>로그인(Login)</button>
                    </div>
                </form>
                    <div id="login_option">
                        <button type="button" class="btn" data-toggle="modal" data-target="#login_searchId">아이디찾기</button> | 
                        <button type="button" class="btn" data-toggle="modal" data-target="#login_searchPwd">임시비밀번호발급</button> |
                        <a href="enroll.me"><button class="btn">회원가입</button></a>
                    </div>
                    <div class="login_text">
                        이용 후 반드시 로그아웃 해주세요
                    </div>

            </div><!-- 로그인폼 -->
        </div><!-- 로그인레이아웃 -->
    </div><!-- 컨테이너 -->





        <!-- 아이디찾기용 모달 -->
    <div class="modal" id="login_searchId">
        <div class="modal-dialog">
            <div class="modal-content">
            
            <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-title">
                        아이디찾기
                    </div>
                </div>
              <!-- Modal body -->
            <form action="먼데.html" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">
                        <table id="login_searchId_information">
                            <tr>
                                <td class="login_td1">직급</td>
                                <td class="login_td2"><input type="text"><br></td>
                            </tr>
                            <tr>
                                <td class="login_td1">이름</td>
                                <td class="login_td2"><input type="text"><br></td>
                            </tr>
                            <tr>
                                <td class="login_td1">입사년도</td>
                                <td class="login_td2"><input type="text"><br></td>
                            </tr>
                            <tr>
                                <td class="login_td1">핸드폰번호</td>
                                <td class="login_td2"><input type="text" style="width: 200px;"><button>인증</button><br></td>
                            </tr>
                            <tr>
                                <td class="login_td1">인증번호</td>
                                <td class="login_td2"><input type="text" style="width: 200px;"><button>확인</button><br></td>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 5px;"></td>
                                <td style="height: 5px;"><span style="color: rgb(78, 137, 140);">인증번호가 일치하지 않습니다.</span><br>&nbsp;</td>
                            </tr>
                        </table>
                        <div class="modal-footer">
                            <!-- alert창으로 알려줘야겠음..ㅠㅠ... -->
                            <button type="submit">등록</button>
                            <button type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div><!-- 로그인모달content -->
                </div> <!-- 바디 -->
            </form>
            </div> <!-- 모달content -->
        </div><!-- dialog -->
    </div><!-- 아이디찾기모달끝 -->



        <!-- 비번찾기용 모달 -->
    <div class="modal" id="login_searchPwd">
        <div class="modal-dialog">
            <div class="modal-content">
            
            <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-title">
                        임시비밀번호발급
                    </div>
                </div>

              <!-- Modal body -->
            <form action="먼데.html" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">

                        <div id="searchPwd_form">
                            <table id="login_searchPwd_information">
                                <tr>
                                    <td class="login_td1">아이디(사번)</td>
                                    <td class="login_td2"><input type="text"><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">이름</td>
                                    <td class="login_td2"><input type="text"><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">핸드폰번호</td>
                                    <td class="login_td2"><input type="text" style="width: 200px;"><button>인증</button><br></td>
                                </tr>
                                <tr>
                                    <td class="login_td1">인증번호</td>
                                    <td class="login_td2"><input type="text" style="width: 200px;"><button>확인</button><br></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 5px;"></td>
                                    <td style="height: 5px;"><span style="color: rgb(78, 137, 140);">인증번호가 일치하지 않습니다.</span><br>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="submit">등록</button>
                            <button type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div><!-- 로그인모달content -->
                </div> <!-- 바디 -->
            </form>
            </div> <!-- 모달content -->
        </div><!-- dialog -->
    </div><!-- 비번찾기모달끝 -->
</body>
</html>