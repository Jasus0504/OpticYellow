<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
<script type="text/javascript">
	function fn_on(){
		$('#summernote').summernote({
			height: 300,                 	// 에디터 높이
			minHeight: null,             	// 최소 높이
			maxHeight: null,             	// 최대 높이
			focus: true,                	// 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",					// 한글 설정
//				placeholder: '본문을 작성해주세요',	// placeholder 설정
			disableDragAndDrop: true,		// 드래그 앤 드랍 해제
			
			toolbar: [
			    ['style', ['style']],
			    ['font', ['bold', 'italic', 'underline', 'clear']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture', 'video']]
//				    ['view', ['codeview']]
			],
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			} // end callbacks
			
		}); // end summernote
	} // end onload......
	
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data: form_data,
			type: "POST",
			url: 'json_qna_imgUp.do',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(response) {
				// 이미지 보여주기
				$(el).summernote('editor.insertImage', response);
				// 이미지 태그 추가
				$('#summernote').append('<img src="'+response+'"/>');
			}
		});
	}
	
	function fn_action(){
 		if(!document.getElementById('f_title').value){
 			alert("제목을 입력해주세요.");
 			return false;
 		}
 		if(document.getElementById('summernote').value==="<p><br></p>"){
 			alert("내용을 입력해주세요.");
 			return false;
 		}
	}
</script>
</head>
<body onload="fn_on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<br>
	
	<div class="container" style="height:650px;">
		<main class="form-signin w-100 m-auto">
			<div class="fs-2 text-center"><strong>📣 FAQ 수정 📣</strong></div>
			
			<form action="q_updateOK.do" method="post" onsubmit="return fn_action()">
			
				<div class="mb-3 mt-5 row">
					<div class="col">
						<input type="hidden" id="f_writer" name="f_writer" value="${vo2.f_writer}">
						<input type="hidden" id="f_num" name="f_num" value="${vo2.f_num}">
						<input type="text" class="form-control" id="f_title" name="f_title" value="${vo2.f_title}">
					</div>				
				</div>
				<div>
					<textarea id="summernote" name="f_content">${vo2.f_content}</textarea>
				</div>
				
				<div class="d-flex flex-row-reverse mx-2">
					<div>
						<button class="btn btn-primary btn-xs mt-3" type="button" onclick="location.href='q_selectOne.do?f_num=${vo2.f_num}'">취소</button>
						<button class="btn btn-primary btn-xs mt-3" type="submit">수정</button>
					</div>
				</div>
						
			</form>
		</main>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>	
</body>
</html>