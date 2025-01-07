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
<link rel="stylesheet" href="resources/css/admin/memResList.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
			url: "json_m_courtResList.do",
			data: {
				m_num:'${param.m_num}',
				page: param_page,
				range: param_range
			},
			method:'POST',
			dataType:'json',
			success: function(vos) {
				let userId = vos[0];
				userId = userId.m_id;
				
				let change_txt = `<strong>\${userId} 신청 내역</strong>`;
				
				$('#userId').html(change_txt);
				
	 			let thead = `
	 				<thead class="table-light">
		 			    <tr>
							<th scope="col" class="col-1-w">🚩 예약코트</th>
							<th scope="col" class="col-4-w">🕒 시작시간</th>
							<th scope="col" class="col-5-w">🕒 종료시간</th>
		 			    </tr>	 
					</thead>
	 			`;
	 			
	 			let tag_vos = ``;
	 			
	 			
	 			$.each(vos,function(index,vo){

	 			tag_vos += `
	 					<tr>
							<td scope="col" class="col-1-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.court_name}</a></td>
							<td scope="col" class="col-4-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.start_time}</a></td>
							<td scope="col" class="col-5-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.end_time}</a></td>
						</tr>
	 			`;
				
	 			}); // end each()...
 				
 				tag_vos = thead + tag_vos;
				$("#resList").html(tag_vos);
				

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
	 			
	 			$(".pagination").html(page);
				
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end ajax......
	} // end onload......
	
	function m_courtResList(){
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
			url: "json_m_courtResList.do",
			data: {
				m_num:'${param.m_num}',
				page: param_page,
				range: param_range
				
			},
			method:'POST',
			dataType:'json',
			success: function(vos) {
				let userId = vos[0];
				userId = userId.m_id;
				
				let change_txt = `<strong>\${userId} 신청 내역</strong>`;
				
				$('#userId').html(change_txt);
				
	 			let thead = `
	 				<thead class="table-light">
		 			    <tr>
							<th scope="col" class="col-1-w">🚩 예약코트</th>
							<th scope="col" class="col-4-w">🕒 시작시간</th>
							<th scope="col" class="col-5-w">🕒 종료시간</th>
		 			    </tr>	 
					</thead>
	 			`;
	 			
	 			let tag_vos = ``;
	 			
	 			
	 			$.each(vos,function(index,vo){

	 			tag_vos += `
	 					<tr>
							<td scope="col" class="col-1-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.court_name}</a></td>
							<td scope="col" class="col-4-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.start_time}</a></td>
							<td scope="col" class="col-5-w"><a href="courtSelectOne.do?fac_id=\${vo.fac_id}">\${vo.end_time}</a></td>
						</tr>
	 			`;
				
	 			}); // end each()...
 				
 				tag_vos = thead + tag_vos;
				$("#resList").html(tag_vos);
				

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
	 			
	 			$(".pagination").html(page);
				
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end ajax......
	} // end m_courtResList()......
	
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "memberResList.do?m_num="+${param.m_num};
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "memberResList.do?m_num="+${param.m_num};
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "memberResList.do?m_num="+${param.m_num};
		url = url + "&page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	
</script>
</head>
<body onload="fn_on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<br>
	<main class="container" style="height:1200px;">	
		<div class="d-flex flex-row mb-3">
			<div id="userId" class="fs-4"><strong>회원 신청 내역</strong></div>
			<span class="small align-self-center" style="margin-left: auto;"><a href="memberList.do">회원목록</a></span>
		</div>
		<span style="cursor:pointer;color:#000;" 
			onmouseover="this.style.color='#3C7DEF';" 
			onmouseout="this.style.color='#000';" onclick="location.href='memberJoinList.do?m_num=${param.m_num}'">신청한 매치</span>
		<span>｜</span>
		<span style="cursor:pointer;color:#000;" 
			onmouseover="this.style.color='#3C7DEF';" 
			onmouseout="this.style.color='#000';" onclick="m_courtResList()">예약한 코트</span>		
		<hr>
		<br>
		
		<table class="table">
			<tbody id="resList" >
			
			</tbody>
		</table>
		
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