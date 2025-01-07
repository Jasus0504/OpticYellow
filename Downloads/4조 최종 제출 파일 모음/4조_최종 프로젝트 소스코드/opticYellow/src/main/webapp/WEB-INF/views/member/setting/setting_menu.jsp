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
body {
	background-color: #F8F9FA !important;
}

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
	
}

.btn.state {
	background-color: #3C7DEF;
	border: none;
	width: 150px;
	height: 50px;
	font-weight: bolder;
	font-size: 17px;
}

.btn.state:hover {
	background-color: #1061D9 !important;
}

#settings {
	width: 900px !important;
	margin-bottom: 1.5%
}

.setList {
	height: 50px !important;
}

h2 {
	margin-left: 30px !important;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 30px;
	margin-top: 30px;
}

body {
	background-color: #F8F9FA !important;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log('ready...');
		var m_id = "${user_id}";
		$.ajax({
			url : "json_mypage_profile.do",
			data : {
				m_id : m_id
			},
			method : 'GET',
			dataType : 'json',
			success : function(vo2) {
				console.log('ajax...success:', vo2);//{}
				$("#m_id").val(vo2.m_id);
				$("#tel").text(vo2.tel);
				$("#birth").text(vo2.birth);
				$("#m_location").text(vo2.m_location);
				$("#m_time").text(vo2.m_time);

			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});

	});
</script>

</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>

	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">설정</li>
			</ol>
		</nav>
	</div>
	<main class="container" id="settings">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center setList">
				<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
				<h2>📱</h2>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>전화번호</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 30%; display: flex; justify-content: center;">
					<span id="tel">${vo2.tel}</span>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 30%; text-align: center;">
					<button type="button" class="btn btn-primary state"
						onclick="location.href='mypage_profile_tel_update.do?m_id=${user_id }'">변경하기</button>

				</div>
			</div>
		</div>
	</main>
	<main class="container" id="settings">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center setList">
				<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
				<h2>🎂</h2>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>생년월일</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 30%; display: flex; justify-content: center;">
					<span id="birth">${vo2.birth}</span>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 30%; text-align: center;">
					<button type="button" class="btn btn-primary state"
						onclick="location.href='mypage_profile_birth_update.do?m_id=${user_id }'">변경하기</button>

				</div>
			</div>
		</div>
	</main>
	<main class="container" id="settings">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center setList">
				<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
				<h2>🏙️</h2>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>선호 지역</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 30%; display: flex; justify-content: center;">
					<span id="m_location">${vo2.m_location}</span>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 30%; text-align: center;">
					<button type="button" class="btn btn-primary state"
						onclick="location.href='mypage_profile_location_update.do?m_id=${user_id }'">변경하기</button>

				</div>
			</div>
		</div>
	</main>
	<main class="container" id="settings">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center setList">
				<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
				<h2>🕒</h2>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>선호 시간</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 30%; display: flex; justify-content: center;">
					<span id="m_time" style="text-align: center;">${vo2.m_time}</span>
				</div>
				<div class="p-2 justify-content-center"
					style="width: 30%; text-align: center;">
					<button type="button" class="btn btn-primary state"
						onclick="location.href='mypage_profile_time_update.do?m_id=${user_id }'">변경하기</button>

				</div>
			</div>
		</div>
	</main>
	<main class="container" id="settings">
		<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
			<div
				class="d-flex flex-row text-body-secondary justify-content-between align-items-center setList">
				<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
				<h2>🔒</h2>
				<div class="flex-wrap p-2 fs-6 justify-content-center"
					style="width: 20%; text-align: center;">
					<a href="#" class="text-gray-dark"> <strong>비밀번호</strong>
					</a>
				</div>
				<div class="p-2 fs-6 justify-content-between"
					style="width: 30%; display: flex; justify-content: center;"></div>
				<div class="p-2 justify-content-center"
					style="width: 30%; text-align: center;">
					<button type="button" class="btn btn-primary state"
						onclick="location.href='mypage_profile_pw_update.do?m_id=${user_id }'">변경하기</button>

				</div>
			</div>
		</div>
	</main>

	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>