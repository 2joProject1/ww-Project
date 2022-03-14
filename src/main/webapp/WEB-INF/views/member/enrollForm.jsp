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
<title>Insert title here</title>
    <style>
        #enroll_green_bg{
            width: 600px;
            margin: auto;
            background-color: rgb(78, 137, 140);
            height: 750px;
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
            width: 550px;
            height: 670px;
            background-color: white;
            margin: auto;
            margin-top: 30px;
            border-radius: 3px;
        }
        #enroll_white_bg div{
            margin-left: 50px;
            padding-top: 20px;
        }

        .enroll_td2>input{
            width: 300px;
        }
        .enroll_td2{
            height: 30px;
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
            margin-left: 30px;
            margin-right: 40px;
            margin-top: 20px;
        }
        #enroll_form_btn>button:active{
            background-color: rgb(102, 164, 166);
        }
        #address_input>input{
        	width:300px;
        }
    </style>
    
</head>
<body>
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
                            <td style="width:110px">아이디</td>
                            <td class="enroll_td2">
                                <input type="text" name="memberNo" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">사번을 입력하세요(숫자5자리)</td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td class="enroll_td2">
                                <input type="text" name="memberName" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">2글자 이상 입력하세요</td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td class="enroll_td2">
                                <input type="password" name="memberPwd" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">8~16자 영문 대 소문자, 숫자, 특수문자</td>
                        </tr>
                        <tr>
                            <td>비밀번호확인&nbsp;&nbsp;</td>
                            <td class="enroll_td2">
                                <input type="text" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">비밀번호가 일치하지 않습니다</td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td class="enroll_td2">
                                <input type="text" name="birth"><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">8자리로 입력하세요 예)19990909</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td class="enroll_td2" id="address_input">
								<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:200px">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:100px"><br>
								<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소"  name="address">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목"  name="address">
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td class="enroll_td2">
                                <input type="email" name="email" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">올바른 이메일주소가 아닙니다</td>
                        </tr>
                        <tr>
                            <td>휴대폰번호</td>
                            <td class="enroll_td2">
                                <input type="text" style="width: 260px;" name="phone" required><button>인증</button><br>
                            </td>
                        </tr>
                    
                        <tr>
                            <td>인증번호</td>
                            <td class="enroll_td2">
                                <input type="text" style="width: 260px;" required><button>확인</button><br>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="enroll_td3">잘못된 인증번호입니다</td>
                        </tr>
                    </table>
                    <div id="enroll_form_btn">
                        <button>확인</button>
                        <button>취소</button>
                    </div>
                </div>
                </form>
                
                
            </div>
        </div>
    </div>
    
<script>
    function sample6_execDaumPostcode() {
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
</body>
</html>