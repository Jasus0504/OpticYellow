<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/css/mypage/list2.css" rel="stylesheet"
	type="text/css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<style>
#list-base {
	margin-bottom: 1.0%;
	margin-top: 1.0%;
}

#list-base2 {
	height: 40px;
}

main {
	background-color: #F8F9FA !important;
	padding: 0.1% 0;
}

.form-select {
	width: 15% !important;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	height: 50px;
	text-align: center;
}

#button-addon2 {
	background-color: #F8F9FA;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function fn_action() {
		// 중복 승인 방지
		if (document.getElementById('f_confirm').text === 'Y') {
			alert("이미 승인된 테니스장입니다!");
			return false;
		}
	}
</script>	

<script type="text/javascript">
	function fn_on(){
		console.log("fn_on...");
		
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
			url : "json_facManSelectAll.do",
			data : {
				page: param_page,
				range: param_range
			},
			method:'GET',
			dataType:'json',
			success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			
	 			$.each(arr,function(index,vo){
	 				tag_vos += `
	 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
	 					<div
	 						class="d-flex flex-row text-body-secondary justify-content-between align-items-center" id="list-base2">
	 						<div class="flex-wrap p-2 fs-6 justify-content-center"
	 							style="width: 25%; text-align: center;">
	 							<a href="fac_manSelectOne.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}" class="text-gray-dark">\${vo.fac_name}</a>
	 						</div>
	 						<div class="p-2 fs-6 justify-content-between"
	 							style="width: 35%; display: flex; justify-content: center;">
	 							<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.register_id}</a>
	 							<a href="#" id="f_confirm" class="p-2" style="flex: 1; text-align: center;">\${vo.f_confirm}</a>
	 						</div>
	 						<div class="p-2 justify-content-center"
	 							style="width: 40%; text-align: center;">
	 							<a href="fac_manSelectOne.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}"
	 								class="text-gray-dark">상세정보</a><span> ｜ </span> <a
	 								href="fac_update.do?fac_id=\${vo.fac_id}" class="text-gray-dark">수정</a><span> ｜ </span>
	 							<a href="fac_deleteOK.do?fac_id=\${vo.fac_id}" class="text-gray-dark">삭제</a><span> ｜ </span>
	 							<a href="fac_confirmOK.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}" onclick="return fn_action()" class="text-gray-dark">승인</a>
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
				$("#vos").html(tag_vos);
				$(".pagination").html(page);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
	}
	
	function searchList(){
		console.log("searchList()...");
		
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
			url : "json_facManSearchList.do",
			data:{
				searchKey:$('#searchKey').val(),
				searchWord:$('#searchWord').val(),
				page: param_page,
				range: param_range
			},
			method:'GET',
			dataType:'json',
			success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			
	 			$.each(arr,function(index,vo){
	 				tag_vos += `
	 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
	 					<div
	 						class="d-flex flex-row text-body-secondary justify-content-between align-items-center" id="list-base2">
	 						<div class="flex-wrap p-2 fs-6 justify-content-center"
	 							style="width: 25%; text-align: center;">
	 							<a href="fac_manSelectOne.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}" class="text-gray-dark">\${vo.fac_name}</a>
	 						</div>
	 						<div class="p-2 fs-6 justify-content-between"
	 							style="width: 35%; display: flex; justify-content: center;">
	 							<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.register_id}</a>
	 							<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.f_confirm}</a>
	 						</div>
	 						<div class="p-2 justify-content-center"
	 							style="width: 40%; text-align: center;">
	 							<a href="fac_manSelectOne.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}"
	 								class="text-gray-dark">상세정보</a><span> ｜ </span> <a
	 								href="fac_update.do?fac_id=\${vo.fac_id}" class="text-gray-dark">수정</a><span> ｜ </span>
	 							<a href="fac_deleteOK.do?fac_id=\${vo.fac_id}" class="text-gray-dark">삭제</a><span> ｜ </span>
	 							<a href="fac_confirmOK.do?fac_id=\${vo.fac_id}&fac_name=\${vo.fac_name}&court_no=\${vo.court_no}" class="text-gray-dark">승인</a>
	 						</div>
	 					</div>
	 				</div>
	 				`;
	 			});
				
				$("#vos").html(tag_vos);
				$(".pagination").html("");
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
		
	}//end searchList()
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "fac_manSelectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "fac_manSelectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "fac_manSelectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	
</script>
</head>
<body onload="fn_on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>


	<form id="frm" class="container" style="margin-top: 1.5%"
		onsubmit="searchList(); return false;">
		<div class="d-flex flex-row mb-3 mt-2">
			<select class="form-select" name="searchKey" id="searchKey">
				<option value="fac_name">테니스장</option>
				<option value="address">주소</option>
				<option value="register_id">등록자</option>
				<option value="f_confirm">승인여부</option>
			</select>
			<div class="input-group" style="width: 32%;">
				<input class="form-control" type="text" name="searchWord"
					id="searchWord" value="" placeholder="ID는 대소문자 구별 필요"> <input
					class="btn btn-outline-secondary" id="button-addon2" type="submit"
					value="검색">
			</div>
		</div>
	</form>

	<main class="container">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center" style="height:25px">
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 25%; text-align: center;">
					<a href="#" class="text-gray-dark"><strong>🚩 테니스장</strong></a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 35%; display: flex; justify-content: center;">
					<a href="#" class="p-2" style="flex: 1; text-align: center;"><strong>등록자</strong></a>
					<a href="#" class="p-2" style="flex: 1; text-align: center;"><strong>승인상태</strong></a>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 40%; text-align: center;"></div>
			</div>
		</div>
		<div id="vos"></div>
		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination d-flex justify-content-center">

			</ul>
		</div>
		<!-- pagination{e} -->
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>