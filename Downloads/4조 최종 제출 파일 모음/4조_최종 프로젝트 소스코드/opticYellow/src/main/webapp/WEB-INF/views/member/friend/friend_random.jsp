<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
#list-base {
	margin-bottom: 1.5%
}

.btn.state {
	background-color: #3C7DEF;
	border: none;
	width: 100px;
	font-weight: bolder !important;
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

.group_back {
	background-color: #F8F9FA !important;
	padding: 0.7% 0.7% 0.1% 0.7% !important;
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
            m_user_id: m_user_id,
            to_user_id: to_user_id
        },
        dataType: 'json',
        success: function(response) {
            console.log(response);
            alert("친구 신청 완료!");
            // 페이지 새로고침
            location.reload();
        },
        error: function(xhr, status, error) {
            console.log("Error accepting friend state:", xhr.status);
        }
    });
}

function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}


$(function(){

	console.log("onload()...");
	console.log("to_user_id : ", to_user_id);
	$.ajax({
		url : "json_friend_random_list.do",
		data:{
			to_user_id : to_user_id
		},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);//{}
			
			 arr = shuffleArray(arr);
	            
	            let tag_vos = '';
	            var count = 0;
	            
	            for (var i = 0; i < arr.length && count < 5; i++) {
	                var vo = arr[i];
	                
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
								<button type="button" class="btn btn-primary state" onclick="requestFriend('\${to_user_id}', '\${vo.m_id}')">친구신청</button>
								<button type="button" class="btn btn-primary state" onclick="location.href='friend_profile.do?m_id=\${vo.m_id}'">프로필</button> 							
								</div>
							</div>
						</div>
	                `;
	                
	                count++;
	            }
			
			$("#friendList").html(tag_vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
});//end onload...


</script>

</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">친구추천</li>
			</ol>
		</nav>
	</div>
	<jsp:include page="friend_top_menu.jsp"></jsp:include>

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
	</main>

	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>


</body>
</html>