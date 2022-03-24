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
</script>