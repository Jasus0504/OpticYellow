<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
.btn.game-list {
	background-color: #3C7DEF; /* 매치 목록 버튼 배경색 */
	color: #FFFFFF; /* 매치 목록 버튼 글자색 */
	font-size: 19px;
	text-align: bolder;
}

.btn.court-request {
	background-color: #3C7DEF; /* 코트 목록 버튼 배경색 */
	color: #FFFFFF; /* 코트 목록 버튼 글자색 */
	font-size: 19px;
	text-align: bolder;
}

.btn.active {
	background-color: #1061D9 !important; /* 활성화된 버튼 배경색 */
}

.btn:hover {
	background-color: #1061D9 !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 초기에 매치 목록 버튼을 활성화 상태로 설정
		$(".btn.game-list").addClass("active");

		// 매치 목록 버튼 클릭 시
		$(".btn.game-list").click(function() {
			// 버튼의 활성화 상태 변경
			$(".btn").removeClass("active");
			$(this).addClass("active");
		});

		// 다른 버튼들 클릭 시
		$(".btn.court-request").click(function() {
			// 버튼의 활성화 상태 변경
			$(".btn").removeClass("active");
			$(this).addClass("active");
		});

		// 페이지 로드 시 활성화된 버튼 찾아서 설정
		var currentUrl = window.location.href;
		if (currentUrl.indexOf("game_list.do") !== -1) {
			$(".btn").removeClass("active");
			$(".btn.game-list").addClass("active");
		} else if (currentUrl.indexOf("court_list.do") !== -1) {
			$(".btn").removeClass("active");
			$(".btn.court-request").addClass("active");
		}
	});
</script>

</head>
<body>

	<main class="container" style="margin-bottom: 1.5%">
		<button type="button" class="btn btn-primary btn-lg game-list"
			onclick="location.href='game_list.do?g_joiner=${user_id }'">매치
			목록</button>
		<button type="button" class="btn btn-primary btn-lg court-request"
			onclick="location.href='court_list.do?user_id=${user_id }'">코트
			목록</button>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>