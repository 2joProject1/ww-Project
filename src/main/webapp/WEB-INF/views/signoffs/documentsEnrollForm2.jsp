<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#content-layout{
		border: 1px solid lightgray;
		height: 60%;
		padding: 30px;
		margin-left: 30px;
	}
	
	#docu-header-area{
		width: 100%;
		display: inline-block;
	}                                 
	
	#docu-basic-area{
		width: 600px;
		height: 100%;
		font-size: 16pt;
		float: left;
	}
	
	#docu-signoff-area{
		width: 500px;
		height: 100%;
		font-size: 16pt;
		float: right;
		padding-left: 25px;
	}
	
	#docu-format{
		width: 160px;
	}
	
	.signoff-table-area{
		border: 1px solid black;
		width: 450px;
		height: 130px;
		font-size: 14pt;
		text-align: center;
	}
	
	#docu-content{
		font-size: 16pt;
	}
	
	.docu-content-teaxarea{
		width: 1050px;
		height: 300px;
		vertical-align: top;
	}
	
	#docuTitle{
		width: 1050px;
	}
	
	#button-area{
		padding-left: 35%;
		
	}
	
	button{
		width: 130px;
		height: 40px;
		border-radious: 15px;
		border: none;
	}
	
	#draftDocu{
		background-color: rgb(102, 164, 166);
	}
	
	
</style>

	
</head>
<body>
	<div id="header-layout">
        	<jsp:include page="../common/header.jsp" />

        </div>
	    <div id="container">
	        <div id="sidebar-layout">
	        	<div id="main-sidebar">
	        	<br>
	        		전자결재<br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="signoffs.docu">문서작성하기</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">기안문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">수신문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">부서문서함</a><br>
	        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">반려문서함</a><br>
	        	</div>
	        </div>
	
	        <div id="content-layout">
	        	<form action="" method="post">
	        	<div id="docu-header-area">
		        	<div id="docu-basic-area">
		        		<br>
			        	<h2>&nbsp;문서작성</h2>
			        	<hr>
			        	<b>형식</b>&nbsp;
			        	<select id="docu-format" onchange="changeFormat(this)">
			        		<option value="1">기안문서</option>
			        		<option value="2" selected>품의서</option>
			        	</select>
			        	
			        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	<b>문서보존기간</b>&nbsp;&nbsp;5년<br>
			        	
			        	<b>문서번호</b>&nbsp;&nbsp;20220307-1-113
			        	
			        	&nbsp;&nbsp;&nbsp;<b>수신부서</b>&nbsp;&nbsp;재무기획팀<br>
			        	
			        	<b>품의일자</b>&nbsp;&nbsp;2022-03-01
			        	
			        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	<b>소속</b>&nbsp;&nbsp;개발팀
		        	</div>
		        	
		        	<br>
		        	<div id="docu-signoff-area">
		        		<table class="signoff-table-area" border="1">
		        			<tr>
		        				<th rowspan="3">결재</th>
			        			<th>대표이사</th>
			        			<th>팀장</th>
			        			<th>사원</th>
		        			</tr>
		        			<tr>
		        				<td>대표자</td>
		        				<td>서명</td>
		        				<td>서명</td>
		        			</tr>
		        			<tr>
		        				<td>결재일</td>
		        				<td>결재일</td>
		        				<td>결재일</td>
		        			</tr>
		        		</table>
		        	</div>
		        </div>
		        	<br>
		        	<br>
		        	<hr>
		        	<div id="docu-content">
		        		<br>
		        		<b>제목</b>&nbsp;<input type="text" name="" value="" id="docuTitle"><br><br>
		        		<b>내용</b>&nbsp;
		        		<textarea class="docu-content-teaxarea" name="" required></textarea><br><br>
		        		<b>첨부</b>&nbsp;
		        		<button type="button" onclick="attachFile()" style="width: 150px;">파일 첨부하기</button>
		        		<br>
		        		<ul id="fileList"></ul>
		        	</div>
		        	<br>
		        	<div id="button-area">
			        	<button type="reset">취소</button>
			        	<button type="submit" id="draftDocu">기안</button>
		        	</div>
	        	</form>
	        </div>
	    </div>
	    <script>
	    	function attachFile() {
	    		var createFile = document.createElement("input");
	    		createFile.type = "file";
	    		createFile.style.display = "none";
	    		createFile.onchange = function() {
	    			var html = '<li>'+this.files[0].name+'</li>'
	    			$('#fileList').append(html);
	    		};
	    		document.body.appendChild(createFile);
	    		createFile.click();
	    	}
	    	
	    	function changeFormat(target) {
	    		window.location.href = 'signoffs.docu?format=' + target.value;
	    	}
	    </script>
</body>
</html>