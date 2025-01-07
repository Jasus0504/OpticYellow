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

input {
	margin-bottom: 5% !important;
	letter-spacing: 2px; /* 원하는 글자 간격으로 설정 */
}

h1 {
	margin-top: 15% !important;
	text-align: center;
}

/* 추가된 스타일 */
#telContainer {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
}

#telContainer input {
	font-size: 1.5rem;
	text-align: center;
	width: 100%;
	padding: 1rem; /* 추가 */
}

#telContainer label {
	display: none; /* 수정 */
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
	$(document).ready(function() {
		console.log('onload...');
		var m_id = "${user_id}";
		$.ajax({
			url : "json_mypage_profile.do",
			data : {
				m_id : m_id
			},
			method : 'GET',
			dataType : 'json',

			success : function(vo2) {
				console.log('ajax...success:', vo2);
				$("#span_m_id").text(vo2.m_id);
				$("#m_id").val(vo2.m_id);
				$("#tel").val(vo2.tel);
				autoHyphen(document.getElementById("tel"));
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});

		// 전화번호 입력 필드의 값이 변경될 때 자동으로 하이픈 추가 및 길이 제한
		$("#tel").on("input", function() {
			autoHyphen(this);
			limitPhoneNumberLength(this, 11);
		});

		// 페이지를 떠날 때(새로고침, 다른 페이지로 이동 등) 하이픈을 자동으로 추가하여 보여줌
		window.addEventListener("beforeunload", function() {
			autoHyphen(document.getElementById("tel"));
		});

		// 폼 제출 시 전화번호 길이 확인 후 유효하지 않으면 경고 메시지 출력
		$("#submitBtn").click(function(e) {
			var tel = $("#tel").val().replace(/[^0-9]/g, '');

			if (tel.length !== 11) {
				e.preventDefault();
				alert("연락처를 정확히 입력해주세요.");
			} else {
				alert("변경 성공!"); // 변경에 성공한 경우 얼럿 창 표시
			}
		});
	});

	// 전화번호에 자동으로 하이픈 추가
	function autoHyphen(target) {
		target.value = target.value.replace(/[^0-9]/g, '').replace(
				/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(
				/(\-{1,2})$/g, "");
	}

	// 전화번호 길이 제한
	function limitPhoneNumberLength(target, maxLength) {
		var tel = target.value.replace(/[^0-9]/g, '');

		if (tel.length > maxLength) {
			target.value = tel.slice(0, maxLength);
		}
	}
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item"><a href="mypage_setting_OK.do">설정</a></li>
				<li class="breadcrumb-item active" aria-current="page">연락처 변경</li>
			</ol>
		</nav>
	</div>
	<main class="form-signin w-100 m-auto">
		<form id="telUpdateForm" action="mypage_profile_tel_updateOK.do"
			method="POST">
			<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
			<div id="positionCenter">
				<h1 class="h3 mb-3 fw-normal">연락처 변경</h1>
				<div class="form-floating" id="telContainer">
					<input type="text" class="form-control" id="tel" name="tel">
					<label for="tel"></label>
				</div>
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