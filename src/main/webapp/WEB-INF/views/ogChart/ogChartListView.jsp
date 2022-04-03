<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구성원 관리</title>


<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- ajaxForm -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script>	
<!--<script type="text/javascript" src="jquery.form.min.js"></script>-->

 <!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- jQuery EasyUi API -->
<link rel="stylesheet" type="text/css" href="resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/easyui/themes/icon.css">
<script type="text/javascript" src="resources/easyui/jquery.min.js"></script>
<script type="text/javascript" src="resources/easyui/jquery.easyui.min.js"></script>


<style  type="text/css">


table {
  border-collapse: collapse;
  width: 100%;
  
}

tr {
  border-bottom: 1px solid #ddd;
}

th,td {
    padding: 15px;
}

.chartTitle {
    border-bottom: 1px solid #ddd;
    font-size: 30px;
}



#content-layout {

    width: 1000px;
    margin: 0px auto;
    padding: 20px;
    box-sizing: border-box;
    position: relative;
    padding : 40px 0 40px 40px;
    height: 950px;

}

#content_side {
   
    float: left;
    border: 1px solid #ddd;
    width: 400px;
    padding: 20px;
    position: absolute;
    box-sizing: border-box;
    top: 190px;
    width: 200px;
    height: 569px;
    	
}

#content_chart {
    
    float: right;
    border: 1px solid #ddd;
    width: 850px;
    padding: 20px;
    box-sizing: border-box;
    position: absolute;
    left: 160px;
    padding: 15px 15px 0 15px;
    height: 570px;
    margin-top: 44px;
    
}



ul {
    list-style:none;
}

.pagination {
  display: block;
  text-align: center;
  
}

.pagination a {
  color: black;
  float: none;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination > li > a {
    float: none;
}

#chartList{text-align:center;}

#rightMenu {
	margin-top: 10px;
}
.profileImg {
	height: 128px;
	width: 96px;
}
#officerList > thead > tr > th, #officerList > tbody > tr > td {
	text-align: center;
}
.small-icon {
	line-height: 20px;
	height: 20px;
	width: 20px;
	display: none;
	pointer-events: auto
}
#deptNameUp {
	width: 167px;
}
#title {
	border-bottom: 2px solid #727377;
}
#title>*, #leftTop>* {
	display: inline-block;
}
#leftMenu, #rightMenu {
	margin-top: 10px;
}
#leftTop>button {
	margin-left: 5px;
}
form {
	margin-bottom: 10px;
}
.telNumMax, #phoneNum1, #telNum1, #phoneNum1_up, #telNum1_up {
	text-align-last: center;
}
.leftNoPadding {
	padding-left: 0px;
}
.rightNoPadding {
	padding-right: 0px;
}
.profileImg {
	height: 128px;
	width: 96px;
}
.tableMiddle > thead > tr > th, .tableMiddle > thead > tr > td,
.tableMiddle > tbody > tr > th, .tableMiddle > tbody > tr > td {
	vertical-align: middle;
}
#dept {
    height: 300px;
}
#departmentModal > div {
	top: 50%;
	margin-top: -260px;
}
.overError {
	overflow: hidden;
}
#dept {
	overflow: auto;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	/* 사원 검색 */
	$("#search").on("click", function() {
		if ($("#keyword").val() == "") {
			alert("검색어를 최소 1글자 이상 입력해주세요.");
			return;
		} else if ($("#keyword").val() != "")
			var params = {
				cate : $("#cate").val(),
				keyword : $("#keyword").val()
			};
		
			officerListSearch(params);
	});
	
	// Ajax 페이징 처리
	$(document).on("click", "#pageIndexListAjax > li > a", function() {
		var params = {
				cate : $("#cate").val(),
				keyword : $("#keyword").val(),
				page : $(this).attr("data-page")
			};
		
		officerListSearch(params);
	});
	
	/* 입사일 자동 입력 */
	$("#officerInsertModal").on("click", function() {
		var date = new Date();

		var yyyy = date.getFullYear();
		var mm = (date.getMonth() + 1)
		var dd = date.getDate();

		if (mm < 10) {
			mm = "0" + mm;
		}
		if (dd < 10) {
			dd = "0" + dd;
		}

		date = yyyy + "-" + mm + "-" + dd;

		$("#enrollDate").val(date);
	});
	/* 한글 입력 방지 */
	$("#email, #memberNo1").on("keyup", function() {
		$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ""));
	});
			
	// Update 숫자만 입력
	$(".telNumMax").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	
		// 전화번호 최대 입력 방지
		if ($(this).val().length > 4) {
			$(this).val($(this).val().substring(0, 4));
		}
		
		if ($(this).attr("id") == "phoneNum2" || $(this).attr("id") == "phoneNum3") {
			var phoneNum = $("#phoneNum1").val() + "-" + $("#phoneNum2").val() + "-" + $("#phoneNum3").val();
			$("#phone").val(phoneNum);
		}
		else if ($(this).attr("id") == "telNum2" || $(this).attr("id") == "telNum3") {
			var telNum = $("#telNum1").val() + "-" + $("#telNum2").val() + "-" + $("#telNum3").val();
			$("#telephone").val(telNum);
		}			
		else if ($(this).attr("id") == "phoneNum2_up" || $(this).attr("id") == "phoneNum3_up") {
			var phoneNum = $("#phoneNum1_up").val() + "-" + $("#phoneNum2_up").val() + "-" + $("#phoneNum3_up").val();
			$("#phone_up").val(phoneNum);
		}
		else if ($(this).attr("id") == "telNum2_up" || $(this).attr("id") == "telNum3_up") {
			var telNum = $("#telNum1_up").val() + "-" + $("#telNum2_up").val() + "-" + $("#telNum3_up").val();
			$("#telephone_up").val(telNum);
		}
	});
	// insert 비밀번호 자동 입력1
	/*
	$("#memberPwd1").on("keyup", function() {
		if ($("#memberPwd1").val() == "" && $("#memberPwd2").val() == "") {
			$("#memberPwd1_Div").removeAttr("class");
			$("#memberPwd1_Span").removeAttr("class");
		} else if ($("#memberPwd1").val() == $("#memberPwd2").val()) {
			$("#memberPwd").val($("#memberPwd1").val());
			$("#memberPwd1_Div").attr("class",	"has-success has-feedback");
			$("#memberPwd1_Span").attr("class", "glyphicon glyphicon-ok form-control-feedback");
		} else if ($("#memberPwd1").val() != $("#memberPwd2").val()) {
			$("#memberPwd").val("");
			$("#memberPwd1_Div").attr("class",	"has-error has-feedback");
			$("#memberPwd1_Span").attr("class", "glyphicon glyphicon-remove form-control-feedback");
		}
	});
	// insert 비밀번호 자동 입력2
	$("#memberPwd2").on("keyup", function() {
		if ($("#memberPwd2").val() == "" && $("#memberPwd1").val() == "") {
			$("#memberPwd1_Div").removeAttr("class");
			$("#memberPwd1_Span").removeAttr("class");
		} else if ($("#memberPwd2").val() == $("#memberPwd1").val()) {
			$("#memberPwd").val($("#memberPwd2").val());
			$("#memberPwd1_Div").attr("class",	"has-success has-feedback");
			$("#memberPwd1_Span").attr("class", "glyphicon glyphicon-ok form-control-feedback");
		} else if ($("#memberPwd2").val() != $("#memberPwd1").val()) {
			$("#memberPwd").val("");
			$("#memberPwd1_Div").attr("class",	"has-error has-feedback");
			$("#memberPwd1_Span").attr("class", "glyphicon glyphicon-remove form-control-feedback");
		}
	});
	
	// update 비밀번호 자동 입력1
	$("#memberPwd1_up").on("keyup", function() {
		if ($("#memberPwd1_up").val() == "" && $("#memberPwd2_up").val() == "") {
			$("#memberPwd1_Div_up").removeAttr("class");
			$("#memberPwd1_Span_up").removeAttr("class");
		} else if ($("#memberPwd1_up").val() == $("#memberPwd2_up").val()) {
			$("#memberPwd_up").val($("#memberPwd1_up").val());
			$("#memberPwd1_Div_up").attr("class",	"has-success has-feedback");
			$("#memberPwd1_Span_up").attr("class", "glyphicon glyphicon-ok form-control-feedback");
		} else if ($("#memberPwd1_up").val() != $("#memberPwd2_up").val()) {
			$("#memberPwd_up").val("");
			$("#memberPwd1_Div_up").attr("class",	"has-error has-feedback");
			$("#memberPwd1_Span_up").attr("class", "glyphicon glyphicon-remove form-control-feedback");
		}
	});
	// update 비밀번호 자동 입력2
	$("#memberPwd2_up").on("keyup", function() {
		if ($("#memberPwd2_up").val() == "" && $("#memberPwd1_up").val() == "") {
			$("#memberPwd1_Div_up").removeAttr("class");
			$("#memberPwd1_Span_up").removeAttr("class");
		} else if ($("#memberPwd2_up").val() == $("#memberPwd1_up").val()) {
			$("#memberPwd_up").val($("#memberPwd2_up").val());
			$("#memberPwd1_Div_up").attr("class",	"has-success has-feedback");
			$("#memberPwd1_Span_up").attr("class", "glyphicon glyphicon-ok form-control-feedback");
		} else if ($("#memberPwd2_up").val() != $("#memberPwd1_up").val()) {
			$("#memberPwd_up").val("");
			$("#memberPwd1_Div_up").attr("class",	"has-error has-feedback");
			$("#memberPwd1_Span_up").attr("class", "glyphicon glyphicon-remove form-control-feedback");
		}
	});
	*/
	
	// insert 사원번호 자동 입력
	$("#stfNumSearchBtn").on("click", function() {
		if ($("#memberNo1").val() == "") {
			alert("사원번호를 입력해주세요.");
		} else if ($("#memberNo1").val() != "") {
			selectMemberNo($("#memberNo1").val());
		}
	});
	// insert 사원번호 다시 체크
	$("#memberNo1").on("keyup", function() {
		if ($("#memberNo1").val() != $("#memberNo").val()) {
			$("#memberNo_Div").removeAttr("class");
			$("#memberNo_Span").removeAttr("class");
			$("#memberNo").val("");
		}
	});
	// update 사원번호 자동 입력
	$("#stfNumSearchBtn_up").on("click", function() {
		if ($("#memberNo1_up").val() == "") {
			alert("사원번호를 입력해주세요.");
		} else if ($("#memberNo1_up").val() != "") {
			selectMemberNo($("#memberNo1_up").val());
		}
	});
	// update 사원번호 다시 체크
	$("#memberNo1_up").on("keyup", function() {
		if ($("#memberNo1_up").val() != $("#memberNo").val()) {
			$("#memberNo_Div_up").removeAttr("class");
			$("#memberNo_Span_up").removeAttr("class");
			$("#memberNo_up").val("");
		}
	});
	/*
	// 최대 입력 방지
	$("#memberNo1, #memberNo1_up").on("keyup", function() {
		if ($(this).val().length > 10) {
			$(this).val($(this).val().substring(0, 10));
		}
	});
	// 최대 입력 방지
	$("#stf_dt_add").on("keyup", function() {
		if ($(this).val().length > 33) {
			$(this).val($(this).val().substring(0, 33));
		}
	});
	*/
	/* 구성원 추가 */
	$("#officerInsert").on("click",	function() {

		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if ($("#file").val() == "") {
			alert("프로필 사진을 확인해주세요.");
			return;
		} else if ($("#memberName").val() == "") {
			alert("이름을 확인해주세요.");
			return;
		}/* else if ($("#memberPwd").val() == "") {
			alert("비밀번호를 확인해주세요.");
			return;
		}*/ else if ($("#memberNo").val() == "") {
			alert("사원번호를 확인해주세요.");
			return;
		} /*else if ($("#stf_cm_add").val() == ""
				|| $("#stf_dt_add").val() == "") {
			alert("주소를 확인해주세요.");
			return;
		}*/ else if (!emailCheck.test($(
				"#email").val())) {
			alert("이메일을 확인해주세요.");
			return;
		} else if ($("#phone").val().length != 13) {
			alert("휴대폰 번호를 확인해주세요.");
			return;
		} else if ($("#telephone").val().length != 13) {
			alert("내선번호를 확인해주세요.");
			return;
		}
		else if ($("#enrollDate").val() == "") {
			alert("입사일을 확인해주세요.");
			return;
		}
		officerInsert();
	});
	
	/* 구성원 추가 */
	$("#officerUpdate").on("click",	function() {

		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if ($("#memberName_up").val() == "") {
			alert("이름을 확인해주세요.");
			return;
		}/* else if ($("#memberPwd1_up").val() != $("#memberPwd2_up").val()) {
			alert("비밀번호를 확인해주세요.");
			return;
		} /*else if ($("#stf_cm_add_up").val() == ""
				|| $("#stf_dt_add_up").val() == "") {
			alert("주소를 확인해주세요.");
			return;
			
		}*/ else if (!emailCheck.test($(
				"#email_up").val())) {
			alert("이메일을 확인해주세요.");
			return;
		} else if ($("#phone_up").val().length != 13) {
			alert("휴대폰 번호를 확인해주세요.");
			return;
		} else if ($("#telephone_up").val().length != 13) {
			alert("내선번호를 확인해주세요.");
			return;
		} else if ($("#enrollDate_up").val() == "") {
			alert("입사일을 확인해주세요.");
			return;
		}
		officerUpdate();
	});
	
	/* 파일(이미지) 미리보기 */
	$("#file, #file_up").on("change", function(event) {
		var input = this;
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgView').attr('src', e.target.result);
				$('#imgView_up').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	});
	
	// 구성원 수정 모달 띄우기
	$("#officerUpdateModal").on("click", function() {
		
		if ($(".radio").is(":checked") == false) {
			alert("사원을 선택해주세요.");
			return;
		}
		
		$("#officerUpdateModal").attr("data-target", "#updateModal");
		
		selectUpdateOfficer();
	});
	
	// 부서명 입력
	$("#deptInsert").on("click", function() {
		deptInsert();
	});
	// 부서 관리 input으로 변경
	$(document).on("dblclick", ".deptDiv", function() {
		var deptNo = $(this).attr("data-value");
		var deptName = $(this).text();
		
		deptList(deptNo, deptName);
	});
		 	 
	// 부서명 수정 진행
	$(document).on("click", "#deptUpdate", function() {
		selectDeptName();
	});
	
	// 최대 입력 방지
	$(document).on("keyup", "#addDept, #deptNameUp", function() {
		if ($(this).val().length > 8) {
			$(this).val($(this).val().substring(0, 8));
		}
	});
	
	$(document).on("mouseenter", ".deptDiv", function() {
		$(this).parent().children("span").css("display", "inline");
		$(this).css({"background-color" : "#1E90FF", "color" : "white", "cursor" : "default"});
	});
	
	$(document).on("mouseenter", ".small-icon", function() {
		$(this).parent().children("div").css({"background-color" : "#1E90FF", "color" : "white", "cursor" : "default"});
		$(this).css("display", "inline");
	});
			
	$(document).on("mouseleave", ".deptDiv", function() {
		$(".small-icon").css("display", "none");
		$(this).removeAttr("style");
	});
	
	$(document).on("mouseleave", ".small-icon", function() {
		$(".small-icon").css("display", "none");
		$(this).parent().children("div").removeAttr("style");
	});
	
	// 부서명 삭제
	$(document).on("click", ".small-icon", function() {
		var deptNo = $(this).parent().children("div").attr("data-value");
		deptDelete(deptNo);
	});
	
	// 조직도 닫은 후 강제 리다이렉트
	$("#deptClose").on("click", function() {
		window.location = "officerList.li";
	});
	
});
/* 사원 검색 */
function officerListSearch(params) {
	$.ajax({
		url : "officerListSearch.se",
		type : "POST",
		dataType : "json",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#userCount").empty();
			$("#officerList > tbody").empty();
			$("#pageIndexList").empty();
		},
		success : function(data) {

			var officerListCount = data.officerListCount;
			var officerList = data.officerList;
			var pageIndexListAjax = data.pageIndexListAjax;

			$("#userCount").html(officerListCount);

			var tbody = $("#officerList > tbody");
			$.each(officerList,	function(idx, val) {
				tbody.append($('<tr>').append($('<td>',	{html : "<input type='radio' class='radio' value='"+val.MEMBER_NO+"'>"}))
									  .append($('<td>',	{html : "<img src='"+val.FILEPATH+"' class='profileImg'/>"}))
									  .append($('<td>',	{text : val.MEMBER_NAME}))
									  .append($('<td>',	{text : val.RANK_NAME}))
									  .append($('<td>',	{text : val.DEPT_NAME}))
									  .append($('<td>',	{text : val.PHONE}))
									  .append($('<td>',	{text : val.TELEPHONE}))
									  .append($('<td>',	{text : val.EMAIL})));
			});
			
			$("#pageIndexList").html(pageIndexListAjax);
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}
// 사원번호 중복 검색
function selectMemberNo(data) {
	var params = {
		memberNo : data
	};
	$.ajax({
		url : "selectMemberNo.me",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#memberNo").val("");
			$("#memberNo_up").val("");
		},
		success : function(data) {
			var result = Number(data);
			if (result > 0) {
				alert("이미 존재하는 사원번호 입니다.");
				$("#memberNo_Div").attr("class", "has-error has-feedback");
				$("#memberNo_Span").attr("class", "glyphicon glyphicon-remove form-control-feedback");
				$("#memberNo_Div_up").attr("class", "has-error has-feedback");
				$("#memberNo_Span_up").attr("class", "glyphicon glyphicon-remove form-control-feedback");
			} else if (result == 0) {
				$("#memberNo").val($("#memberNo1").val());
				$("#memberNo_up").val($("#memberNo1_up").val());
				
				$("#memberNo_Div").attr("class", "has-success has-feedback");
				$("#memberNo_Span").attr("class", "glyphicon glyphicon-ok form-control-feedback");
				$("#memberNo_Div_up").attr("class", "has-success has-feedback");
				$("#memberNo_Span_up").attr("class", "glyphicon glyphicon-ok form-control-feedback");
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}
// 사원 등록 Ajax 파일 업로드
function officerInsert() {
	var params = {
		memberNo : $("#memberNo").val(),
		//admn_sq : $("#admn_sq").val(),
		deptNo : $("#deptNo").val(),
		rankNo : $("#rankNo").val(),
		memberName : $("#memberName").val(),
		memberPwd : $("#memberPwd").val(),
		phone : $("#phone").val(),
		telephone : $("#telephone").val(),
		email : $("#email").val(),
		enrollDate : $("#enrollDate").val(),
	};
	$("#officerInsertForm").ajaxForm({
		url : "officerInsert.in",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		enctype : "multipart/form-data",
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#officerInsert").attr("disabled", "disabled");
		},
		success : function(data) {
			if (data == "SUCCESS") {
				alert("정상적으로 입력되었습니다.");
				window.location = "officerList.li";
			} else if (data == "FAIL") {
				alert("입력을 실패하였습니다.");
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	}).submit();
	$("#officerInsert").attr("disabled");
}
// 사원 정보 불러오기
function selectUpdateOfficer() {
	var memberNo = $("input[type=radio]:checked").val();
	var params = {
			memberNo : memberNo
		};
	
	$.ajax({
		url : "selectUpdateOfficer.up",
		type : "POST",
		dataType : "json",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			
		},
		success : function(data) {
			
			$("#imgView_up").attr("src", data.FILEPATH);
			$("#memberName_up").val(data.MEMBER_NAME);
			$("#memberNo1_up").val(data.MEMBER_NO);
			$("#memberNo_up").val(data.MEMBER_NO);
			$("#memberNo_old").val(data.MEMBER_NO);
			//$("#admn_sq_up").val(data.ADMN_SQ);
			$("#deptNo_up").val(data.DEPT_NO);
			$("#rankNo_up").val(data.RANK_NO);
			//$("#stf_cm_add_up").val(data.STF_CM_ADD);
			//$("#stf_dt_add_up").val(data.STF_DT_ADD);
			$("#email_up").val(data.EMAIL);
			
			var arrPhoneNum = data.PHONE.split("-");
			
			$("#phoneNum1_up").val(arrPhoneNum[0]);
			$("#phoneNum2_up").val(arrPhoneNum[1]);
			$("#phoneNum3_up").val(arrPhoneNum[2]);
			$("#phone_up").val(data.PHONE);
			
			var arrTelNum = data.TELEPHONE.split("-");
			
			$("#telNum1_up").val(arrTelNum[0]);
			$("#telNum2_up").val(arrTelNum[1]);
			$("#telNum3_up").val(arrTelNum[2]);
			$("#telephone_up").val(data.TELEPHONE);
			
			$("#enrollDate_up").val(data.ENROLL_DATE);
			
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

// 사원 등록 Ajax 파일 업로드
function officerUpdate() {
	var params = {
		memberNo : $("#memberNo_up").val(),
		memberNo_old : $("#memberNo_old").val(),
		//admn_sq : $("#admn_sq_up").val(),
		deptNo : $("#deptNo_up").val(),
		rankNo : $("#rankNo_up").val(),
		memberName : $("#memberName_up").val(),
		memberPwd : $("#memberPwd_up").val(),
		phone : $("#phone_up").val(),
		//stf_cm_add : $("#stf_cm_add_up").val(),
		//stf_dt_add : $("#stf_dt_add_up").val(),
		telephone : $("#telephone_up").val(),
		email : $("#email_up").val(),
		enrollDate : $("#enrollDate_up").val(),
	};
	$("#officerUpdateForm").ajaxForm({
		url : "officerUpdate.up",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		enctype : "multipart/form-data",
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#officerUpdate").attr("disabled", "disabled");
		},
		success : function(data) {
			if (data == "SUCCESS") {
				alert("정상적으로 수정되었습니다.");
				window.location = "officerList.li";
			} else if (data == "FAIL") {
				alert("입력을 실패하였습니다.");
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
	}).submit();
	$("#officerInsert").attr("disabled");
}

// 부서명 등록
function deptInsert() {
	var params = {
			deptName : $("#addDept").val()
		};
	$.ajax({
		url : "deptInsert.in",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#addDept").val("");
		},
		success : function(data) {
			if (data > 0) {
				alert("부서 추가를 성공하였습니다.");
				deptList();
			}
			else if (data == 0) {
				alert("부서 추가를 실패하였습니다.");
				console.log(params);
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

// 부서명 다시 가져오기
function deptList(deptNo, deptName) {
	$.ajax({
		url : "selectDept.se",
		type : "POST",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			$("#deptNo_dept").empty();
		},
		success : function(data) {
			
			var div = $("#deptNo_dept");
			
			$.each(data, function(idx, val) {
				if (val.DEPT_NO != deptNo) {
					//div.append($('<div>', {class : "deptDiv", "data-value" : val.DEPT_NO, text : val.DEPT_NAME}))
					div.append($('<div>', {"class" : "has-feedback"})
					   .append($('<div>', {"class" : "deptDiv", "data-value" : val.DEPT_NO, text : val.DEPT_NAME}))
					   .append($('<span>', {"class" : "glyphicon glyphicon-remove form-control-feedback small-icon"})))
				}
				else if (val.DEPT_NO == deptNo) {
					div.append($('<input>', {type : "text", id : "deptNameUp", "data-value" : val.DEPT_NO, value : val.DEPT_NAME}))
					div.append($('<button>', {id : "deptUpdate", text : "수정"}))
				}
			});
			
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

// 동일한 부서명 체크
function selectDeptName() {
	var params = {
			deptName : $("#deptNameUp").val()
		};
	$.ajax({
		url : "selectDeptName.se",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			
		},
		success : function(data) {
			if (data > 0) {
				alert("같은 이름의 부서명이 존재합니다.");
			}
			else if (data == 0) {
				deptUpdate();
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

// 부서명 수정
function deptUpdate() {
	var params = {
			deptNo : $("#deptNameUp").attr("data-value"),
			deptName : $("#deptNameUp").val()
		};
	$.ajax({
		url : "deptUpdate.up",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			
		},
		success : function(data) {
			if (data > 0) {
				alert("부서명 수정을 성공하였습니다.");
				deptList();
			}
			else if (data == 0) {
				alert("부서명 수정을 실패하였습니다.");
			}
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

// 부서명 삭제
function deptDelete(data) {
	var params = {
			deptNo : data
		};
	
	$.ajax({
		url : "deptDelete.de",
		type : "POST",
		dataType : "text",
		data : JSON.stringify(params),
		contentType : "application/json; charset=UTF-8",
		beforeSend : function() {
			
		},
		success : function(data) {
			
			if (data > 0) {
				alert("부서 삭제를 성공하였습니다.");
				deptList();
			}
			else if (data == 0) {
				alert("부서 삭제를 실패하였습니다.");
			}
			else if (data == -1) {
				alert("부서에 임직원이 존재하여 삭제할 수 없습니다.");
			}
			
		},
		error : function(request, status, error) {
			alert("list search fail :: error code: "
					+ request.status + "\n" + "error message: "
					+ error + "\n");
		}
	});
}

/* 다음 주소 API 
function addrSearch() {
	new daum.Postcode({
		oncomplete : function(data) {
			var str = "[" + data.zonecode + "] " + data.address
			//$("#stf_cm_add").val(str);
			//$("#stf_cm_add_up").val(str);
		}
	}).open();
}
*/    	
</script>
</head>
<body>
	<div id="header-layout">
    	<jsp:include page="../common/header.jsp" />

    </div>
	    <div id="container">
	    <!-- Department Modal -->
		<div class="modal fade" id="departmentModal" role="dialog">
			<div class="modal-dialog modal-m">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" id="deptClose" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">조직 관리</h4>
					</div>
					<div class="modal-body">
						<div id="deptNo_dept" class="form-group well">
							<c:forEach items="${selectDept}" var="map">
								<div class="has-feedback">
									<div class="deptDiv" data-value="${map.DEPT_NO}">${map.DEPT_NAME}</div>
									<span class="glyphicon glyphicon-remove form-control-feedback small-icon"></span>
								</div>
							</c:forEach>
						</div>
						<div class="form-group overError">
							<div class="col-xs-10 col-md-10 leftNoPadding">
							    <!--  <input type="hidden" id="addDeptNo" name="deptNo"> -->
								<input type="text" id="addDept" class="form-control" placeholder="부서명">
							</div>
	
							<button type="button" id="deptInsert"
								class="btn btn-success col-xs-2 col-md-2 leftNoPadding rightNoPadding">추가</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Insert Modal -->
		<div class="modal fade" id="insertModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">구성원 추가</h4>
					</div>
					<div class="modal-body">

						<table class="tableMiddle table table-striped table-bordered ">
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<thead>
							</thead>
							<form id="officerInsertForm" action="officerInsert.in"
								method="post" enctype="multipart/form-data">
								<tbody>
									<tr>
										<th class="text-center"><img id="imgView" class="profileImg"
											src="resources/images/user.png"> <input type="file"
											id="file" name="file" class="form-control"></th>
										<td>
											<h5>이미지는 가로 96px, 세로 128px를 준수 해주시기 바랍니다.</h5>
											<h5>(*)이 작성된 칸은 필수항목 입니다.</h5>
										</td>
									</tr>
									<tr>
										<th>이름(*)</th>
										<td><input type="text" id="memberName" name="memberName"
											class="form-control" placeholder="이름"></td>
									</tr>
									<!--  
									<tr>
										<th>비밀번호(*)</th>
										<td>
											<div id="memberPwd1_Div">
												<input type="password" id="memberPwd1" class="form-control"
													placeholder="비밀번호"> <span id="memberPwd1_Span"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인(*)</th>
										<td><input type="password" id="memberPwd2"
											class="form-control" placeholder="비밀번호 확인"> <input
											type="hidden" id="memberPwd" name="memberPwd" class="form-control"
											placeholder="비밀번호"></td>
									</tr>
									-->
									<tr>
										<th>사원번호(*)</th>
										<td>
											<div class="col-sm-9 col-md-10 leftNoPadding">
												<div id="memberNo_Div">
													<input type="text" id="memberNo1" class="form-control"
														placeholder="사원번호"> <span id="memberNo_Span"></span>
												</div>
											</div>

											<button type="button" id="stfNumSearchBtn"
												class="btn btn-default col-sm-3 col-md-2">중복확인</button> <input
											type="hidden" id="memberNo" name="memberNo" class="form-control">
										</td>
									</tr>
									<!--  
									<tr>
										<th>권한(*)</th>
										<td><select id="admn_sq" name="admn_sq"
											class="form-control">
												<c:forEach items="${selectAdmn_Tb}" var="map">
													<option value="${map.ADMN_SQ}">${map.ADMN_PW}</option>
												</c:forEach>
										</select></td>
									</tr>
									-->
									<tr>
										<th>부서(*)</th>
										<td><select id="deptNo" name="deptNo"
											class="form-control">
												<c:forEach items="${selectDept}" var="map">
													<option value="${map.DEPT_NO}">${map.DEPT_NAME}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>직급(*)</th>
										<td><select id="rankNo" name="rankNo"
											class="form-control">
												<c:forEach items="${selectRank}" var="map">
													<option value="${map.RANK_NO}">${map.RANK_NAME}</option>
												</c:forEach>
										</select></td>
									</tr>
									<!--
									<tr>
										<th>주소(*)</th>
										<td>

											<div class="col-sm-9 col-md-10 leftNoPadding">
												<input type="text" id="stf_cm_add" name="stf_cm_add"
													class="form-control" placeholder="주소" readonly="readonly">
											</div>
											<button type="button"
												class="btn btn-default col-sm-3 col-md-2"
												onclick="addrSearch();">주소검색</button>
										</td>
									</tr>
									 
									<tr>
										<th>상세주소(*)</th>
										<td><input type="text" id="stf_dt_add" name="stf_dt_add"
											class="form-control" placeholder="상세주소"></td>
									</tr>
									-->
									<tr>
										<th>이메일(*)</th>
										<td><input type="email" id="email" name="email"
											class="form-control" placeholder="이메일"></td>
									</tr>

									<tr>
										<th>휴대폰(*)</th>
										<td>

											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<select id="phoneNum1" class="form-control">
													<option value="010">010</option>
												</select>
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum2" class="form-control telNumMax" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum3" class="form-control telNumMax" />
											</div> <input type="hidden" id="phone" name="phone"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>내선번호</th>
										<td>
											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<input type="text" id="telNum1" class="form-control"
													value="070" readonly="readonly" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum2" class="form-control telNumMax" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum3" class="form-control telNumMax" />
											</div> <input type="hidden" id="telephone" name="telephone"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>입사일(*)</th>
										<td><input type="date" id="enrollDate" name="enrollDate"
											class="form-control" placeholder="입사일"></td>
									</tr>
								</tbody>
							</form>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="officerInsert" class="btn btn-success">등록</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Update Modal -->
		<div class="modal fade" id="updateModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">구성원 수정</h4>
					</div>
					<div class="modal-body">

						<table class="tableMiddle table table-striped table-bordered">
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<thead>
							</thead>
							<form id="officerUpdateForm" action="officerUpdate.up"
								method="post" enctype="multipart/form-data">
								<tbody>
									<tr>
										<th class="text-center"><img id="imgView_up" class="profileImg"
											src="resources/images/user.png"> <input type="file"
											id="file_up" name="file" class="form-control"></th>
										<td>
											<h5>이미지는 가로 96px, 세로 128px를 준수 해주시기 바랍니다.</h5>
											<h5>(*)이 작성된 칸은 필수항목 입니다.</h5>
											<h5><strong>프로필 사진</strong>, <strong>비밀번호</strong>, <strong>사원번호</strong>는
											공백일 경우 기존 데이터로 유지됩니다.</h5>
										</td>
									</tr>
									<tr>
										<th>이름(*)</th>
										<td><input type="text" id="memberName_up" name="memberName"
											class="form-control" placeholder="이름"></td>
									</tr>
									<!-- 
									<tr>
										<th>비밀번호(*)</th>
										<td>
											<div id="memberPwd1_Div_up">
												<input type="password" id="memberPwd1_up" class="form-control"
													placeholder="비밀번호"> <span id="memberPwd1_Span_up"></span>
											</div>
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인(*)</th>
										<td><input type="password" id="memberPwd2_up"
											class="form-control" placeholder="비밀번호 확인"> <input
											type="hidden" id="memberPwd_up" name="memberPwd" class="form-control"
											placeholder="비밀번호"></td>
									</tr>
									-->
									<tr>
										<th>사원번호(*)</th>
										<td>
											<input
											type="hidden" id="memberNo_old" name="memberNo_old" class="form-control">
											<div class="col-sm-9 col-md-10 leftNoPadding">
												<div id="memberNo_Div_up">
													<input type="text" id="memberNo1_up" class="form-control"
														placeholder="사원번호"> <span id="memberNo_Span_up"></span>
												</div>
											</div>

											<button type="button" id="stfNumSearchBtn_up"
												class="btn btn-default col-sm-3 col-md-2">중복확인</button> <input
											type="hidden" id="memberNo_up" name="memberNo" class="form-control">
											
										</td>
									</tr>
									<!--  
									<tr>
										<th>권한(*)</th>
										<td><select id="admn_sq_up" name="admn_sq"
											class="form-control">
												<c:forEach items="${selectAdmn_Tb}" var="map">
													<option value="${map.ADMN_SQ}">${map.ADMN_PW}</option>
												</c:forEach>
										</select></td>
									</tr>
									-->
									<tr>
										<th>부서(*)</th>
										<td><select id="deptNo_up" name="deptNo"
											class="form-control">
												<c:forEach items="${selectDept}" var="map">
													<option value="${map.DEPT_NO}">${map.DEPT_NAME}</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>직급(*)</th>
										<td><select id="rankNo_up" name="rankNo"
											class="form-control">
												<c:forEach items="${selectRank}" var="map">
													<option value="${map.RANK_NO}">${map.RANK_NAME}</option>
												</c:forEach>
										</select></td>
									</tr>
									<!--  
									<tr>
										<th>주소(*)</th>
										<td>

											<div class="col-sm-9 col-md-10 leftNoPadding">
												<input type="text" id="stf_cm_add_up" name="stf_cm_add"
													class="form-control" placeholder="주소" readonly="readonly">
											</div>
											<button type="button"
												class="btn btn-default col-sm-3 col-md-2"
												onclick="addrSearch();">주소검색</button>
										</td>
									</tr>
									
									<tr>
										<th>상세주소(*)</th>
										<td><input type="text" id="stf_dt_add_up" name="stf_dt_add"
											class="form-control" placeholder="상세주소"></td>
									</tr>
									-->
									<tr>
										<th>이메일(*)</th>
										<td><input type="email" id="email_up" name="email"
											class="form-control" placeholder="이메일"></td>
									</tr>

									<tr>
										<th>휴대폰(*)</th>
										<td>

											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<select id="phoneNum1_up" class="form-control">
													<option value="010">010</option>
												</select>
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum2_up" class="form-control telNumMax" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="phoneNum3_up" class="form-control telNumMax" />
											</div> <input type="hidden" id="phone_up" name="phone"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>내선번호</th>
										<td>
											<div class="col-sm-2 col-md-2 leftNoPadding rightNoPadding">
												<input type="text" id="telNum1_up" class="form-control"
													value="070" readonly="readonly" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum2_up" class="form-control telNumMax" />
											</div>
											<div
												class="col-sm-1 col-md-1 text-center leftNoPadding rightNoPadding">
												<h5>-</h5>
											</div>
											<div class="col-sm-4 col-md-4 leftNoPadding rightNoPadding">
												<input type="text" id="telNum3_up" class="form-control telNumMax" />
											</div> <input type="hidden" id="telephone_up" name="telephone"
											class="form-control">
										</td>
									</tr>
									<tr>
										<th>입사일(*)</th>
										<td><input type="date" id="enrollDate_up" name="enrollDate"
											class="form-control" placeholder="입사일"></td>
									</tr>
								</tbody>
							</form>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" id="officerUpdate" class="btn btn-success">수정</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        	<br>
               		 <div id="leftTop">
						<h2>
							<label>조직도</label>
						</h2>
						<button type="button" class="btn btn-warning pull-right" data-toggle="modal"
								 data-backdrop="static" data-target="#departmentModal" style="font-size:13px;">관리</button>
					</div>
	                    <br><br>
	                    <div>
	                        <ul class="easyui-tree">
	                        <li><span>부서명</span>
	                        <ul>
	                        <br>
		                        <c:forEach items="${selectDept}" var="dptmap">
										<li data-options="state:'closed'"><span>${dptmap.DEPT_NAME}</span>
											<ul>
												<c:forEach items="${selectMember}" var="stfmap">
													<c:if test="${dptmap.DEPT_NAME eq stfmap.DEPT_NAME}">
														<li>[${stfmap.DEPT_NAME}/${stfmap.RANK_NAME}]
															${stfmap.MEMBER_NAME}</li>
													</c:if>
												</c:forEach>
											</ul></li>
									</c:forEach>
								</ul></li>
	                    </ul>
                	</div>

	        	</div>
	        </div>
	
	        <div id="content-layout">
				
			    <div id="rightMenu" class="col-sm-14 col-md-9">
					<div class="row">
						<div class="col-sm-7 col-md-5">
						 
							<!--  <button type="button" id="officerInsertModal"
								class="btn btn-primary" data-toggle="modal" data-backdrop="static"
								data-target="#insertModal" style="font-size:13px;">구성원 추가</button>-->
							<button type="button" id="officerUpdateModal" class="btn btn-success"  
								data-backdrop="static" data-toggle="modal" style="font-size:13px;">구성원 수정</button>
							<!-- <button type="button" class="btn btn-danger">구성원 삭제</button> -->
						</div>
						<div class="col-sm-11 col-md-7 text-right" >
							<form id="rightTop" class="form-inline" onsubmit="return false;">
								<!-- <button type="button" id="search" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
								</button>
								<input id="keyword" type="text" class="form-control"
									placeholder="Search"> -->
								<select id="cate" class="form-control" style="font-size:13px;">
									<option value="1">이름</option>
									<option value="2">직급</option>
									<option value="3">부서</option>
								</select>

								<div class="input-group">      <!-- 구성원 검색 -->
									<input type="text" id="keyword" class="form-control"
										placeholder="Search" style="font-size:13px;">
									<div class="input-group-btn">
										<button type="button" class="btn btn-default" id="search">
											<i class="glyphicon glyphicon-search" style="font-size:13px;"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<br>
					<div id="rightBottom">
						<div style="font-size:15px;">
							<label>전체 : </label> <span id="userCount">${officerListCount}</span>명
						</div>
						<div class="table-responsive">
							<table id="officerList" class="tableMiddle table table-hover" style="font-size:12px;">
								<colgroup>
									<col width="5%" />
									<col width="96px" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<!--<col width="10%" />-->
									<col width="15%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr class="active">
										<th>선택</th>
										<th>사진</th>
										<th>이름</th>
										<th>직급</th>
										<th>조직</th>
										<!--  <th>권한</th>-->
										<th>핸드폰번호</th>
										<th>내선번호</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${officerList}" var="map">
										<tr>
											<td><input type="radio" class="radio"
												value="${map.MEMBER_NO}"></td>
											<td><img src="${map.FILEPATH}" class="profileImg"/></td>
											<td>${map.MEMBER_NAME}</td>
											<td>${map.RANK_NAME}</td>
											<td>${map.DEPT_NAME}</td>
											<!--<td>${map.ADMN_PW}</td>-->
											<td>${map.PHONE}</td>
											<td>${map.TELEPHONE}</td>
											<td>${map.EMAIL}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="pageIndexList" class="text-center">
							${pageIndexList }
						</div>
					</div>

                

	    	</div>
	    </div>
	    


    
</body>
</html>