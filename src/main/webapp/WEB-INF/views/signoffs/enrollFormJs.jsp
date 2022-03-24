<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
var index = 0;
searchedMembers = []; //검색 전 빈 배열
addedMembers = []; //검색 결과 배열
var arr = [];
var memberTargetSignoffsIndex = -1;

searchMember('', '', onMemberDataUpdated); //이름, 부서,

$(document).ready(function () {
	$('body').on('click', '.x-btn', function () {
		$(this).parent().remove();
		var fileIndex = $(this).attr('data-file-index');
		$('#file_' + fileIndex).remove();
	})

	$('#projectMemberBtn').on("click", function() {
		$('#searchMember').modal('show');
	})
	
	//
	$('#searchMember').on('click', '[data-member]', onClickSearchedMember)

	$('#closeBtn').on('click', function() {
		$(this).parents('.modal').modal('hide');
	})
});

function attachFile() {
	if($('#fileList').children().length === 3) {
		alert("첨부파일은 3개까지 가능합니다.");
		return;
	}
	
	var createFile = document.createElement("input");
	createFile.id = "file_" + index;
	createFile.name= 'attachment';
	createFile.type = "file";
	createFile.style.display = "none";

	createFile.onchange = function() {
		var html = '<li>' + this.files[0].name + '<button type="button" class="x-btn" data-file-index="'+index+'">X</button></li>'
		$('#fileList').append(html);
	};

	document.getElementById('enrollForm').appendChild(createFile);
	createFile.click();
	index++;
}

function changeFormat(target) {
	window.location.href = 'signoffs.docu?format=' + target.value;
}

function selectMemberModal(index) {
	$('#searchMember').modal('show');
	memberTargetSignoffsIndex = index;
}

function onClickSearchedMember() {
	var memberNo = $(this).attr('data-member');
	var memberName = $(this).children().eq(1).text().trim(); 
	$('[data-index="'+memberTargetSignoffsIndex+'"]').text(memberName);
	$('#searchMemberResult').empty();
	$('#searchMember').modal('hide');
	$('[data-signoffs-index="'+memberTargetSignoffsIndex+'"]').val(memberNo);
}


//사원 검색 - 
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

//검색결과
function onMemberDataUpdated(members) {
	var memberTable = document.getElementById('tbMembers');
	memberTable.innerHTML = ''; //memberTable 비우고
	//반복문으로 결과값 출력
	for (var i = 0; i < members.length; i++) {
		memberTable.innerHTML += '<tr data-member="'+members[i].memberNo+'">'
				+ '<td><i class="xi-profile xi-3x"></i></td>' + '<td>'
				+ members[i].memberName + '</td>'
				+ '<td style="margin:10px">' + members[i].deptName
				+ '/' + members[i].rankNo + '</td>' + '</tr>'
	}
}

function submitDocument() {
	
	var docuFormat = $('#docuFormat').val();
	
	if (docuFormat == 1) {
		var teamLeaderSignoffs = $('[data-signoffs-index="1"]');
		var secondSignoffs = $('[data-signoffs-index="2"]');
		
		if (!teamLeaderSignoffs.val()) {
			alert("부장 서명을 확인해주세요.");
			return;
		}
		
		if (!secondSignoffs.val()) {
			alert("차장 서명을 확인해주세요.");
			return;
		}
	} else if (docuFormat == 2) {
		var teamLeaderSignoffs = $('[data-signoffs-index="1"]');

		if (!teamLeaderSignoffs.val()) {
			alert("부장 서명을 확인해주세요.");
			return;
		}
	}
	
	$('#enrollForm').submit();
}
</script>