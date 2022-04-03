<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WALK-WORK</title>
 <!-- 부트스트랩관련 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
            width: 500px;
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
        #searchId_form{
        	margin-top: 30px;
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
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<c:if test="${ not empty changeResult }">
		<script>
			alert("${ changeResult }");
		</script>
		<c:remove var="changeResult" scope="session" />
	</c:if>
	<c:if test="${ not empty tmpMsg }">
		<script>
			alert("${ tmpMsg }");
		</script>
		<c:remove var="tmpMsg" scope="session" />
	</c:if>
	
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
                    <input type="text" class="login_input" name="memberNo" placeholder="아이디(사번)를 입력하세요"><br>
                    <input type="password" class="login_input" name="memberPwd" id="memberPwd" placeholder="비밀번호를 입력하세요"><br>
                    <div class="login_text">
                                            원하는 서비스를 이용하시려면 로그인이 필요합니다.
                    </div>
                    <div id="login_button">
                        <button>로그인(Login)</button>
                    </div>
                </form>
                    <div id="login_option">
                        <button type="button" id="searchId" class="btn" data-toggle="modal" data-target="#login_searchId">아이디찾기</button> | 
                        
                        <button type="button" id="tmpPwd" class="btn" data-toggle="modal" data-target="#login_searchPwd">임시비밀번호발급</button> |
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
            <form action="searchId.me" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">
                        <div id="searchId_form">
	                        <table id="login_searchId_information">
	
	                            <tr>
	                                <td class="login_td1">이름</td>
	                                <td class="login_td2"><input type="text" class="name" name="memberName" required><br></td>
	                            </tr>
	                            
	                            <tr>
	                                <td class="login_td1">생년월일</td>
	                                <td class="login_td2"><input type="text" class="name" id="birth" name="birth" required><br></td>
	                            </tr>
	                            
		                        <tr>
	                                <td style="height: 5px;"></td>
	                                <td id="birth_chk" style="height: 5px; font-size:11px"></td>
	                            </tr>
	                            
	                            <tr>
	                                <td class="login_td1">이메일</td>
	                                <td class="login_td2"><input type="text" class="email" name="email" style="width: 200px;" required><button type="button" class="email_btn">인증</button><br></td>
	                            </tr>
	                            <tr>
	                                <td style="height: 5px;"></td>
	                                <td class="email_result" style="height: 5px;"></td>
	                            </tr>
	                            <tr>
	                                <td class="login_td1">인증번호</td>
	                                <td class="login_td2"><input type="text" class="email_chk" name="email_chk" style="width: 200px;" required><button type="button" class="email_chk_btn">확인</button><br></td>
	                                
	                            </tr>
	                            <tr>
	                                <td style="height: 5px;"></td>
	                                <td class="vali_result" style="height: 5px;"></td>
	                            </tr>
	                        </table>
	                    </div>
                        <div class="modal-footer">
                            <button type="submit" id="searchId_btn" disabled="disabled">등록</button>
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
            <form action="tmpPwd.me" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">

                        <div id="searchPwd_form">
                            <table id="login_searchPwd_information">
	                            <tr>
	                                <td class="login_td1">아이디(사번)</td>
	                                <td class="login_td2"><input type="text" name="memberNo" required><br></td>
	                            </tr>
	                            <tr>
	                                <td class="login_td1">이름</td>
	                                <td class="login_td2"><input type="text" class="name" name="memberName" required><br></td>
	                            </tr>
	
	                            <tr>
	                                <td class="login_td1">이메일</td>
	                                <td class="login_td2"><input type="text" class="email2" name="email" style="width: 200px;" required><button type="button" class="email_btn2">인증</button><br></td>
	                            </tr>
	                            <tr>
	                                <td style="height: 5px;"></td>
	                                <td class="email_result2" style="height: 5px;"></td>
	                            </tr>
	                            <tr>
	                            	<td class="login_td1">인증번호</td>
                                	<td class="login_td2"><input type="text" class="email_chk2" name="email_chk2" style="width: 200px;" required><button type="button" class="email_chk_btn2">확인</button><br></td>
                                
	                            </tr>
	                            <tr>
	                                <td style="height: 5px;"></td>
	                                <td class="vali_result" style="height: 5px;"></td>
	                            </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" id="tmpPwd_btn" disabled="disabled">등록</button>
                            <button type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div><!-- 로그인모달content -->
                </div> <!-- 바디 -->
            </form>
            </div> <!-- 모달content -->
        </div><!-- dialog -->
    </div><!-- 비번찾기모달끝 -->
    
    <script>
    
    
    window.onload = $(function(){
    	$('#email_vali').hide();
    	
    })
    
    
    $(function(){
    	
	    $('#searchId').click(function(){
	    	$('.vali_result').text("");
	    	$("#searchId_btn").attr("disabled",true);
	    	$('.email').text('');
	    	$('.email_result').text('');
	    })
	    
	    $('#tmpPwd').click(function(){
	    	$('.vali_result').text("");
	    	$("#tmpPwd_btn").attr("disabled",true);
	    	$('.email').text('');
	    	$('.email_result').text('');
	    })
	    	
	    $('.email_btn').click(function(){
	    		
	    		var $email = $('.email').val();
		    	var $name = $('.name').val();
				var $emailVali = $('.email_chk').val();

	    		$.ajax({
	    			url : "email.chk",
	    			data : {email : $email},
	    			type : "post",					
	    			complete : function(){
						$('.email_result').text("이메일 전송이 완료되었습니다.").css("color","gray");
					}
	    			
	    		})
	    		
	    })
	    $('.email_btn2').click(function(){
	    		
	    		var $email = $('.email2').val();
		    	var $name = $('.name').val();
				var $emailVali = $('.email_chk2').val();

	    		$.ajax({
	    			url : "email.chk",
	    			data : {email : $email},
	    			type : "post",					
	    			complete : function(){
						$('.email_result2').text("이메일 전송이 완료되었습니다.").css("color","gray");
					}
	    			
	    		})
	    		
	    })
	    
	    
	    
	})
	
	//아이디찾기
    $('.email_chk').blur(function(){
		var $emailVali = $('.email_chk').val();
    	var $name = $('.name').val();
		var $email = $('.email').val();
		

		$.ajax({
			url : "emailVali.chk",
			data : {emailVali : $emailVali},
			type : "post",
			success : function(result){
				if(result>0){ //result 1이상 == 일치결과있음
					$('.vali_result').text("굿").css("color","gray");
					
				} else{
					$('.vali_result').text($emailVali + "은(는) 잘못된 인증번호입니다. 다시 입력하세요.").css("color","red");
					$('.email_chk').val('');				
				}
			},
			complete : function(){
				if($name!=null&&$email!=null&&$emailVali!=null)
					$("#searchId_btn").attr("disabled",false);
					$("#tmpPwd_btn").attr("disabled",false);
			}
		})
		
	})
	
	//임시비밀번호발급 -> 위랑 합쳤더니 실행 안되서 분리
    $('.email_chk2').blur(function(){
		var $emailVali = $('.email_chk2').val();
    	var $name = $('.name').val();
		var $email = $('.email').val();
		

		$.ajax({
			url : "emailVali.chk",
			data : {emailVali : $emailVali},
			type : "post",
			success : function(result){
				if(result>0){ //result 1이상 == 일치결과있음
					$('.vali_result').text("굿").css("color","gray");
					
				} else{
					$('.vali_result').text($emailVali + "은(는) 잘못된 인증번호입니다. 다시 입력하세요.").css("color","red");
					$('.email_chk2').val('');				
				}
			},
			complete : function(){
				if($name!=null&&$email!=null&&$emailVali!=null){					
					$("#searchId_btn").attr("disabled",false);
					$("#tmpPwd_btn").attr("disabled",false);
				} else{
					$("#searchId_btn").attr("disabled",true);
					$("#tmpPwd_btn").attr("disabled",true);
					
				}
			}
		})
	
	})
	
	//생년월일 검증
	$('#birth').blur(function(){

		var $birth = $('#birth').val();
		var regExp =  /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

	
		if(!regExp.test($birth)){
			$('#birth_chk').text("잘못 입력하셨습니다. 숫자 8자리를 입력하세요.").css("color","gray");
			$('#birth').val('');
			return false;
		}
		if(regExp.test($birth)){
 			$('#birth_chk').text("굿").css("color","gray");
		}
	})

    	
    	
    
    </script>
    
    
    
    
    
</body>
</html>