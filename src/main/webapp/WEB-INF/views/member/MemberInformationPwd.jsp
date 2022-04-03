<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>walk-work</title>
<link rel="stylesheet" href="resources/css/MemberInformation.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="resources/css/layout.css">
<style>

.pwdBtn button{
	width: 90px;
    height: 45px;
    background-color: rgb(30,137,140);
    color: white;
    font-weight: bold;
    font-size: 19px;
    border: none;
    border-radius: 16px;
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

	<div class="container" style="min-width: 1500px;">
		<div id="header-layout">
			<jsp:include page="../common/header.jsp" />
		</div>
		<jsp:include page="../member/MemberInformationSideBar.jsp" />
		<h1>비밀번호 설정</h1>
		<form class="row pwd_box" id="pwd_box"
			action="modifyPwd.me" method="post" onsubmit="return checkPwd()">
			<div style="padding: 40px; border: 1px solid #BEBEBE; ">
			<div class="col-md-12">
				<label for="pwd1" class="form-label">현재 비밀번호</label>
				 <input
					type="password" class="form-control" id="pwd1" name="memberPwd"
					style="border: 1px solid black; width:70%;"required>
			</div>
			<br><br><br>
			<div class="col-md-12">
				<label for="pwd2" class="form-label">새 비밀번호</label> <input
					type="password" class="form-control" id="pwd2" name="tmpPwd"
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
					style="border: 1px solid black; width:70%;" required>
				<div class="valid-feedback">안전합니다.</div>
				<div style="font-size:20px; color:red">8~16자 영문 대 소문자, 숫자, 특수문자(!@#$) 필수</div>
				<br>
			</div>
			<br><br>
			<div class="col-md-12">
				<label for="pwd3" class="form-label">비밀번호 확인</label> <input
					type="password" class="form-control" id="pwd3"
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
					style="border: 1px solid black; width:70%;" required>
				<div id="matchPwd"
					style="width: 100%; margin-top: 0.25rem; font-size: .875em;">
				</div>
			</div>
			</div>
			
			<div class="col-md-12 pwdBtn" style="padding-top:20px">
				<button class="btn btn-primary" type="submit">저장</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$('#pwd3').on('change', function() {
			var pwd1 = $('#pwd1').val();
			var pwd2 = $('#pwd2').val();
			var pwd3 = $('#pwd3').val();
			if (pwd2 == pwd3) {
				$('#matchPwd').text('비밀번호가 일치합니다');
				$('#matchPwd').css('color', '#198754');
			} else {
				$('#matchPwd').text('비밀번호가 일치하지 않습니다.');
				$('#matchPwd').css('color', '#dc3545');
			}
		})

		function checkPwd() {
			var result = false;
			var pwd1 = $('#pwd1').val();
			var pwd2 = $('#pwd2').val();
			var pwd3 = $('#pwd3').val();
			if (pwd2 == pwd3) {
				$('#matchPwd').text('비밀번호가 일치합니다');
				$('#matchPwd').css('color', '#198754');
				result = true;
			} else {
				$('#matchPwd').text('비밀번호가 일치하지 않습니다.');
				$('#matchPwd').css('color', '#dc3545');
				result = false;
			}

			return result;
		}
	</script>

</body>
</html>