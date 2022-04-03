<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
.cameraIcon{
	width: 37px;
    position: absolute;
    left: 300px;
    bottom: 190px;
}
#mem_btn1{
    width: 100px;
    height: 45px;
    background-color: rgb(30,137,140);
    color: white;
    font-weight: bold;
    font-size: 15px;
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

<div class="container" style="min-width : 1500px;">
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>
	<jsp:include page="../member/MemberInformationSideBar.jsp" />
	<div class="row">
		<div class="col-12">
			<h1>계정 정보</h1>
			<hr>
				<div>
					<h3>내 프로필</h3>
				</div>
			</div>
		<br><br><br><br><br><br><br>
		<div class="col-5">
			<div class="memberImg" style="margin-left:95px">
				<img id="mem_img" src="resources/coFile/${memberInfo.file }" onerror='this.src="resources/images/person-fill.svg"' alt="profileImg">

				<div id="ImghiddenBtn">
					<button onclick="mem_submitFiles()" id="mem_btn1">이대로 저장</button>
					<button onclick="undoBtn()" id="mem_btn1">되돌리기</button>
				</div>
				
			</div>
			
			<input type="file" id="mem_file" class="cm_file"
							accept="image/gif, image/jpeg, image/jpg, image/png"/>
			<label for="mem_file">
				<img src="resources/images/camera-fill.svg" alt="camera" class="cameraIcon">
			</label>
			
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
						<!-- <div class="col-5">
							<button id="modifyBtn">수정</button>						
						</div> -->
					</div>
				</div> 
				
				
				<!-- 수정모드 -->
				<!-- <div class="col-8" id="afterMdf">
					<div class="row">
						<div class="col-7 info_input">
							<input type="text" placeholder="숫자만 입력" class="info_num">
							
						</div>
						<div class="col-5">
							<button id="saveBtn">저장</button>
							<button id="cancelBtn">취소</button>
						</div>
					</div>
				</div>  -->
			
				
				
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
		<input type="hidden" value="${memberInfo.memberNo }" id="memberNo">
		<input type="hidden" value="${memberInfo.file }" id="imgSrc">
	</div>
</div>
<script type="text/javascript">
	 $(document).ready(function(){
		/* $('#afterMdf').css('display', 'none');*/
		$('#mem_file').on("change", mem_filefunc);
		$('#ImghiddenBtn').css('display', 'none');
	})
	
	/*
	$('#modifyBtn').click(function(){
		$('#beforeMdf').css('display', 'none');
		$('#afterMdf').css('display', '');
	})
	
	$('#cancelBtn').click(function(){
		$('#beforeMdf').css('display', '');
		$('#afterMdf').css('display', 'none');
	}) */
	
	// 미리보기
	function mem_filefunc(e){
		var reader = new FileReader();
		reader.onload = function(e){
				$('#mem_img').attr("src", e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
		
		$('#ImghiddenBtn').css('display', '');
	}
	
	// 파일 업로드
	function mem_submitFiles(){
		var form = new FormData();
		form.append("file1", $('#mem_file')[0].files[0]);
	 $.ajax({
			url : "addProfileImg.me",
			type : "POST",
			processData : false,
			contentType : false,
			async : false,
			enctype : 'multipart/form-data',
			data : form,
			success:function(data){
				alert("프로필 변경 완료");
				window.location.reload();
			},
			error : function(jqXHR,txt){
				alert("프로필 변경 오류");
			}
		})
	}
	
	// 되돌리기
	function undoBtn(){
		$('#mem_img').attr("src", "resources/coFile/"+$('#imgSrc').val());
		$('#ImghiddenBtn').css('display', 'none');
	}
	
</script>
</body>
</html>