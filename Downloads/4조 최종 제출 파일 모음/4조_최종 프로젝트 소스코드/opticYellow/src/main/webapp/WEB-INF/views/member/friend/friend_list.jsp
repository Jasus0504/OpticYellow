<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/mypage/list2.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<style>
.form-select {
	width: 15% !important;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	text-align: center;
}

.form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#list-base {
	margin-bottom: 1.5%
}

.btn.state {
	background-color: #3C7DEF;
	border: none;
	width: 100px;
	font-size: 17px;
}

.btn.state:hover {
	background-color: #1061D9 !important;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 20px;
	margin-top: 30px;
}

a {
	text-decoration: none !important;
	color: black !important;
}

.group_back {
	background-color: #F8F9FA !important;
	padding: 0.7% 0.7% 0.1% 0.7% !important;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
var to_user_id = "${user_id}";
console.log("to_user_id...",to_user_id);
var selectedSortKey = "${param.sortKey || 'datedesc'}"; // 선택한 정렬 방식을 저장, 기본값은 'datedesc'


function removeFriend(m_user_id) {
	console.log("removeFriend m_user_id : ", m_user_id);
	console.log("removeFriend to_user_id : ", to_user_id);
	$.ajax({
		url: "friend_remove.do",
		method: "GET",
		data: {m_user_id: m_user_id ,
			to_user_id : to_user_id
			},
		dataType:'json',
		success: function(response) {
			console.log(response);
			alert("친구 취소 완료!");
            // 페이지 새로고침
            location.reload();
		},
		error: function(xhr, status, error) {
			console.log("Error remove friend state:", xhr.status);
		}
	});
}

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
		url : "json_friend_list.do",
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
							<img src="resources/uploadimg/\${vo.m_img}" id="imgSrc" class="my-auto">
							<div class="flex-wrap p-2 fs-6 justify-content-center" style="width: 20%; text-align: center;">
								<a href="#" class="text-gray-dark">
									<strong>\${vo.name}</strong>
								</a>
							</div>
							<div class="p-2 fs-6 justify-content-between" style="width: 47%; display: flex; justify-content: center;">
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.gender}</a>
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.birth}</a>
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.m_ntrp}</a>
							</div>
							<div class="p-2 justify-content-center" style="width: 33%; text-align: center;">
								<button type="button" class="btn btn-primary state" onclick="location.href='friend_profile.do?m_id=\${vo.m_id}'">프로필</button>
								<button type="button" class="btn btn-primary state reject" onclick="removeFriend('\${vo.m_user_id}')">친구 취소</button>
							
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
 			
			$("#friendList").html(tag_vos);
			
			$(".pagination").html(page);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end ajax......		
	
} // end onload......

function sortList(sortKey){
	console.log("sortList().....");
	
	let param_page = "${param.page}";
	let param_range = "${param.range}";
	
	if(param_page!==""){
		param_page = "${param.page}";
		param_range = "${param.range}";
	} else{
		param_page = 1;
		param_range = 1;
	}
	var sortKey = $('#sortKey').val();
	
	$.ajax({
		url : "json_friend_list_sort.do",
		data: {
			page: param_page,
			range: param_range,
			sortKey:sortKey
			},
		method:'GET',
		dataType:'json',
		success : function(vos) {
 			let tag_vos = '';
 			$.each(vos,function(index,vo){
 				console.log(index,vo);
				tag_vos += `
					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
						<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
						<img src="resources/uploadimg/\${vo.m_img}" id="imgSrc" class="my-auto">
							<div class="flex-wrap p-2 fs-6 justify-content-center" style="width: 20%; text-align: center;">
								<a href="#" class="text-gray-dark">
									<strong>\${vo.name}</strong>
								</a>
							</div>
							<div class="p-2 fs-6 justify-content-between" style="width: 47%; display: flex; justify-content: center;">
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.gender}</a>
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.birth}</a>
								<a href="#" class="p-2" style="flex: 1; text-align: center;">\${vo.m_ntrp}</a>
							</div>
							<div class="p-2 justify-content-center" style="width: 33%; text-align: center;">
								<button type="button" class="btn btn-primary state" onclick="location.href='friend_profile.do?m_id=\${vo.m_id}'">프로필</button> 	
								<button type="button" class="btn btn-primary state reject" onclick="removeFriend('\${vo.m_user_id}')">친구 취소</button>
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
 			
			$("#friendList").html(tag_vos);
			$(".pagination").html(page);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end ajax......
	
}

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;

	var url = "friend_list.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
} // end fn_prev()......

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var sortKey;
	if ($(".btn.datedesc").hasClass("active")) {
	        sortKey = "datedesc"; // 최신순인 경우
	} else if ($(".btn.name").hasClass("active")) {
	        sortKey = "name"; // 가나다순인 경우
	} else if ($(".btn.dateasc").hasClass("active")) {
	        sortKey = "dateasc"; // 오래된순인 경우
	}
	 sortList(sortKey);
} // end fn_pagination()......

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;

	var url = "friend_list.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
} // end fn_next()......
	
</script>

</head>
<body onload="fn_on()">
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">친구목록</li>
			</ol>
		</nav>
	</div>
	<jsp:include page="friend_top_menu.jsp"></jsp:include>

	<div class="container" style="margin-top: 1.5%;">
		<select class="form-select form-select-lg mb-3"
			aria-label=".form-select-lg example" name="sortKey" id="sortKey"
			onchange="sortList()">
			<option value="datedesc">최신순</option>
			<option value="name">가나다순</option>
			<option value="dateasc">오래된순</option>
		</select>
	</div>
	<main class="container group_back">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center"
				style="height: 15px !important; font-weight: bolder;">
				<a href="#" class="text-gray-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>이름</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 47%; display: flex; justify-content: center;">
					<a href="#" class="p-2" style="flex: 1; text-align: center;">성별</a>
					<a href="#" class="p-2" style="flex: 1; text-align: center;">생년월일</a>
					<a href="#" class="p-2" style="flex: 1; text-align: center;">NTRP</a>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 33%; text-align: center;">
					<a href="" class="text-gray-dark"></a>
				</div>
			</div>
		</div>

		<div id="friendList"></div>

		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination d-flex justify-content-center">

			</ul>
		</div>
		<!-- pagination{e} -->
	</main>
	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>