<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 --> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 <!-- 자바스크립트 -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
 
<style>
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
            width:600px;
            margin:auto;
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
            margin:auto;
        
        }
        #login_searchId_information{
            margin: auto;
        }
        #login_searchId_information td{
            height: 40px;
        }
        .login_td1{
            width: 100px;
        }
        .login_td2{
            width: 300px;
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
`
</style>
</head>
<body>
	<script>
		window.onload = function(){
			window.alert("${countOverMsg }");
			
		}
	</script>
	
	<c:if test="${ not empty changeResult }">
		<script>
			alert("${ changeResult }");
		</script>
		<c:remove var="changeResult" scope="session" />
	</c:if>
	
	        <!-- 아이디찾기용 모달 -->
    <div class="modal" id="login_searchId">
        <div class="modal-dialog">
            <div class="modal-content">
            
            <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-title">
                       	비밀번호변경
                    </div>
                </div>
              <!-- Modal body -->
            <form action="changePwd.me" method="post">
                <div class="modal-body">
                    <div id="login_modal_content">
                        <div style="padding-left: 15px; line-height: 50px;">본인인증</div>
                        <hr style="margin: 0px;">
                        <table id="login_searchId_information" border="1px">

                            <tr>
                                <td class="login_td1" width="250px">사번</td>
                                <td class="login_td2"><input type="text" id="memberNo" name="memberNo" required><br></td>
                            </tr>
                            <tr>
                                <td class="login_td1" width="250px">이름</td>
                                <td class="login_td2"><input type="text" id="name" name="memberName" required><br></td>
                            </tr>

                            <tr>
                                <td class="login_td1">이메일</td>
                                <td class="login_td2"><input type="text" id="email" name="email" style="width: 200px;" required><button type="button" id="email_btn">인증</button><br></td>
                            </tr>
                            <tr>
                                <td style="height: 5px;"></td>
                                <td id="email_result" style="height: 5px;"></td>
                            </tr>
                            <tr>
                                <td class="login_td1">인증번호</td>
                                <td class="login_td2"><input type="text" id="email_chk" name="email_chk" style="width: 200px;" required><button type="button" id="email_chk_btn">확인</button><br></td>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 5px;"></td>
                                <td id="vali_result" style="height: 5px;"></td>
                            </tr>
							<tr class="hidden_pwd">
                            <td>비밀번호</td>
	                            <td class="enroll_td2">
	                                <input type="password" name="memberPwd" id="pwd" required><br>
	                            </td>
	                        </tr>
	                        <tr class="hidden_pwd">
	                            <td></td>
	                            <td class="enroll_td3" id="pwd_chk">8~16자 영문 대 소문자, 숫자, 특수문자(!@#$)</td>
	                        </tr>
	                        <tr class="hidden_pwd">
	                            <td>비밀번호확인</td>
	                            <td class="enroll_td2">
	                                <input type="password" id="pwd_double" required><br>
	                            </td>
	                        </tr>
	                        <tr class="hidden_pwd">
	                            <td></td>
	                            <td class="enroll_td3" id="pwd_double_chk">비밀번호 확인을 위해 다시 입력해주세요</td>
	                        </tr>
                        </table>
                        <div class="modal-footer">
                            <!-- alert창으로 알려줘야겠음..ㅠㅠ... -->
                            <button type="submit" id="change_btn" disabled="disabled">등록</button>
                            <button type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div><!-- 로그인모달content -->
                </div> <!-- 바디 -->
            </form>
            </div> <!-- 모달content -->
        </div><!-- dialog -->
    </div><!-- 아이디찾기모달끝 -->
    
<script>
    window.onload = $(function(){
    	$('#email_vali').hide();
/*     	$('.hidden_pwd').hide(); */
    })
    
    
    $(function(){
    	
	    $('#searchId').click(function(){
	    	$('#vali_result').text("");
	    	$("#change_btn").attr("disabled",true);
	    	$('#email').text('');
	    })
	    	
	    $('#email_btn').click(function(){
	    		
	    		var $email = $('#email').val();
		    	var $name = $('#name').val();
				var $emailVali = $('#email_chk').val();

	    		$.ajax({
	    			url : "email.chk",
	    			data : {email : $email},
	    			type : "post",					
	    			complete : function(){
						$('#email_result').text("이메일 전송이 완료되었습니다.").css("color","gray");
					}
	    			
	    		})
	    		
	    	})
	    })
	    
	    $('#email_chk').blur(function(){
			var $emailVali = $('#email_chk').val();
	    	var $name = $('#name').val();
			var $email = $('#email').val();
			
	
			$.ajax({
				url : "emailVali.chk",
				data : {emailVali : $emailVali},
				type : "post",
				success : function(result){
					if(result>0){ //result 1이상 == 일치결과있음
						$('#vali_result').text("굿").css("color","gray");
						
					} else{
						$('#vali_result').text($emailVali + "은(는) 잘못된 인증번호입니다. 다시 입력하세요.").css("color","red");
						$('#email_chk').val('');				
					}
				},
				complete : function(){
					if($name!=null&&$email!=null&&$emailVali!=null)
				    	$('.hidden_pwd').show();
						$("#change_btn").attr("disabled",false);
				}
			})
		
		})
		
			// 비밀번호 검증
	$('#pwd').blur(function(){
		var $pwd = $('#pwd').val();
		var regExp =  /^[a-zA-Z\d!@#$]{8,16}$/;

	
		if(!regExp.test($pwd)){
			$('#pwd_chk').text("잘못 입력하셨습니다. 8~16자 영문 대 소문자, 숫자, 특수문자(!@#$)").css("color","red");
			$('#pwd').val('');
			return false;
		}
		else if(regExp.test($pwd)){
			$('#pwd_chk').text("굿").css("color","gray");
			return true;
		}
		
	})
	
	// 비밀번호 일치여부 검증
	$('#pwd_double').blur(function(){
		var $pwd = $('#pwd').val();
		var $pwd_double = $('#pwd_double').val();
	
        if($pwd != $pwd_double){
			$('#pwd_double_chk').text("입력하신 비밀번호가 일치하지 않습니다").css("color","red");
			$('#pwd_double').val('');
		}
		else {
			$('#pwd_double_chk').text("굿").css("color","gray");
			return true;
		}
		

	
		
		
		
	})
		
		

    	
    	
    
    </script>
    

</body>
</html>