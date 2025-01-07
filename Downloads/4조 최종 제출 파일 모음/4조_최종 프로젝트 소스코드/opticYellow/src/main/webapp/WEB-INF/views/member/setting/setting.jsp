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

h1 {
	margin-top: 20% !important;
	text-align: center;
}

input {
	margin-bottom: 5% !important;
}

#positionCenter {
	transform: translate(0%, 40%);
}

</style>
<link href="resources/setting/signin.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	var m_id = "${user_id}";

	$(function() {
		console.log('onload...');
		$("#submitBtn").click(function(e) {
			e.preventDefault(); // 폼 전송 방지

			var pw = $("#pw").val().trim(); // 입력한 비밀번호 가져오기

			if (pw === "") {
				alert("비밀번호를 입력하세요.");
			} else {

				$.ajax({
					url : "json_pw_check.do",
					method : "GET",
					data : {
						pw : pw,
						m_id : m_id
					},
					dataType : "text",
					success : function(response) {

						if (response === "success") {
							console.log("비밀번호 확인 성공");
							$("#pw").val(''); // 비밀번호 필드 초기화
							$("#form").submit(); // 비밀번호 확인이 성공한 경우 폼 제출
						} else {
							console.log("비밀번호 확인 실패");
							alert("비밀번호가 일치하지 않습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.log('xhr.status:', xhr.status);
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>

	<main class="form-signin w-100 m-auto">

		<form id="form" action="mypage_setting_OK.do">
			<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
			<div id="positionCenter">
				<h1 class="h3 mb-3 fw-normal">비밀번호 확인</h1>
				<div class="form-floating">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="비밀번호"> <label for="pw">비밀번호 확인</label>
				</div>
				<input type="submit" class="w-100 btn btn-lg btn-primary"
					id="submitBtn" value="확인">
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