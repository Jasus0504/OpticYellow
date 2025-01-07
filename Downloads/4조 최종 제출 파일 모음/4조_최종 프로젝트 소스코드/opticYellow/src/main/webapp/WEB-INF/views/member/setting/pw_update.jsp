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

.form-floating .form-control {
	position: relative;
	height: auto;
}

.form-floating .form-control input {
	margin-bottom: 0;
}

.form-floating span {
	margin-top: 0.5rem;
	margin-bottom: 0.5rem;
	display: block;
	text-align: center;
}

#positionCenter {
	transform: translate(0%, 10%);
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
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

				$("#span_m_id").text(vo2.m_id);
				$("#m_id").val(vo2.m_id);
				// 				$("#pw").val(vo2.pw);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});

		$("#submitBtn").click(function(e) {
			var password = $("#pw").val();
			var confirmPassword = $("#newPwOK").val();
			// 새 비밀번호 입력 확인
			if (!document.getElementById('pw').value) {
				alert("새 비밀번호를 입력해주세요!");
				return false;
			}

			// 비밀번호 확인 입력 확인
			if (!document.getElementById('newPwOK').value) {
				alert("비밀번호 확인을 입력해주세요!");
				return false;
			}
			if (password === confirmPassword) {
				alert("변경 성공!"); // 변경에 성공한 경우 얼럿 창 표시
			} else {
				alert("비밀번호 불일치"); // 변경에 실패한 경우 얼럿 창 표시
				e.preventDefault(); // 폼 제출 방지
			}
		});
	});

	function passConfirm() {
		// 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같으면 비밀번호 일치, 그렇지 않으면 불일치 텍스트 출력
		var password = document.getElementById('pw');
		var passwordConfirm = document.getElementById('newPwOK');
		var confrimMsg = document.getElementById('confirmMsg'); // 확인 메세지 > span 태그
		var correctColor = "#0000ff";
		var wrongColor = "#ff0000";

		if (password.value == passwordConfirm.value) {
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "비밀번호 일치"; // innerHTML로 HTML 내부에 내용 추가
		} else {
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML = "비밀번호 불일치";
		}

	} // end passConfirm()
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>

	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item"><a href="mypage_setting_OK.do">설정</a></li>
				<li class="breadcrumb-item active" aria-current="page">비밀번호 변경</li>
			</ol>
		</nav>
	</div>

	<main class="form-signin w-100 m-auto">

		<form action="mypage_profile_pw_updateOK.do" method="POST">
			<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
			<div id="positionCenter">
				<h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
				<div class="form-floating" style="">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="비밀번호"> <label for="pw">새 비밀번호</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="newPwOK"
						name="newPwOK" oninput="passConfirm()" placeholder="비밀번호 확인">
					<label for="newPwOK">비밀번호 확인</label> <span id="confirmMsg"></span>
				</div>
				<input type="submit" class="w-100 btn btn-lg btn-primary"
					id="submitBtn" value="비밀번호 변경">
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