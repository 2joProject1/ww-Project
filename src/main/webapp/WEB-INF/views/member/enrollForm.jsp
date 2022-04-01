<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<link rel="stylesheet" href="resources/css/layout.css">
 	<link rel="stylesheet" href="resources/css/header.css">
 	
 	<!-- 주소api -->
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 	<!-- 제이쿼리 --> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 자바스크립트 -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
 
<title>Insert title here</title>
    <style>
        #enroll_green_bg{
            width: 700px;
            margin: auto;
            background-color: rgb(78, 137, 140);
            height: 800px;
            border-radius: 3px;
            margin-top: 50px;
            padding-top: 5px;
        }
        #enroll_title{
            color: white;
            font-weight: bold;
            font-size: 20px;
            text-align: center;
            width: 200px;
            height: 20px;
            margin: auto;
            padding-top: 10px;
        }
        #enroll_white_bg{
            width: 650px;
            height: 700px;
            background-color: white;
            margin: auto;
            margin-top: 30px;
            border-radius: 3px;
        }
        #enroll_white_bg div{
            margin-left: 50px;
            padding-top: 20px;
        }
        #enroll_Form_Table>td:first-child{
        	width:1000px;
        }

        .enroll_td2>input{
            width: 410px;
        }
        .enroll_td2{
            height: 32px;
            
        }
        .enroll_td3{
            height: 10px;
            font-size: 13px;
            color: grey;
        }
        .input_btn{
            width: 500px;
        }
        #enroll_form_btn>button{
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 70px;
            margin-right: 40px;
            margin-top: 5px;
        }
        #enroll_form_btn>button:active{
            background-color: rgb(102, 164, 166);
        }
        #address_input>input{
        	width:410px;
        }
        input{
        	BORDER-BOTTOM: solid 1px grey;
			BORDER-LEFT: medium none;
			BORDER-RIGHT: medium none;
			BORDER-TOP: medium none;
			outline: none;
        }
        #address_input>input{
        	height:30px;
        }
    </style>
    
</head>
<body>
<!-- 회원가입관련 알림창 출력 -->
 	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if> 
	
    <div id="enroll_wrap">
        <div id="enroll_green_bg">
            <div id="enroll_title">
                	회원가입
            </div>
            <div id="enroll_white_bg">
            	<form action="insert.me">
	                <div>
	                    <table id="enroll_Form_Table">
	                        <tr>
	                            <td style="width:120px">아이디</td>
	                            <td class="enroll_td2">
	                                <input type="text" name="memberNo" id="id" required><br>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3" id="id_chk">사번을 입력하세요(숫자5자리)</td>
	                        </tr>
	                        <tr>
	                            <td>이름</td>
	                            <td class="enroll_td2">
	                                <input type="text" name="memberName" id="name" required><br>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3" id="name_chk">실명을 입력하세요(한글 2자 이상, 6자 이하)</td>
	                        </tr>
	                        <tr>
	                            <td>비밀번호</td>
	                            <td class="enroll_td2">
	                                <input type="password" name="memberPwd" id="pwd" required><br>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3" id="pwd_chk">8~16자 영문 대 소문자, 숫자, 특수문자(!@#$)</td>
	                        </tr>
	                        <tr>
	                            <td>비밀번호확인&nbsp;&nbsp;</td>
	                            <td class="enroll_td2">
	                                <input type="password" id="pwd_double" required><br>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3" id="pwd_double_chk">비밀번호 확인을 위해 다시 입력해주세요</td>
	                        </tr>
	                        <tr>
	                            <td>생년월일</td>
	                            <td class="enroll_td2">
	                                <input type="text" name="birth" id="birth"required><br>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3" id="birth_chk">8자리로 입력하세요 예)19990909</td>
	                        </tr>
	                        <tr>
	                            <td>주소</td>
	                            <td class="enroll_td2" id="address_input">
									<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:305px;" readonly>
									<button type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:100px;">우편번호 찾기</button>
									<!-- <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:100px;"><br> -->
									<input type="text" id="sample6_address" placeholder="주소" name="address" readonly><br>
									<input type="text" id="sample6_detailAddress" placeholder="상세주소"  name="address" required>
									<input type="text" id="sample6_extraAddress" placeholder="참고항목"  name="address" readonly>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td class="enroll_td3"></td>
	                        </tr>
	                        <tr>
	                            <td rowspan="2" style="height:35px;">이메일</td>
	                            <td class="enroll_td2">
	                                <input type="email" name="email" id="email" required style="width:305px;">
	                                <button type="button" id="email_d_btn">중복확인하기</button>
	                                <button type="button" id="email_btn" disabled="disabled">인증번호전송</button><br>
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                            <td class="enroll_td3" id="email_chk"></td>
	                        </tr>
	                        <tr id="email_vali">
	                            <td>이메일인증번호</td>
	                            <td class="enroll_td3">
	                            	<input type="text" name="email_vali_input" id="email_vali_input" style="width: 410px;" required>
	                            </td>
	                        </tr>
	                       	<tr>
	                            <td></td>
	                            <td class="enroll_td3" id="email_vali_chk"></td>
	                        </tr>
	
	                        <tr>
	                            <td>휴대폰번호</td>
	                            <td class="enroll_td2">
	                                <input type="text" style="width: 410px;" name="phone" id="phone" required>
	                                <!-- <button type="button" id="phone_btn">인증</button><br> -->
	                            </td>
	                        </tr>
	                       	<tr>
	                            <td></td>
	                            <td class="enroll_td3" id="phone_chk"></td>
	                        </tr>
	                    
	                        <tr class="phone_vali">
	                            <td>인증번호</td>
	                            <td class="enroll_td2">
	                                <input type="text" style="width: 410px;"><button type="button" >확인</button><br>
	                            </td>
	                        </tr>
	                        <tr class="phone_vali">
	                            <td></td>
	                            <td class="enroll_td3">잘못된 인증번호입니다</td>
	                        </tr>
	                    </table>
	                    <div id="enroll_form_btn">
	                        <button type="submit">확인</button>
	                        <button id="back_btn"><a href="javascript:history.back();">취소</a></button>
	                    </div>
	                </div>
                </form>
                
                
            </div>
        </div>
    </div>
    
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<script>
//이메일 인증번호 입력 창 숨김
window.onload = $(function(){
	$('#email_btn').hide();
	$('#email_vali').hide();
	$('#email_vali_chk').hide();
	$('.phone_vali').hide();
	
})


$(function(){
	
	
//아이디 정규식, 중복체크
 	$('#back_btn').click(function(){
 		location.href = 'login.back';
	})
 	$('#phone_btn').click(function(){
 		alert("현재 지원하지 않는 기능입니다.");
	})
 	$('#id').blur(function(){
		var $id = $('#id').val();
		var regExp =  /^\d{5}$/;
		
		if(!regExp.test($id)){
			$('#id_chk').text("잘못 입력하셨습니다. 사번(숫자 5자리)을 입력하세요").css("color","red");
			$('#id').val('');
			return false;
		} 
		else if(regExp.test($id)){
 			$.ajax({
 				url : "idDupl.chk",
 				data : {id : $id},
 				type : "post",
 				success : function(result){
 					if(result>0){
 						$('#id_chk').text($id + "은(는) 이미 사용중인 아이디입니다. 다시 입력하세요.").css("color","red");
	 					$('#id').val('');				
 					} else{
 						$('#id_chk').text("굿").css("color","gray");
	 					
 					}
 				}

 			})
			return true;
		}
	})

	//이름 정규식 검증
	$('#name').blur(function(){
		var $name = $('#name').val();
		var regExp =  /^[가-힣]{2,6}$/;
			
		if(!regExp.test($name)){
			$('#name_chk').text("잘못 입력하셨습니다. 실명(성 포함 2글자 이상, 6글자 이하)을 입력하세요").css("color","red");
			$('#name').val('');
			return false;
		}
		else if(regExp.test($name)){
			$('#name_chk').text("굿").css("color","gray");
			return true;
		}
		
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
	
	//생년월일 검증
	$('#birth').blur(function(){

		var $birth = $('#birth').val();
		var regExp =  /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

	
		if(!regExp.test($birth)){
			$('#birth_chk').text("잘못 입력하셨습니다. 19940404 형식으로 입력하세요").css("color","red");
			$('#birth').val('');
			return false;
		}
		if(regExp.test($birth)){
 			$('#birth_chk').text("굿").css("color","gray");
		}
	})
	
	
	//이메일 형식 + 중복체크
	$('#email').blur(function(){

		var $emailDupl = $('#email').val();
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		if(!regExp.test($emailDupl)){
			$('#email_chk').text("잘못 입력하셨습니다. 올바른 이메일 형식으로 입력하세요").css("color","red");
			$('#email').val('');
		}
		if(regExp.test($emailDupl)){
 			$('#email_chk').text("사용 가능한 이메일입니다. 인증번호 전송 버튼을 클릭하세요.").css("color","gray");
 			$.ajax({
 				url : "emailDupl.chk",
 				data : {emailDupl : $emailDupl},
 				type : "post",
 				success : function(result){
 					if(result>0){
	 					$('#email_chk').html($emailDupl + "은(는) 이미 사용중인 이메일입니다. <br>다른 이메일 주소를 입력하세요.").css("color","red");
 						$('#email').val('');
 					} else {
 						$('#email_d_btn').hide();
 						$('#email_btn').show();
 						$("#email_btn").attr("disabled",false); //이메일형식에 맞고, 중복 X 시 인증번호 전송 버튼 활성화
 					}
 				}

 			})
		}
	})
	
	//이메일 인증번호 전송
	$('#email_btn').click(function(){
		
		$('#email_vali').show();
		$('#email_vali_chk').show();
		var $email = $('#email').val();
		
		$.ajax({
			url : "email.chk",
			data : {email : $email},
			type : "post"
		})
		
	})
	
	//이메일 인증번호 일치여부 확인
	
	$('#email_vali_input').blur(function(){
		var $emailVali = $('#email_vali_input').val();
		$.ajax({
			url : "emailVali.chk",
			data : {emailVali : $emailVali},
			type : "post",
			success : function(result){
				if(result>0){ //result 1이상 == 일치결과있음
					$('#email_vali_chk').text("굿").css("color","gray");
					
				} else{
					$('#email_vali_chk').text($emailVali + "은(는) 잘못된 인증번호입니다. 다시 입력하세요.").css("color","red");
					$('#email_vali_input').val('');				
				}
			}
		})
		
	})
	
	//핸드폰번호 형식 + 중복체크
	$('#phone').blur(function(){

		var $phoneDupl = $('#phone').val();
		var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
		if(!regExp.test($phoneDupl)){
			$('#phone_chk').text("잘못 입력하셨습니다. 올바른 핸드폰번호를 입력하세요").css("color","red");
			$('#phone').val('');
		}
		if(regExp.test($phoneDupl)){
 			$('#phone_chk').text("굿").css("color","gray");
		}
	})
	
	
	
	
	
})
</script>


<!-- 
	해야할것
	
	1. 핸드폰인증 어떻게 할건지(중복체크만할건지)
	2. td 첫번째꺼 선택해서 어케 설정하는지 찾고 글씨크기조절등등하기(css)
	3. 취소버튼 누르면 뒤로 돌아가기
	4. 주소 여유주기
	하고싶은것
	2. 비밀번호 눈 아이콘 클릭하면 *** -> 12345보이게(input type="여기 속성 바꾸면 될것같은데") 
 -->
<!-- --------------------- -->


</body>
</html>