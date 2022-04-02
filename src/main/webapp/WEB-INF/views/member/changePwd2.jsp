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

    #wrap{
        background-color: rgb(102, 164, 166);
        height: 700px;
        width:600px;
        margin:auto;
        margin-top:90px;
    }

     #header{
         color: white;
         font-weight: bold;
         font-size: 20px;
         text-align: center;    
         width: 600px;
         height:60px;
         line-height:3;
     }

     #content{
         /* 모달 바디 내부 하얀 배경 */
         width: 500px;
         height: 550px;
         background-color: white;
         border-radius: 3px;
         margin:auto;
         padding-top:30px;
     
     }
     #changePwd_tb .td1{
     	height:50px;
     }
     #changePwd_tb{
     	margin:auto;
     }
     #changePwd_tb input{
     	width:243px;
     }
     .td1{
     	width:100px;
     }
     .td3{
     	width:100px;
     	height:20px;
     }
	.resultText{
		height:20px;
		font-size:12px;
		color:grey;
	}
     #footer>button{
         border: none;
         width: 150px;
         height: 40px;
         margin-left: 180px;
         margin-top:30px;
     }
	a{
     	text-decoration:none;
     	color:black;
     }

</style>
</head>
<body>

	<c:if test="${ not empty changeResult }">
		<script>
			alert("${ changeResult }");
		</script>
		<c:remove var="changeResult" scope="session" />
	</c:if>
	
	
	<div id="wrap">
		<div id="header">
			비밀번호변경
		</div>
		
		<form action="changePwd2.me" method="post">
			<div id="content">
				<table id="changePwd_tb">
					<tr>
						<td class="td1" width="250px">사번</td>
						<td class="td2"><input type="text" id="memberNo" name="memberNo" required><br></td>
					</tr>
					<tr>
						<td class="td1" width="250px">이름</td>
						<td class="td2"><input type="text" id="name" name="memberName" required><br></td>
					</tr>
					
					<tr>
						<td class="td1">이메일</td>
						<td class="td2"><input type="text" id="email" name="email" style="width: 200px;" required><button type="button" id="email_btn">인증</button><br></td>
					</tr>
					<tr>
						<td class="td3"></td>
						<td id="email_result" class="td2 resultText"></td>
					</tr>
					<tr>
						<td class="td1">인증번호</td>
						<td class="td2">
							<input type="text" id="email_chk" name="email_chk" style="width: 200px;" required><button type="button" id="email_chk_btn">확인</button><br>
						</td>
					</tr>
					<tr>
						<td class="td3"></td>
						<td id="vali_result" class="td2 resultText"></td>
					</tr>
					<tr class="hidden_pwd">
						<td class="td1">비밀번호</td>
						<td class="td2">
							<input type="password" name="memberPwd" id="pwd" required><br>
						</td>
					</tr>
					<tr class="hidden_pwd">
						<td class="td3 "></td>
						<td class="td2 resultText" id="pwd_chk">8~16자 영문 대 소문자, 숫자, 특수문자(!@#$)</td>
					</tr>
					<tr class="hidden_pwd">
						<td class="td1">비밀번호확인</td>
						<td class="td2">
							<input type="password" id="pwd_double" required><br>
						</td>
					</tr>
					<tr class="hidden_pwd">
						<td class="td3"></td>
						<td class="td2  resultText" id="pwd_double_chk" required>비밀번호 확인을 위해 다시 입력해주세요</td>
					</tr>
				</table>
				<div id="footer">
					<button type="submit" id="change_btn" disabled="disabled">비밀번호 변경하기</button>
					<!-- <button type="button"><a href="javascript:history.back();">취소</a></button> -->
				</div>
			</div>
		</form>
	
	
	
	</div>
	
	
	

    
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
			$('#pwd_chk').html("잘못 입력하셨습니다. <br>8~16자 영문 대 소문자, 숫자, 특수문자(!@#$)<br>형식으로 입력하세요.").css("color","red");
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