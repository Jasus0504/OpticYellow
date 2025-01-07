<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/all_commu/commuOne.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	function on(cmt_num=0){
		
		let comm_id = '${vo2.comm_id}';
		
		if('${user_id}'===comm_id){
			$("#commu_up_del").show();
		} else if('${user_id}'!==comm_id){
			$("#commu_up_del").hide();
		}	
		
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
			url : "json_cmtList.do",
			data:{
				comm_num:${param.comm_num},
				page: param_page,
				range: param_range
			},
			method:'POST',
			dataType:'json',
			success : function(vos) {
				console.log(vos);
				let tag_txt = '';
				
				$.each(vos,function(index,vo){
					// 댓글 수정 클릭 전 > 댓글 내용 표시
					let tag_td = `<p>&nbsp;&nbsp;\${vo.cmt_content}</p>`;
					// 댓글 수정 클릭(cmt_num 전달) 후 > 댓글 수정 활성화
					if(cmt_num==vo.cmt_num) {
						tag_td = `
								<div class="form-floating">
									<textarea class="form-control" placeholder="Comments" id="update_content" name="cmt_content" style="height: 100px" maxlength="180">\${vo.cmt_content}</textarea>
									<label for="floatingTextarea2">Comments</label>
								</div>
								<div class="d-flex flex-row mt-3">
									<button class="btn btn-primary btn-xs" type="button" onclick="location.reload()">취소</button>&nbsp;
									<button class="btn btn-primary btn-xs" type="button" onclick="cmt_updateOK(\${vo.cmt_num})">수정완료</button>
								</div>							
							`;
							
					}//end if
					
					let tag_div = ``; //user_id 와 vo.cmt_id가 같아야만 댓글수정,삭제를 표시
					if('${user_id}'===vo.cmt_id){
						tag_div = `
									<div id="cmt_up_del" class="d-flex flex-row-reverse mt-3">
										<div>
											<a href="javascript:void(0)" onclick="on(\${vo.cmt_num}); return false;" style="color:#777777;">댓글수정</a>
											<a href="javascript:void(0)" onclick="cmt_deleteOK(\${vo.cmt_num}); return false;" style="color:#777777;">댓글삭제</a>
										</div>
									</div>										
									`;
									
						$("#cmt_up_del").show();					
					} else{
						$("#cmt_up_del").hide();
					}
					
					tag_txt += `
						<table>
							<tr>
								<td style="width:10%;"><img src="resources/uploadimg/\${vo.m_img}" id="cmtImg" class="my-auto"></td>
								<td style="width:76%;">
									<div class="w-100 p-2">
										<span class="text-gray-dark fs-5">\${vo.cmt_id}</span>
										<span class="d-block small lh-base">\${vo.formatted_cmt_date}</span>
									</div>						
								</td>
							</tr>
						</table>
						<div class="d-flex w-100">
							<div class="align-self-stretch" style="width:85%;">
								\${tag_td}		
							</div>
							<div class="btn-group align-self-end" style="width:15%;" role="group" aria-label="Basic outlined example">
								<button type="button" class="btn btn-outline-primary" id="btn1" onclick="cmt_likeDown(\${vo.cmt_num})"><img src="resources/images/commu/chevron-down.svg"></button>
								<button type="button" class="btn btn-outline-primary" id="no-btn" disabled>\${vo.cmt_likes}</button>
								<button type="button" class="btn btn-outline-primary" id="btn2" onclick="cmt_likeUp(\${vo.cmt_num})"><img src="resources/images/commu/chevron-up.svg"></button>
							</div>
						</div>
						\${tag_div}	
				
						<br>
						<hr>						
					`;
					
				});//end each
				
	 			let page = ``;
	 			
	 			if(${pagination.prev}){
	 				page = `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize},${vo2.comm_num})">Previous</a></li>`;
	 			}
	 			
	 			for (let i = ${pagination.startPage}; i <= ${pagination.endPage}; i++) {
	 				page += ` 
	 					<li class="page-item value="${pagination.page == i ? 'active' : ''}">
	 					<a class="page-link" onClick="fn_pagination(\${i},${pagination.range},${pagination.rangeSize},${vo2.comm_num})"> \${i} </a></li>
					`;					
	 			}
	 			
	 			if(${pagination.next}){
	 				page += `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize},${vo2.comm_num})">Next</a></li>`;
	 			}
				
				$('#cmt_list').html(tag_txt);
				
				$(".pagination").html(page);
				
			}, 
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	} 
	      
		})//end ajax
		
	} // end onload......
	
	function cmt_insertOK(){
		$.ajax({
			url : "json_cmt_insertOK.do",
			data:{
				comm_num:${param.comm_num},
				cmt_content:$('#cmt_content').val(),
				cmt_id:'${user_id}'
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result==='OK') {
					alert('댓글이 등록되었습니다.');
					location.reload();
				}

				if(data.result==='login') {
					alert('로그인이 필요합니다.');
					location.reload();
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
				alert('댓글을 입력해주세요.');
				location.reload();
	      	} 
	      
		})//end ajax
		
		
	}//end cmt_insertOK

	function cmt_updateOK(cmt_num=0){
		$.ajax({
			url : "json_cmtUpdateOK.do",
			data:{
				cmt_num:cmt_num,
				cmt_content:$('#update_content').val() //수정댓글
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result==='OK') {
					alert('댓글이 수정되었습니다.');
					location.reload();
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
		
		
	}//end cmt_updateOK

	function cmt_deleteOK(cmt_num=0){
		$.ajax({
			url : "json_cmtDeleteOK.do",
			data:{
				cmt_num:cmt_num,
				comm_num:'${param.comm_num}'
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result==='OK') {
					alert('댓글이 삭제되었습니다.');
					location.reload();
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
		
	} //end deleteOK
	
	function commu_likeDown(){
		$.ajax({
			url : "json_commu_dislike.do",
			data:{
				comm_num:${param.comm_num}
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result ==='Login') {
					alert('로그인이 필요합니다.');
				} else if(data.result === 'OK') {
					alert('비추천 되었습니다.');
					location.reload();
				} else if(data.result === 'NotOK') {
					alert('이미 비추천 하셨습니다.');
				} else{
					alert('죄송합니다. 시스템 오류입니다.');
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
	} // end commu_likeDown()...
	
	function commu_likeUp(){
		$.ajax({
			url : "json_commu_like.do",
			data:{
				comm_num:${param.comm_num}
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result ==='Login') {
					alert('로그인이 필요합니다.');
				} else if(data.result === 'OK') {
					alert('추천 되었습니다.');
					location.reload();
				} else if(data.result === 'NotOK') {
					alert('이미 추천 하셨습니다.');
				} else{
					alert('죄송합니다. 시스템 오류입니다.');
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
	} // end commu_likeUp()...
	
	function cmt_likeDown(cmt_num){
		$.ajax({
			url : "json_cmt_dislike.do",
			data:{
				comm_num:${param.comm_num},
				cmt_num:cmt_num
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result ==='Login') {
					alert('로그인이 필요합니다.');
				} else if(data.result === 'OK') {
					alert('비추천 되었습니다.');
					location.reload();
				} else if(data.result === 'NotOK') {
					alert('이미 비추천 하셨습니다.');
				} else{
					alert('죄송합니다. 시스템 오류입니다.');
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
	} // end cmt_likeDown()...
	
	function cmt_likeUp(cmt_num){
		$.ajax({
			url : "json_cmt_like.do",
			data:{
				comm_num:${param.comm_num},
				cmt_num:cmt_num
			},
			method:'POST',
			dataType:'json',
			success : function(data) {
				
				if(data.result ==='Login') {
					alert('로그인이 필요합니다.');
				} else if(data.result === 'OK') {
					alert('추천 되었습니다.');
					location.reload();
				} else if(data.result === 'NotOK') {
					alert('이미 추천 하셨습니다.');
				} else{
					alert('죄송합니다. 시스템 오류입니다.');
				}
				
			},
		  
		  	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
	      	}
	      
		})//end ajax
	} // end cmt_likeUp()...
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, comm_num) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "commuOne.do?comm_num="+comm_num;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, comm_num) {
		var url = "commuOne.do?comm_num="+comm_num;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, comm_num) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "commuOne.do?comm_num="+comm_num;
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	
</script>
</head>
<body>
<body onload="on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<br>

	<main class="container">
		<div class="d-flex justify-content-between">
		<span class="fs-2 align-self-center"><strong>${vo2.comm_title}</strong></span>
		<span class="small align-self-center"><a href="commuList.do">목록보기</a></span>
		</div>
		
		<table style="width:100%">
			<tr>
				<td style="width:7%;"><img src="resources/uploadimg/${vo2.m_img}" id="imgSrc" class="my-auto"></td>
				<td style="width:73%;">
					<div class="w-100 p-2">
						<span class="text-gray-dark fs-4">${vo2.comm_id}</span>
						<span class="d-block small lh-base">${vo2.formatted_comm_date}</span>
					</div>						
				</td>
				<td style="width:6%;"><div class="content"><img src="resources/images/commu/chevron-expand.svg"><span>&nbsp;${vo2.comm_likes}</span></div></td>
				<td style="width:6%;"><div class="content"><img src="resources/images/commu/chat-right-dots.svg"><span>&nbsp;&nbsp;${vo2.comm_cmt}</span></div></td>
				<td style="width:6%;"><div class="content"><img src="resources/images/commu/eye.svg"><span>&nbsp;&nbsp;${vo2.comm_vcount}</span></div></td>						
			</tr>
		</table>
		<hr>
		<br>
		
		<p>${vo2.comm_content}</p>
		
		<div class="d-flex flex-row-reverse">
			<div class="btn-group mb-3" role="group" aria-label="Basic outlined example">
				<button type="button" class="btn btn-outline-primary" id="btn1" onclick="commu_likeDown()"><img src="resources/images/commu/chevron-down.svg"></button>
				<button type="button" class="btn btn-outline-primary" id="no-btn" disabled>${vo2.comm_likes}</button>
				<button type="button" class="btn btn-outline-primary" id="btn2" onclick="commu_likeUp()"><img src="resources/images/commu/chevron-up.svg"></button>
			</div>		
		</div>
		<div class="d-flex flex-row-reverse mx-2">
			<div id="commu_up_del">
				<a href="commu_update.do?comm_num=${param.comm_num}" style="color:#777777;">글수정</a>
				<a href="commuDeleteOK.do?comm_num=${param.comm_num}" style="color:#777777;">글삭제</a>
			</div>
		</div>		
		<hr>
		<br>
		
		<p>${vo2.comm_cmt}개의 댓글</p>	
		
		<div class="form-floating">
			<textarea class="form-control" placeholder="Comments" id="cmt_content" name="cmt_content" style="height: 100px" maxlength="180"></textarea>
			<label for="floatingTextarea2">Comments</label>
		</div>
		<div class="d-flex flex-row-reverse">
			<button class="btn btn-primary btn-xs mt-3" type="button" onclick="cmt_insertOK()">댓글등록</button>
		</div>
		
		<br>
		<br>
		
		<div id="cmt_list">

		</div>
		
		<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination d-flex justify-content-center">
				
				</ul>
			</div>
		<!-- pagination{e} -->				
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>