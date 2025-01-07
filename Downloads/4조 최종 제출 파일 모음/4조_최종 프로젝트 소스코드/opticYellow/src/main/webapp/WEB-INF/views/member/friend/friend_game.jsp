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
	margin-bottom: 1.5%
}

.btn.state {
	background-color: #3C7DEF;
	border: none;
	width: 150px;
	height: 50px;
	font-weight: bolder;
}

.btn.state:hover {
	background-color: #1061D9 !important;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 30px;
	margin-top: 45px;
}

.b-example-divider {
	height: 15rem !important;
}

.group_back {
	background-color: #F8F9FA !important;
	padding: 0.7% 0.7% 0.1% 0.7% !important;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
</script>
<script type="text/javascript">
var to_user_id = "${user_id}";
console.log("to_user_id...",to_user_id);
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
		url : "json_friend_game_list.do",
		data : {
			page: param_page,
			range: param_range,
			to_user_id : to_user_id
		},
		method:'GET',
		dataType:'json',
		success : function(vos) {
			console.log(vos);
 			let tag_vos = '';
 			
 			$.each(vos,function(index,vo){
 				console.log(index,vo);
 				tag_vos += `
 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
						<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
							<div class="flex-wrap p-2 fs-6 justify-content-center" style="width: 20%; text-align: center;">
								<a href="#" class="text-gray-dark">
									<strong>\${vo.name}</strong>
								</a>
							</div>
							<div class="p-2 fs-6 justify-content-between" style="width: 60%; display: flex; justify-content: center; flex-wrap: wrap;">
								<div class="p-2 text-dark" style="width: 100%; text-align: left; font-size: 18px;">
									<a href="g_selectOne.do?g_num=\${vo.g_num}">\${vo.g_name}</a>
								</div>

								<!-- 두 번째 행 -->
								<div class="p-2 text-gray-dark" style="flex: 1; font-size: 14px; display: flex; align-items: center;">🎾ntrp \${vo.g_ntrp}▲ | 🥎\${vo.g_method} | 🚩 \${vo.fac_name}</div>
							</div>
							<div class="p-2 justify-content-center" style="width: 33%; text-align: center;">
								<button type="button" class="btn btn-primary state" onclick="location.href='g_selectOne.do?g_num=\${vo.g_num}'" style="font-color:balck !important;">매치 보러가기</button>
							</div>
						</div>
					</div>
				
 				`;
 			});
 			
 			let page = ``;
 			console.log('${pagination.prev}...',${pagination.prev});
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
 			
			$("#friendList").html(tag_vos);
			
			$(".pagination").html(page);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end ajax......
	
	
	
} // end onload......
	
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
	
		var url = "friend_game_list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......
	
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
	
		var url = "friend_game_list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
		// 선택된 페이지 버튼 색상 변경
	    setSelectedPage(page);
	} // end fn_pagination()......
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
	
		var url = "friend_game_list.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	

</script>


</head>
<body onload="fn_on()">

	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<main class="container">

		<div>
			<nav aria-label="breadcrumb" class="breadcrumb-container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
					<li class="breadcrumb-item active" aria-current="page">친구가 신청한
						매치</li>
				</ol>
			</nav>
		</div>
		<main class="container group_back">
			<form id="frm">
				<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
					<div
						class="d-flex flex-row text-body-secondary justify-content-between align-items-center"
						style="height: 15px !important;">
						<div class="flex-wrap p-2 fs-6 justify-content-center"
							style="width: 20%; text-align: center;">
							<a href="#" class="text-gray-dark"> <strong>친구 이름</strong>
							</a>
						</div>
						<div class="p-2 fs-6 justify-content-between"
							style="width: 60%; display: flex; justify-content: center;">
							<a href="#" class="p-2" style="flex: 1; text-align: center;">
								<strong>매치 내용</strong>
							</a>
						</div>
						<div class="p-2 justify-content-center"
							style="width: 33%; text-align: center;">
							<a href="memberResList.do?m_num=\${vo.m_num}"
								class="text-gray-dark"></a>
						</div>
					</div>
				</div>
			</form>
			<div id="friendList"></div>

			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination d-flex justify-content-center">

				</ul>
			</div>
			<!-- pagination{e} -->
		</main>
	</main>

	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>