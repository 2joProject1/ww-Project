<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WALK-WORK</title>
<!-- 부트스트랩관련 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<!-- <link rel="stylesheet" href="resources/css/communityWriteForm.css"> -->
<style>
.community_write_title{
	border: none;
    width: 100%;
    font-size: 30px;
    font-weight: bold;
}

.community_write_title:focus {
	outline: none;
}

.community_write_content{
	border: none;
    width: 100%;
    height:300px;
    font-size: 12px;
    resize : none;
}

.community_write_content:focus {
	outline: none;
}

#CommunityInsertForm{
	margin : 20px 0 0 20px;
}


.file_pic_information:focus{
	outline : none;
}
.cm_file{
	display: none;
}
.wt_x:hover{
	cursor: pointer;
}

.cm_images{
	width : 100%;
	height : 100%;
}
#cm_submit{
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
	<div id="header-layout">
		<jsp:include page="../common/header.jsp" />
	</div>

	<div id="container">
		<jsp:include page="../community/communitySidebar.jsp" />
		
		<div id="content-layout">
			<div class="container">
		<div class="row">
			<div class="col-10">
				<h1>글 작성</h1>
			</div>
			<div class="col-2" class="wt_x" onclick="location.href='list.co'">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="float:right">
  						<path fill-rule="evenodd"
						d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z" />
 						 <path fill-rule="evenodd"
						d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z" />
				</svg>
			</div>
		</div>
	</div>

	<form id="CommunityInsertForm" method="post" action="insert.co" onsubmit="return cm_submitFiles()">
		<div>
			<input type="text" placeholder="제목" class="community_write_title"
				name="boardTitle" required>
		</div>

		<hr>

		<div>
			<textarea placeholder="내용을 입력하세요" class="community_write_content"
				name="boardContent" required></textarea>

			<div class="row">
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px" class="col-2">
					<img alt="img1" src="" id="cm_img1" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px" class="col-2">
					<img alt="img2" src="" id="cm_img2" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px" class="col-2">
					<img alt="img3" src="" id="cm_img3" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div class="col-6">
					<div>
						<input type="file" id="cm_file" class="cm_file" onchange="cm_fileChange()" 
							accept="image/gif, image/jpeg, image/jpg, image/png"
						multiple/>
						<label for="cm_file">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
						</label>
						<span id="cm_file_name"></span>
							<div onclick="cancelFileBtn()">X</div>
					</div>
				</div>
			</div>

		</div>
		<div>
			<input type="hidden" id="fileName"  name="fileName"/>
			<input type="hidden" id="fileOriginName" name="fileOriginName"/>
			<input type="hidden" id="filePath" name="filePath"/>
			<input type="hidden" id="fileSize" name="fileSize"/>
			
			<input type="hidden" id="fileName2"  name="fileName"/>
			<input type="hidden" id="fileOriginName2" name="fileOriginName"/>
			<input type="hidden" id="filePath2" name="filePath"/>
			<input type="hidden" id="fileSize2" name="fileSize"/>
			
			<input type="hidden" id="fileName3"  name="fileName"/>
			<input type="hidden" id="fileOriginName3" name="fileOriginName"/>
			<input type="hidden" id="filePath3" name="filePath"/>
			<input type="hidden" id="fileSize3" name="fileSize"/>
				
		<!-- 	<input type="button" onclick="cm_submitFiles()"/> -->
		</div>

		<hr>
		<div class="container">
			<div class="row">
				<div class="col" style="text-align: right;">
					<button type="submit" id="cm_submit" >완료</button>
				</div>
			</div>

		</div>
	</form>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(){
			$('#cm_file').on("change", cm_filefunc);
		});
		
		
		function cancelFileBtn(){
			$('#fileName').val('');
			$('#fileOriginName').val('');
			$('#filePath').val('');
			$('#fileSize').val('');
			
			$('#fileName2').val('');
			$('#fileOriginName2').val('');
			$('#filePath2').val('');
			$('#fileSize2').val('');
			
			$('#fileName3').val('');
			$('#fileOriginName3').val('');
			$('#filePath3').val('');
			$('#fileSize3').val('');
			
			$('#cm_img1').attr("src", '');
			$('#cm_img1').css('display', 'none');
			
			$('#cm_img2').attr("src", '');
			$('#cm_img2').css('display', 'none');
			
			$('#cm_img3').attr("src", '');
			$('#cm_img3').css('display', 'none');
			
			$('#cm_file').val('');
			
			$('#cm_file_name').text('');
		}
		
		// 파일 업로드
		function cm_submitFiles(){
			var result = false;
			var form = new FormData();
			for(var i=0; i<$('#cm_file')[0].files.length; i++){
				form.append("file1", $('#cm_file')[0].files[i]);
			}
			
			// 파일개수 3개로 제한하는 코드
			// file1 에 배열로 담아서 3개다 보냄  List<MultipartFile>로 받아서 반복문 돌릴 예정
		 $.ajax({
				url : "insert.ac",
				type : "POST",
				processData : false,
				contentType : false,
				async : false,
				enctype : 'multipart/form-data',
				data : form,
				success:function(data){
					for(var j=0; j<data.length; j++){
						if(j===0){
							$('#fileName').val(data[0].fileName);
							$('#fileOriginName').val(data[0].fileOriginName);
							$('#filePath').val(data[0].filePath);
							$('#fileSize').val(data[0].fileSize);
						}else if(j===1){
							$('#fileName2').val(data[1].fileName);
							$('#fileOriginName2').val(data[1].fileOriginName);
							$('#filePath2').val(data[1].filePath);
							$('#fileSize2').val(data[1].fileSize);
						}else if(j===2){
							$('#fileName3').val(data[2].fileName);
							$('#fileOriginName3').val(data[2].fileOriginName);
							$('#filePath3').val(data[2].filePath);
							$('#fileSize3').val(data[2].fileSize);
						}
						
					}
									
					if($('#fileName').val() != null){
						result= cm_write_success();
					}
				},
				error : function(jqXHR,txt){
					result= cm_write_success();

				}
			})
			
			return result;
		}
		
		// 파일 미리보기
		function cm_filefunc(e){
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f, index){
				var reader = new FileReader();
				
				reader.onload = function(e){
					if(index === 0){
						$('#cm_img1').attr("src", e.target.result);
						$('#cm_img1').css('display', '');
					}else if(index === 1){
						$('#cm_img2').attr("src", e.target.result);
						$('#cm_img2').css('display', '');
					}else {
						$('#cm_img3').attr("src", e.target.result);
						$('#cm_img3').css('display', '');
					}
				}
				reader.readAsDataURL(f);
			})	
		}
		
		// 파일명 나열
		function cm_fileChange(){
			var data = $('#cm_file')[0].files;
			var name='';
			for(var i=0; i<data.length; i++){
				name += data[i].name;
				if(i < data.length-1){
					name += ", ";
				}
			}
			$('#cm_file_name').text(name);
		}
		
		
		
		// 작성 완료 확인창
		function cm_write_success(){
			var s = false;
			var submitOK = confirm('글 작성을 완료하시겠습니까?');
			if(submitOK){
				s = true;
			}
			return s;
		}
	
		
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</body>
</html>