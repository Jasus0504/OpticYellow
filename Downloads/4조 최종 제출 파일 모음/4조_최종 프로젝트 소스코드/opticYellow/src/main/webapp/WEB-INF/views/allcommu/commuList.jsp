<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/all_commu/commuList.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	function fn_on(){
		window.onpageshow = function(event) {
			  /* 페이지가 뒤로 이동한 경우에만 실행 > 조회수,댓글수,추천수, update
			  event.persisted 속성은 페이지가 뒤로 이동되어
			  이전 페이지의 캐시에서 로드된 경우 true */
			  if (event.persisted) {
			    location.reload();
			  }
		};
		
		let param_page = "${param.page}";
		let param_range = "${param.range}";
		
		if(param_page!==""){
			param_page = "${param.page}";
			param_range = "${param.range}";
		} else{
			param_page = 1;
			param_range = 1;
		}
				
		
		$.ajax({
			url : "json_allcommu_List.do",
			data : {
				page: param_page,
				range: param_range
			},			
			method:'POST',
			dataType:'json',
			success : function(vos) {
	 			let tag_vos = '';
	 			
	 			$.each(vos,function(index,vo){
	 				tag_vos += `
	 					<tr>
							<td scope="col" class="col-1-w"><img src="resources/uploadimg/\${vo.m_img}" id="imgSrc" class="my-auto"></td>
							<td scope="col" class="col-2-w">\${vo.comm_id}</td>
							<td scope="col" class="col-3-w" style="text-align: left;">
								<div class="w-100 p-2">
									<a href="commuOne.do?comm_num=\${vo.comm_num}">
										<span class="text-gray-dark">\${vo.comm_title}</span>
										<span class="d-block small lh-base">\${vo.formatted_comm_date}</span>
									</a>
								</div>						
							</td>
							<td scope="col" class="col-4-w"><div class="content"><img src="resources/images/commu/chevron-expand.svg"><span>&nbsp;\${vo.comm_likes}</span></div></td>
							<td scope="col" class="col-5-w"><div class="content"><img src="resources/images/commu/chat-right-dots.svg"><span>&nbsp;&nbsp;\${vo.comm_cmt}</span></div></td>
							<td scope="col" class="col-6-w"><div class="content"><img src="resources/images/commu/eye.svg"><span>&nbsp;&nbsp;\${vo.comm_vcount}</span></div></td>
						</tr>
	 				`;
	 			});
				
	 			let page = ``;
	 			
	 			if(${pagination.prev}){
	 				page = `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize})">Previous</a></li>`;
	 			}
	 			
	 			for (let i = ${pagination.startPage}; i <= ${pagination.endPage}; i++) {
	 				page += ` 
	 					<li class="page-item value="${pagination.page == i ? 'active' : ''}">
	 					<a class="page-link" onClick="fn_pagination(\${i}, ${pagination.range},${pagination.rangeSize})"> \${i} </a></li>
					`;					
	 			}
	 			
	 			if(${pagination.next}){
	 				page += `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize})">Next</a></li>`;
	 			}
	 			
				$("#commu_List").html(tag_vos);
	 			
				$(".pagination").html(page);	 			
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end ajax......
		
		$('#frm').submit(function(event){
		
			event.preventDefault(); // 기본 제출 동작 방지
			
			var formData = $(this).serialize(); // 폼 데이터 직렬화
			
			$.ajax({
				url : "json_commuSearch.do",
				data: formData,
				method:'POST',
				dataType:'json',
				success : function(vos) {
		 			let tag_vos = '';
		 			
		 			if(vos.length==0){
		 				alert('없는 회원입니다.');
		 				location.reload();
		 			}
		 			
		 			$.each(vos,function(index,vo){
		 				
		 				tag_vos += `
		 					<tr>
								<td scope="col" class="col-1-w"><img src="resources/uploadimg/default.png" id="imgSrc" class="my-auto"></td>
								<td scope="col" class="col-2-w">\${vo.comm_id}</td>
								<td scope="col" class="col-3-w" style="text-align: left;">
									<div class="w-100 p-2">
										<a href="commuOne.do?comm_num=\${vo.comm_num}">
											<span class="text-gray-dark">\${vo.comm_title}</span>
											<span class="d-block small lh-base">\${vo.formatted_comm_date}</span>
										</a>
									</div>						
								</td>
								<td scope="col" class="col-4-w"><div class="content"><img src="resources/images/commu/chevron-expand.svg"><span>&nbsp;\${vo.comm_likes}</span></div></td>
								<td scope="col" class="col-5-w"><div class="content"><img src="resources/images/commu/chat-right-dots.svg"><span>&nbsp;&nbsp;\${vo.comm_cmt}</span></div></td>
								<td scope="col" class="col-6-w"><div class="content"><img src="resources/images/commu/eye.svg"><span>&nbsp;&nbsp;\${vo.comm_vcount}</span></div></td>
							</tr>
		 				`;
		 			});
					
					$("#commu_List").html(tag_vos);
					
					$(".pagination").html("");
				},
				error:function(xhr,status,error){
					console.log('xhr.status:', xhr.status);
				}
			});//end ajax......
			
		}) // end form......
		
	} // end onload......
	
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "commuList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "commuList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "commuList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......	
	
</script>
</head>
<body onload="fn_on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div class="bg-body-tertiary">
	<div>
	<br>
	<main class="container">	
<!-- 		<div class="fs-5"><strong>커뮤니티</strong></div> -->
		
		<form id="frm">
			<div class="d-flex flex-row mb-3">
				<select class="form-select" name="searchKey" style="width:12%;  border-top-right-radius:0; border-bottom-right-radius:0;">
					<option value="제목">제목</option>
					<option value="작성자">작성자</option>
				</select>
				<div class="input-group" style="width:20%;">
					<input class="form-control" type="text" name="searchWord" value="" style="border-top-left-radius:0; border-bottom-left-radius:0;">
					<input class="btn btn-primary" id="button-addon2" type="submit" value="검색">
				</div>
				<span class="small align-self-center" style="margin-left: auto;"><a href="commuList.do">커뮤니티</a></span>
			</div>
		</form>		
		
		<table class="table">
			<thead id="commu_List">

			</thead>
		</table>
		
		<div class="d-flex flex-row-reverse">
			<button class="btn btn-primary btn-xs" type="button" onclick="location.href='commuInsert.do'">작성하기</button>
		</div>
		
		<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination d-flex justify-content-center">
				
				</ul>
			</div>
		<!-- pagination{e} -->			
			
	</main>
	<jsp:include page="../footer.jsp"></jsp:include> 
	</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>