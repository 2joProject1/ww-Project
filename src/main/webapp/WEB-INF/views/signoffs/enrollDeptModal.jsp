<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal" id="searchDept">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">부서검색</h4>
				<button id="closeBtnDept" type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<i class="fi fi-rr-search"></i>&nbsp;
				<input id="ipSearchDeptText" type="search" name="" placeholder="부서를 입력해주세요" onkeyup="onSearchKeyUpDept()">
				<br>
				<div class="search-area">
					<table id="tbDepts" class="search-member">

					</table>
				</div>
			</div>
		</div>
	</div>
</div>