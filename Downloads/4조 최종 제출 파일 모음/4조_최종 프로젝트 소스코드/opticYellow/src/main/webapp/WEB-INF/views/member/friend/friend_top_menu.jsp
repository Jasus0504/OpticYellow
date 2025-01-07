<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>

<style>
.btn.friend-list {
	background-color: #3C7DEF; /* 친구 목록 버튼 배경색 */
	color: #FFFFFF; /* 친구 목록 버튼 글자색 */
}

.btn.friend-request {
	background-color: #3C7DEF; /* 친구 신청 버튼 배경색 */
	color: #FFFFFF; /* 친구 신청 버튼 글자색 */
}

.btn.friend-recommend {
	background-color: #3C7DEF; /* 친구 추천 버튼 배경색 */
	color: #FFFFFF; /* 친구 추천 버튼 글자색 */
}

.btn.member-search {
	background-color: #3C7DEF; /* 회원 검색 버튼 배경색 */
	color: #FFFFFF; /* 회원 검색 버튼 글자색 */
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
	$(document)
			.ready(
					function() {
						// 초기에 친구 목록 버튼을 활성화 상태로 설정
						$(".btn.friend-list").addClass("active");

						// 친구 목록 버튼 클릭 시
						$(".btn.friend-list").click(function() {
							// 버튼의 활성화 상태 변경
							$(".btn").removeClass("active");
							$(this).addClass("active");
						});

						// 다른 버튼들 클릭 시
						$(
								".btn.friend-request, .btn.friend-recommend, .btn.member-search")
								.click(function() {
									// 버튼의 활성화 상태 변경
									$(".btn").removeClass("active");
									$(this).addClass("active");
								});
						// 페이지 로드 시 활성화된 버튼 찾아서 설정
						var currentUrl = window.location.href;
						if (currentUrl.indexOf("friend_list.do") !== -1) {
							$(".btn").removeClass("active");
							$(".btn.friend-list").addClass("active");
						} else if (currentUrl.indexOf("friend_state.do") !== -1) {
							$(".btn").removeClass("active");
							$(".btn.friend-request").addClass("active");
						} else if (currentUrl.indexOf("friend_random_list.do") !== -1) {
							$(".btn").removeClass("active");
							$(".btn.friend-recommend").addClass("active");
						} else if (currentUrl.indexOf("friend_search.do") !== -1) {
							$(".btn").removeClass("active");
							$(".btn.member-search").addClass("active");
						}
					});
</script>

</head>
<body>


	<main class="container">
		<button type="button" class="btn btn-primary btn-lg friend-list"
			onclick="location.href='friend_list.do'">친구 목록</button>
		<button type="button" class="btn btn-primary btn-lg friend-request"
			onclick="location.href='friend_state.do'">신청 현황</button>
		<button type="button" class="btn btn-primary btn-lg friend-recommend"
			onclick="location.href='friend_random_list.do'">친구 추천</button>
		<button type="button" class="btn btn-primary btn-lg member-search"
			onclick="location.href='friend_search.do'">회원 검색</button>
	</main>

</body>
</html>