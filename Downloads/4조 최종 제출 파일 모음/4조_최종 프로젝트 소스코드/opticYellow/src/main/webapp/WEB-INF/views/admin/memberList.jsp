<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="resources/css/admin/offcanvas-navbar.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function fn_on(){
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
			url : "json_memberList.do",
			data : {
				page: param_page,
				range: param_range
			},
			method:'GET',
			dataType:'json',
			success : function(vos) {
				console.log(vos);
	 			let tag_vos = '';
	 			
	 			$.each(vos,function(index,vo){
	 				tag_vos += `
	 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
		 					<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
		 						<img src="resources/uploadimg/\${vo.m_img}" id="imgSrc" class="my-auto">
		 						<div class="flex-wrap p-2 fs-6 justify-content-center" style="width:20%; text-align:center;">
		 							<a href="#" class="text-gray-dark"><strong>\${vo.m_id}</strong></a>
		 						</div>
		 						<div class="p-2 fs-6 justify-content-between" style="width:47%; display:flex; justify-content:center;">
		 							<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.name}</a>
		 							<a href="#" class="p-2" style="flex: 1; text-align: center;">NTRP \${vo.m_ntrp}</a>
		 							<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.role}</a>
		 						</div>
		 						<div class="p-2 justify-content-center" style="width:33%; text-align:center;">
		 							<a href="memberJoinList.do?m_num=\${vo.m_num}" class="text-gray-dark">예약내역</a><span>｜</span>
		 							<a href="memberUpdate.do?m_num=\${vo.m_num}" class="text-gray-dark">회원수정</a><span>｜</span>
		 							<a href="memberDelete.do?m_num=\${vo.m_num}" class="text-gray-dark">회원삭제</a>
		 						</div>
		 					</div>
	 					</div>
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
	 			
				$("#memberList").html(tag_vos);
				
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
				url : "json_memberSearch.do",
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
		 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			 					<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
			 						<img src="resources/uploadimg/\${vo.m_img}" id="imgSrc" class="my-auto">
			 						<div class="flex-wrap p-2 fs-6 justify-content-center" style="width:20%; text-align:center;">
			 							<a class="text-gray-dark"><strong>\${vo.m_id}</strong></a>
			 						</div>
			 						<div class="p-2 fs-6 justify-content-between" style="width:47%; display:flex; justify-content:center;">
			 							<a class="p-2" style="flex: 1; text-align: center;">\${vo.name}</a>
			 							<a class="p-2" style="flex: 1; text-align: center;">NTRP \${vo.m_ntrp}</a>
			 							<a class="p-2" style="flex: 1; text-align: center;">\${vo.role}</a>
			 						</div>
			 						<div class="p-2 justify-content-center" style="width:33%; text-align:center;">
			 							<a href="memberJoinList.do?m_num=\${vo.m_num}" class="text-gray-dark">예약내역</a><span>｜</span>
			 							<a href="memberUpdate.do?m_num=\${vo.m_num}" class="text-gray-dark">회원수정</a><span>｜</span>
			 							<a href="memberDelete.do?m_num=\${vo.m_num}" class="text-gray-dark">회원삭제</a>
			 						</div>
			 					</div>
	 						</div>
		 				`;
		 			});
		 			
					$("#memberList").html(tag_vos);
					
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

		var url = "memberList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "memberList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "memberList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	
</script>
</head>
<body onload="fn_on()" style="height:100%;">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div class="bg-body-tertiary">
		<div style="height:1200px;">
		<br>
			<main class="container">	
				
				<form id="frm">
					<div class="d-flex flex-row mb-3 mt-2">
						<select class="form-select" name="searchKey" style="width:12%; border-top-right-radius:0; border-bottom-right-radius:0;">
							<option value="이름">이름</option>
							<option value="아이디">아이디</option>
						</select>
						<div class="input-group" style="width:20%;">
							<input class="form-control" type="text" name="searchWord" value="" style="border-top-left-radius:0; border-bottom-left-radius:0;">
							<input class="btn btn-primary" id="button-addon2" type="submit" value="검색">
						</div>
						<span class="small align-self-center" style="margin-left: auto;"><a href="memberList.do">회원 관리</a></span>
					</div>
				</form>		
				
				<div id="memberList">
		
				</div>
				
				<!-- pagination{s} -->
					<div id="paginationBox">
						<ul class="pagination d-flex justify-content-center">
						
						</ul>
					</div>
				<!-- pagination{e} -->		
		
				
			</main> 
		</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>