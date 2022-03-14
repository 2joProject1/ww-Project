<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
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

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<div class="col-10">
				<h1>글 작성</h1>
			</div>
			<div class="col-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="17" height="20"
					fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
						d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z" />
 						 <path fill-rule="evenodd"
						d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z" />
				</svg>
			</div>
		</div>
	</div>

	<form id="CommunityInsertForm" method="post" action="insert.co">
		<div>
			<input type="text" placeholder="제목" class="community_write_title"
				name="boardTitle" required>
		</div>

		<hr>

		<div>
			<textarea placeholder="내용을 입력하세요" class="community_write_content"
				name="boardContent" required></textarea>

			<div>
				<div style="border: 1px solid black; width: 200px; height: 100px">
				</div>
				<div>
					<div>파일 이름</div>
					<div>설명을 추가할 수 있어요</div>
				</div>
			</div>

		</div>


		<hr>
		<div class="container">
			<div class="row">
				<div class="col-9">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
					  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
					  <path
							d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z" />
					</svg>
				</div>

				<div class="col-3">
					<button type="submit">완료</button>
				</div>

			</div>

		</div>
	</form>


</body>
</html>