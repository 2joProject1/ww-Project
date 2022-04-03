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
<script src="resources/ckeditor5/build/ckeditor.js"></script>
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
   
.cm_fileDelBtn:focus {
	cursor : pointer;
}

.ck-content {
	height: 400px;
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
				<h1>글 수정</h1>
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

	<form id="CommunityInsertForm" method="post" action="modify.co" onsubmit="return cm_submitFiles()">
		<div>
			<input type="text" placeholder="제목" class="community_write_title"
				name="boardTitle" value="${detail.boardTitle }" required>
		</div>

		<hr>

		<div>
			<textarea placeholder="내용을 입력하세요" class="community_write_content"
				name="boardContent" id="cm_writeCK" >${detail.boardContent }</textarea>
			<br><br>
			<div class="row">
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px; margin-left:10px" class="col-2">
					<img alt="img1" src="resources/coFile/${attachment[0].fileName }" id="cm_img1" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px" class="col-2">
					<img alt="img2" src="resources/coFile/${attachment[1].fileName }" id="cm_img2" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div style="border: 1px solid #CCCCCC; width: 200px; height: 135px" class="col-2">
					<img alt="img3" src="resources/coFile/${attachment[2].fileName }" id="cm_img3" class="cm_images" onerror="this.style.display='none';">
				</div>
				<div class="col-6"></div>
				<div class="col-2">
					<div>
						<input type="file" id="cm_file1" class="cm_file" onchange="cm_fileChange(1);" 
							accept="image/gif, image/jpeg, image/jpg, image/png"/>
						<label for="cm_file1">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
						</label>
						<span id="cm_file_name1"></span><div id="cm_fileDelBtn1" onclick="cancelFile(1)" class="cm_fileDelBtn"><button type="button">X</button></div>
					</div>
				</div>
				<div class="col-2">
					<div>
						<input type="file" id="cm_file2" class="cm_file" onchange="cm_fileChange(2);" 
							accept="image/gif, image/jpeg, image/jpg, image/png"/>
						<label for="cm_file2">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
						</label>
						<span id="cm_file_name2"></span><div id="cm_fileDelBtn2" onclick="cancelFile(2)" class="cm_fileDelBtn"><button type="button">X</button></div>
					</div>
				</div>
				<div class="col-2">
					<div>
						<input type="file" id="cm_file3" class="cm_file" onchange="cm_fileChange(3);" 
							accept="image/gif, image/jpeg, image/jpg, image/png"/>
						<label for="cm_file3">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
						</label>
						<span id="cm_file_name3"></span><div id="cm_fileDelBtn3" onclick="cancelFile(3)" class="cm_fileDelBtn"><button type="button">X</button></div>
					</div>
				</div>
			</div>

		</div>
		<div>
			<input type="hidden" id="fileName"  name="fileName"/>
			<input type="hidden" id="fileOriginName" name="fileOriginName"/>
			<input type="hidden" id="filePath" name="filePath" />
			<input type="hidden" id="fileSize" name="fileSize" />
			<input type="hidden" name="docuNo" value="1"/>
			
			<input type="hidden" id="fileName2"  name="fileName" />
			<input type="hidden" id="fileOriginName2" name="fileOriginName"/>
			<input type="hidden" id="filePath2" name="filePath" />
			<input type="hidden" id="fileSize2" name="fileSize" />
			<input type="hidden" name="docuNo" value="2"/>
			
			<input type="hidden" id="fileName3"  name="fileName" />
			<input type="hidden" id="fileOriginName3" name="fileOriginName" />
			<input type="hidden" id="filePath3" name="filePath"/>
			<input type="hidden" id="fileSize3" name="fileSize"/>
			<input type="hidden" name="docuNo" value="3"/>
			
			<input type="hidden" id="compName1" value="${attachment[0].fileName }" />
			<input type="hidden" id="compName2" value="${attachment[1].fileName }"/>
			<input type="hidden" id="compName3" value="${attachment[2].fileName }"/>
			
			<input type="hidden" id="fileModify1"/>
			<input type="hidden" id="fileModify2"/>
			<input type="hidden" id="fileModify3"/>
			
			<input type="hidden" id="boardNo"  name="boardNo" value="${detail.boardNo }"/>
				
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
	<form id="delAtt" target="delete.ac" method="post">
		<input type="hidden" name="fileName" id="delfileName1">
		<input type="hidden" name="fileName" id="delfileName2">
		<input type="hidden" name="fileName" id="delfileName3">
	</form>
		</div>
	</div>

	<script type="text/javascript">
		var mode = 0;
		var ch1 = false;
		var ch2 = false;
		var ch3 = false;
		$(document).ready(function(){
			$('#cm_file1').on("change", cm_filefunc1);
			$('#cm_file2').on("change", cm_filefunc2);
			$('#cm_file3').on("change", cm_filefunc3);
			
			ClassicEditor
			.create( document.querySelector( '#cm_writeCK' ) )
		    .then( editor => {
		        console.log( editor );
		    } )
		    .catch( error => {
		        console.error( error );
		    } );
			
		});
		
		
		function cancelFile(num){
			
			if(num === 1){
				$('#cm_file1').val('');
				$('#delfileName1').val($('#compName1').val());
				$('#cm_img1').attr("src", '');
				$('#cm_img1').css('display', 'none');
				$('#cm_file_name1').text('');
			}else if(num === 2){
				$('#cm_file2').val('');
				$('#delfileName2').val($('#compName2').val());
				$('#cm_img2').attr("src",'');
				$('#cm_img2').css('display', 'none');
				$('#cm_file_name2').text('');
			}else if(num === 3){
				$('#cm_file3').val('');
				$('#delfileName3').val($('#compName3').val());
				$('#cm_img3').attr("src", '');
				$('#cm_img3').css('display', 'none');
				$('#cm_file_name3').text('');
			}
			
		}
		
		// 파일 업로드
		function cm_submitFiles(){
			var result = false;
			var form = new FormData();
			
			var delData = $('#delAtt').serialize();
			$.ajax({
				url : 'delete.ac',
				type : 'POST',
				data : delData,
				success : function(data){
					console.log(data);
				},
				error : function(err){
					console.log(err);
				}
			})
				
			
			form.append("file1", $('#cm_file1')[0].files[0]);
			form.append("file1", $('#cm_file2')[0].files[0]);
			form.append("file1", $('#cm_file3')[0].files[0]);
			form.append("bno", $('#boardNo').val());
			
			
			// 파일개수 3개로 제한하는 코드
			// file1 에 배열로 담아서 3개다 보냄  List<MultipartFile>로 받아서 반복문 돌릴 예정
		 $.ajax({
				url : "modify.ac",
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
					
					console.log("성공",data);
					
					if($('#fileName').val() != null){
						result= cm_write_success();
					}
				},
				error : function(jqXHR,txt){
					console.log("실패",jqXHR, txt);
					result= cm_write_success();

				}
			})
			
			return result;
		}
		
		// 파일 미리보기
		function cm_filefunc1(e){
			var reader = new FileReader();
			reader.onload = function(e){
					$('#cm_img1').attr("src", e.target.result);
					$('#cm_img1').css('display', '');
			}
			reader.readAsDataURL(e.target.files[0]);
		}
		function cm_filefunc2(e){
			var reader = new FileReader();
			reader.onload = function(e){
					$('#cm_img2').attr("src", e.target.result);
					$('#cm_img2').css('display', '');
			}
			reader.readAsDataURL(e.target.files[0]);
		}
		function cm_filefunc3(e){
			var reader = new FileReader();
			reader.onload = function(e){
					$('#cm_img3').attr("src", e.target.result);
					$('#cm_img3').css('display', '');
			}
			reader.readAsDataURL(e.target.files[0]);
		}
		
		// 파일명 나열
		function cm_fileChange(mode){
			var data;
			
			if(mode == 1){
				$('#delfileName1').val($('#compName1').val());
				data = $('#cm_file1')[0].files;
				var name= data[0].name;
				$('#cm_file_name1').text(name);
			}else if(mode == 2){
				$('#delfileName2').val($('#compName2').val());
				data = $('#cm_file2')[0].files;
				var name= data[0].name;
				$('#cm_file_name2').text(name);
			}else{
				$('#delfileName3').val($('#compName3').val());
				data = $('#cm_file3')[0].files;
				var name= data[0].name;
				$('#cm_file_name3').text(name);
			}
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