<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
var index = 0;
var searchedMembers = []; //검색 전 빈 배열
var memberTargetSignoffsIndex = -1; //false값

searchMember('', '', onMemberDataUpdated); //이름, 부서,
searchDept('', onDeptDataUpdated); //이름, 부서,

//파일첨부시 개별 삭제
$(document).ready(function () {
	$('body').on('click', '.x-btn', function () {
		$(this).parent().remove();
		var fileIndex = $(this).attr('data-file-index');
		$('#file_' + fileIndex).remove();
	})
	
	//사원검색, 부서검색
	$('#searchMember').on('click', '[data-member]', onClickSearchedMember)
	$('#searchDept').on('click', '[data-dept]', onClickSearchedDept)
	
	//모달창 닫기
	$('#closeBtn, #closeBtnDept').on('click', function() {
		$(this).parents('.modal').modal('hide');
	})
});


//클릭해서 파일 첨부하기
function attachFile() {
	if($('#fileList').children().length === 3) {
		alert("첨부파일은 3개까지 가능합니다.");
		return;
	}
	
	//"파일"타입 생성하고 리스트에 추가
	var createFile = document.createElement("input");
	createFile.id = "file_" + index;
	createFile.name= 'attachment';
	createFile.type = "file";
	createFile.style.display = "none";
	
	//리스트에 추가 형식
	createFile.onchange = function() {
		var html = '<li>' + this.files[0].name + '<button type="button" class="x-btn" data-file-index="'+index+'">X</button></li>'
		$('#fileList').append(html);
	};

	document.getElementById('enrollForm').appendChild(createFile);
	createFile.click(); //첨부클릭할때마다
	index++; //data-file-index 값 하나씩 올리기
}

//문서형식 변경
function changeFormat(target) {
	window.location.href = 'signoffs.docu?format=' + target.value;
}

//부서검색 모달 열기
function selectDeptModal() {
	$('#searchDept').modal('show');
}

//사원검색 모달 열기 + 클릭한 사원 인덱스 가져오기
function selectMemberModal(index) {
	$('#searchMember').modal('show');
	memberTargetSignoffsIndex = index; //해당사원 인덱스
}

//수신부서 검색
function onClickSearchedDept() {
	var deptNo = $(this).attr('data-dept');
	var deptName = $(this).children().eq(0).text().trim(); 
	$('#signoffsDept').text(deptName);
	$('#signoffsDeptNo').val(deptNo);
	$('#searchDeptResult').empty();
	$('#searchDept').modal('hide');
}

//결재선 - 사원검색 후 선택
function onClickSearchedMember() {
	var memberNo = $(this).attr('data-member');
	var memberName = $(this).children().eq(1).text().trim(); 

	var list = $('[data-signoffs-index]');
	for (var i=0; i<list.length; i++) {
		if (list.eq(i).val() == memberNo) {
			alert("중복된 사용자를 추가할 수 없습니다.");
			return;
		}
	}

	$('[data-index="'+memberTargetSignoffsIndex+'"]').text(memberName);
	$('#searchMemberResult').empty();
	$('#searchMember').modal('hide');
	$('[data-signoffs-index="'+memberTargetSignoffsIndex+'"]').val(memberNo);
}

//수신부서 검색 - 
function searchDept(dept, callback) {
	$.ajax({
		url : "docubox.searchDept?dept=" + dept,
		success : function(res) {
			callback(res.depts);
		},
		error : function() {
			$('#searchDeptResult').html("조회 결과가 없습니다");
		}
	})
}

//사원 및 부서 키워드 검색
function searchMember(name, dept, callback) {
	$.ajax({
		url : "search.member?name=" + name + "&dept=" + dept,
		success : function(res) {
			searchedMembers = res.members;
			callback(res.members);
		},
		error : function() {
			$('#searchMemberResult').html("조회 결과가 없습니다");
		}
	})
}

//검색에서 끝났을때
function onSearchKeyUp() {
	var searchString = document.getElementById('ipSearchMemberText').value; //검색값
	searchMember(searchString, searchString, onMemberDataUpdated); //이름, 부서, 결과값
}

//수신부서 - 검색에서 끝났을때
function onSearchKeyUpDept() {
	var searchString = document.getElementById('ipSearchDeptText').value; //검색값
	searchDept(searchString, onDeptDataUpdated); //이름, 부서, 결과값
}

//검색결과
function onMemberDataUpdated(members) {
	var memberTable = document.getElementById('tbMembers');
	memberTable.innerHTML = ''; //memberTable 비우고
	//반복문으로 결과값 출력
	console.log(members);
	for (var i = 0; i < members.length; i++) {
		if ($('#loginMemberNo').val() != members[i].memberNo) //본인은 선택할 수 없도록
		memberTable.innerHTML += '<tr data-member="'+members[i].memberNo+'">'
				+ '<td><i class="xi-profile xi-3x"></i></td>' + '<td>'
				+ members[i].memberName + '</td>'
				+ '<td style="margin:10px">' + members[i].deptName
				+ '/' + members[i].rankName + '</td>' + '</tr>'
	}
}

//검색결과
function onDeptDataUpdated(depts) {
	var deptTable = document.getElementById('tbDepts');
	deptTable.innerHTML = ''; //deptTable 비우고
	//반복문으로 결과값 출력
	for (var i = 0; i < depts.length; i++) {
		if (depts[i].deptNo != 0) {
			deptTable.innerHTML += '<tr data-dept="'+depts[i].deptNo+'">'
			+ '<td style="margin:10px">' + depts[i].deptName
			+ '</td>' + '</tr>'
		}
	}
}

//문서 기안
function submitDocument() {
	
	//문서형식 뽑아오기
	var docuFormat = $('#docuFormat').val();
	var signoffsDeptNo = $('#signoffsDeptNo').val();
	
	if (signoffsDeptNo == 0) {
		alert("수신 부서를 선택해주세요.");
		return;
	}
	
	//문서형식이 1일때(기안문서)
	if (docuFormat == 1) {
		var teamLeaderSignoffs = $('[data-signoffs-index="1"]'); //부장서명
		var secondSignoffs = $('[data-signoffs-index="2"]'); //차장서명
		
		if (!teamLeaderSignoffs.val()) { //부장서명이 아니면
			alert("부장 서명을 확인해주세요.");
			return;
		}
		
		if (!secondSignoffs.val()) { //차장서명이 아니면
			alert("차장 서명을 확인해주세요.");
			return;
		}
	//문서형식이 2일때(품의서)
	} else if (docuFormat == 2) {
		var teamLeaderSignoffs = $('[data-signoffs-index="1"]'); //부장서명만
	
		if (!teamLeaderSignoffs.val()) { //부장서명이아니면
			alert("부장 서명을 확인해주세요."); 
			return;
		}
	}
	
	//전송
	$('#enrollForm').submit(); 
}
</script>