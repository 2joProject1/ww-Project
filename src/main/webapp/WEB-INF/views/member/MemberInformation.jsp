<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>walk-work</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/MemberInformation.css">
<link rel="stylesheet" href="resources/css/layout.css">
</head>
<body>

<div class="container" style="min-width : 1500px;">
	<div class="row">
		<div class="col-12">
			<h3 onclick="location.href='main'">walk-work</h3>
		</div>
	</div>
	<jsp:include page="../member/MemberInformationSideBar.jsp" />
	<div class="row">
		<div class="col-12">
			<h1>계정 정보</h1>
			<hr>
				<div>
					<h5>내 프로필</h5>
				</div>
			</div>
		<br><br><br><br><br><br><br>
		<div class="col-5">
			<div class="memberImg">
				<img src="resources/images/person-fill.svg" alt="person">
			</div>
			<img src="resources/images/camera-fill.svg" alt="camera" class="cameraIcon">
		</div>
		<div class="col-7">
			<div class="row">
				<div class="col-4 info_sub">
					<b>아이디</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.memberNo }
				</div>
				<div class="col-4 info_sub">
					<b>이름</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.memberName }
				</div>
				<div class="col-4 info_sub">
					<b>이메일</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.email }
				</div>
				<div class="col-4 info_sub">
					<b>휴대폰번호</b>
				</div>
				<!-- 수정모드 전 -->
				<div class="col-8" id="beforeMdf">
					<div class="row">
						<div class="col-7 info_input">
							${memberInfo.phone}
						</div>
						<div class="col-5">
							<button id="modifyBtn">수정</button>						
						</div>
					</div>
				</div>
				
				
				<!-- 수정모드 -->
				<div class="col-8" id="afterMdf">
					<div class="row">
						<div class="col-7 info_input">
							<input type="text" placeholder="숫자만 입력" class="info_num">
							
						</div>
						<div class="col-5">
							<button id="saveBtn">저장</button>
							<button id="cancelBtn">취소</button>
						</div>
					</div>
				</div>
			
				
				
				<div class="col-12 info_half">
				
				</div>
				<div class="col-4 info_sub">
					<b>회사명</b>
				</div>
				<div class="col-8 info_input">
					WALK-WORK
				</div>
				<div class="col-4 info_sub">
					<b>부서명</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.deptNo}
				</div>
				<div class="col-4 info_sub">
					<b>직급</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.rankNo}
				</div>
				<div class="col-4 info_sub">
					<b>내선번호</b>
				</div>
				<div class="col-8 info_input">
					${memberInfo.telephone}
				</div>
			</div>
			
		</div>
		
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#afterMdf').css('display', 'none');
	})
	
	$('#modifyBtn').click(function(){
		$('#beforeMdf').css('display', 'none');
		$('#afterMdf').css('display', '');
	})
	$('#cancelBtn').click(function(){
		$('#beforeMdf').css('display', '');
		$('#afterMdf').css('display', 'none');
	})
	
</script>
</body>
</html>