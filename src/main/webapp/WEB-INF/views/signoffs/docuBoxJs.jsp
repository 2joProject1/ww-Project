<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function () {
		$('[data-toggle="collapse"]').on('click', function () {
			var dataIndex = $(this).attr('data-index');
			$('.box-radio-input-hidden').removeClass('show');
		});
	});
	
	function goDocument(docuNo) {
		window.location.href = 'docubox.detail?docuNo=' + docuNo;
	}
	
	function submitDocu() {
		var checkedDocubox = $('[name="docubox"]:checked').val();

		if (checkedDocubox == 'status') {
			if (!$('[name="approvalDecision"]:checked').val()) {
				alert("결재양식을 선택해주세요.");
				return;
			}
			window.location.href = window.location.pathname + '?approvalDecision=' + $('[name="approvalDecision"]:checked').val();
		} else if (checkedDocubox == 'day') {
			if (!$('#docuWriteStartDate').val()) {
				alert("시작일자를 선택해주세요.");
				return;
			}
			if (!$('#docuWriteEndDate').val()) {
				alert("종료일자를 선택해주세요.");
				return;
			}
			window.location.href = window.location.pathname + '?docuWriteStartDate=' + $('#docuWriteStartDate').val()
				+ '&docuWriteEndDate=' + $('#docuWriteEndDate').val();
		} else if (checkedDocubox == 'format') {
			if (!$('[name="docuFormat"]:checked').val()) {
				alert("결재상태를 선택해주세요.");
				return;
			}
			window.location.href = window.location.pathname + '?docuFormat=' + $('[name="docuFormat"]:checked').val();
		} else {
			alert("검색 항목을 선택해주세요.");
		}
	}
</script>