<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/mypage/list2.css" rel="stylesheet"
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

.form-select {
	width: 12% !important;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	height: 50px;
}

.form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.btn.state {
	background-color: #3C7DEF;
	border: none;
	width: 100px;
	font-weight: bolder;
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

.group_back{
	background-color: #F8F9FA !important;
	padding: 0.7% 0.7% 0.1% 0.7% !important;
}

.btn.sub{
	background-color: #F8F9FA;
	border: var(--bs-border-width) solid var(--bs-border-color);
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
</script>
<script type="text/javascript">

var to_user_id = '<%=session.getAttribute("user_id")%>';


function requestFriend(to_user_id, m_user_id) {
   
   console.log("requestFriend m_user_id : ", m_user_id);
   console.log("requestFriend to_user_id : ", to_user_id);
   $.ajax({
      url: "friend_request.do",
      method: "GET",
      data: { 
         m_user_id: m_user_id ,
         to_user_id : to_user_id
      },
      dataType:'json',
      success: function(response) {
         console.log(response);
         alert("친구 신청 완료!");
         location.reload();
      },
      error: function(xhr, status, error) {
         console.log("Error accepting friend state:", xhr.status);
      }
   });
}


$(document).ready(function() {
	console.log("document...");
	let param_page = "${param.page}";
	let param_range = "${param.range}";
	
	if(param_page!==""){
		param_page = "${param.page}";
		param_range = "${param.range}";
	} else{
		param_page = 1;
		param_range = 1;
	}
	console.log("document to_user_id : ", to_user_id);
	$.ajax({
		url : "json_friend_search_all.do",
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
                          <button type="button" class="btn btn-primary state reject" onclick="requestFriend('\${to_user_id}', '\${vo.m_id}')">친구신청</button>
                          <button type="button" class="btn btn-primary state" onclick="location.href='friend_profile.do?m_id=\${vo.m_id}'">프로필</button>                      
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
	
	$('#frm').submit(function(event){
		event.preventDefault(); // 기본 제출 동작 방지
		
		var formData = $(this).serialize(); // 폼 데이터 직렬화
		 $.ajax({
		      url : "json_friend_search_list.do",
		      data:{
		    	  formData,
		    	  searchKey:$('#searchKey').val(),
		          searchWord:$('#searchWord').val()

		      },
		      method:'POST',
		      dataType:'json',
		      success : function(arr) {
		         console.log('ajax...success:', arr);//{}
		         
		          let tag_vos = '';
		          
		          $.each(arr,function(index,vo){
		         
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
		                        <button type="button" class="btn btn-primary state reject" onclick="requestFriend('\${to_user_id}', '\${vo.m_id}')">친구신청</button>
		                        <button type="button" class="btn btn-primary state" onclick="location.href='friend_profile.do?m_id=\${vo.m_id}'">프로필</button>                      
		                     </div>
		                  </div>
		               </div>
		             `;
		          });
		          
		         $("#friendList").html(tag_vos);
		         $(".pagination").html("");
		      },
		      error:function(xhr,status,error){
		         console.log('xhr.status:', xhr.status);
		      }
		   });//end $.ajax()...
	}) // end form......
});//end onload...

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
   var page = ((range - 2) * rangeSize) + 1;
   var range = range - 1;

   var url = "friend_search.do";
   url = url + "?page=" + page;
   url = url + "&range=" + range;
   location.href = url;
} // end fn_prev()......

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {

   var url = "friend_search.do";
   url = url + "?page=" + page;
   url = url + "&range=" + range;
   location.href = url;   
} // end fn_pagination()......

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
   var page = parseInt((range * rangeSize)) + 1;
   var range = parseInt(range) + 1;

   var url = "friend_search.do";
   url = url + "?page=" + page;
   url = url + "&range=" + range;
   location.href = url;
} // end fn_next()......



</script>

</head>
<body >
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">회원검색</li>
			</ol>
		</nav>
	</div>
	<jsp:include page="friend_top_menu.jsp"></jsp:include>

	<form id="frm" class="container" style="margin-top: 1.5%">
		<div class="d-flex flex-row mb-3 mt-2">
			<select class="form-select" name="searchKey" id="searchKey">
				<option value="name">NAME</option>
				<option value="id">ID</option>
				<option value="ntrp">NTRP</option>
			</select>
			<div class="input-group" style="width: 20%;">
				<input class="form-control" type="text" name="searchWord"
					id="searchWord" value=""> <input
					class="btn btn-outline-secondary sub" id="button-addon2" type="submit"
					value="검색">
			</div>
		</div>
	</form>


	<main class="container group_back" style="margin-top: 1.5%">
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