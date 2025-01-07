<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Optic Yellow</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.3/examples/sign-in/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}


.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

body {
	background-color: #F8F9FA !important;
}

select {
	margin-bottom: 5% !important;
	text-align: center;
}

h1 {
	margin-top: 15% !important;
	text-align: center;
}

#positionCenter {
	transform: translate(0%, 25%);
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 20px;
	margin-top: 30px;
}

.breadcrumb-container .breadcrumb-item a {
	text-decoration: none;
	border-bottom: none;
	color: black;
}


</style>
<link href="resources/setting/signin.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	var m_id = "${user_id}";
	console.log("m_id : ", m_id);

	function on() {
		console.log("selectbox...");
		// 1. 선호 시간대 생성
		var m_time = document.getElementById("m_time"); // select 가져오기

		var startTime = 9;
		var endTime = 22;

		for (var i = startTime; i < endTime; i++) {
			var option = document.createElement("option");
			var timeString = i.toString().padStart(2, "0") + ":00 ~ "
					+ (i + 1).toString().padStart(2, "0") + ":00";
			option.value = timeString;
			option.text = timeString;
			m_time.appendChild(option);
		}
	}

	$(function() {
		console.log('onload...');
		$.ajax({
			url : "json_mypage_profile.do",
			data : {
				m_id : m_id
			},
			method : 'GET',
			dataType : 'json',
			success : function(vo2) {
				console.log('ajax...success:', vo2);//{}
				on();
				$("#span_m_id").text(vo2.m_id);
				$("#m_id").val(vo2.m_id);
				$("#m_time").val(vo2.m_time);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
		// 폼 제출 시 경고 메시지 출력
		$("#submitBtn").click(function(e) {

			alert("변경 성공!"); // 변경에 성공한 경우 얼럿 창 표시
		});
	});
</script>
</head>
<body onload="on()">
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item"><a href="mypage_setting_OK.do">설정</a></li>
				<li class="breadcrumb-item active" aria-current="page">선호시간 변경</li>
			</ol>
		</nav>
	</div>
	<main class="form-signin w-100 m-auto">

		<form action="mypage_profile_time_updateOK.do" method="POST">
			<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
			<div id="positionCenter">
				<h1 class="h3 mb-3 fw-normal">선호시간 변경</h1>
				<select class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" id="m_time" name="m_time"></select>
				<input type="submit" class="w-100 btn btn-lg btn-primary"
					id="submitBtn" value="변경하기">
			</div>
		</form>
	</main>
	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>