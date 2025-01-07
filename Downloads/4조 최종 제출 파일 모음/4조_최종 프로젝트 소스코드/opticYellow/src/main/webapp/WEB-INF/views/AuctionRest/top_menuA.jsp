<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.0/examples/sidebars/">
<link rel="stylesheet" href="resources/css/main/headers.css">
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" -->
<!-- 	crossorigin="anonymous"> -->


<style>
/* body { */
/* 	overflow-x: hidden; */
/* } */
.overlay {
	position: fixed;
	top: 0;
	left: 0;
	height: 100vh;
	width: 100vw;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 998;
	display: none;
}

.overlay.show {
	display: block;
}

#sidebar {
	position: fixed;
	top: 0;
	right: -280px;
	height: 100vh;
	width: 280px;
	transition: transform 0.3s ease-in-out;
	background-color: #fff;
	z-index: 999;
}

#sidebar.show {
	transform: translateX(-280px);
}

.btn {
	border-radius: 100px;
}

.dropdown-container {
	display: flex;
	justify-content: flex-start;
	flex-wrap: wrap;
}

.dropdown-container .dropdown {
	margin-right: 10px; /* 오른쪽 간격을 10px로 설정 */
}

html, body {
	overflow-x: hidden; /* Prevent scroll on narrow devices */
}

/* body { */
/* 	padding-top: 56px; */
/* } */
/* @media ( max-width : 991.98px) { */
/* 	.offcanvas-collapse { */
/* 		position: fixed; */
/* 		top: 56px; /* Height of navbar */ */
/* 		bottom: 0; */
/* 		left: 100%; */
/* 		width: 100%; */
/* 		padding-right: 1rem; */
/* 		padding-left: 1rem; */
/* 		overflow-y: auto; */
/* 		visibility: hidden; */
/* 		background-color: #343a40; */
/* 		transition: transform .3s ease-in-out, visibility .3s ease-in-out; */
/* 	} */
/* 	.offcanvas-collapse.open { */
/* 		visibility: visible; */
/* 		transform: translateX(-100%); */
/* 	} */
/* } */

.nav-scroller .nav {
	color: rgba(255, 255, 255, .75);
}

.nav-scroller .nav-link {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: .875rem;
	color: #6c757d;
}

.nav-scroller .nav-link:hover {
	color: #007bff;
}

.nav-scroller .active {
	font-weight: 500;
	color: #343a40;
}

.nav-link {
	pointer-events: auto;
}

.bg-purple {
	background-color: #6f42c1;
}

#imgSrc {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover;
	object-position: center;
	margin-bottom: 20px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: #3C7DEF;
}

@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 940px;
	}
}

/* .main.container { */
/* 	background-color: #f2f2f2; /* 배경색 변경 */
* /
	/* } */                                                         

.container {
	background-color: #f2f2f2; /* 전체 배경색 변경 */
	padding-top: 5px; /* 위쪽 여백 추가 */
	padding-bottom: 5px; /* 아래쪽 여백 추가 */
}

.bg-body {
	background-color: #ffffff; /* 목록의 배경색 변경 */
}

#list-base {
	margin-bottom: 1.5%; /* 목록 사이 간격 설정 */
}

</style>

</head>
<body class="bg-white">
	<div style="width: 100%">
		<div class="container" id="cont_h">
			<header class="" style="height: 100px;">
				<div class="d-flex h-100">
					<a href="home.do" class="me-auto my-auto p-2"> <img
						src="resources/images/logo.png" width="220">
					</a>
					<form class="my-auto p-2 d-flex justify-content-end" role="search"
						action="p_searchList.do">
						<select name="searchKey" id="searchKey" style="padding-left:6px;border-color:#ced4da;border-top-left-radius:6px; border-bottom-left-radius:6px;border-top-right-radius:0; border-bottom-right-radius:0;">
							<option value="AllProduct">전체</option>
							<option value="racket">라켓</option>
							<option value="racket_bag">라켓 가방</option>
							<option value="sports_bag">스포츠 가방</option>
							<option value="tshirt">티셔츠</option>
							<option value="pants">바지</option>
							<option value="shoes">신발</option>
							<option value="accessory">액세서리</option>
							<option value="ball">테니스 공</option>
							<option value="etc">기타</option>
						</select> 
						<input type="text" name="searchWord" id="searchWord"
							class="form-control" placeholder="용품 검색" style="width:50%;border-top-left-radius:0; border-bottom-left-radius:0;">
					</form>

					<ul class="nav my-auto p2">
						<li class="nav-item dropdown"><a role="button" id="m_img"
							class="nav-link dropdown-toggle px-2" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="resources/images/top_menu/person-circle.svg" style="width: 28px;">
						</a>
							<ul class="dropdown-menu">
								<li id="m_insert"><a class="dropdown-item" href="m_insert.do">회원가입</a></li>
								<li id="login"><a class="dropdown-item" href="login.do">로그인</a></li>
								<li id="logout"><a class="dropdown-item" href="logoutOK.do">로그아웃</a></li>
								<li id="myPage"><a class="dropdown-item" href="myPage.do">마이페이지</a></li>
								<li class="adminPage"><hr class="dropdown-divider"></li>
								<li class="adminPage"><a class="dropdown-item"
									href="adminPage.do">관리자</a></li>
							</ul></li>
						<li class="nav-item my-auto" style="position: relative; top: 5px;">
						<label for="menuicon" style="cursor: pointer;" onclick="toggleSidebar()">
								<img src="resources/Jae/images/list.svg"
								style="width: 28px;">
						</label></li>
					</ul>
				</div>
			</header>
			<nav style="height: 100px">
				<ul
					class="nav d-flex justify-content-between align-content-end h-100">
					<li class="nav-item"><a href="g_insert.do"
						class="nav-link link-body-emphasis"><span
							class="d-block text-center mb-2">✨</span><span>매치등록</span></a></li>
					<li class="nav-item"><a href="g_selectAll.do"
						class="nav-link link-body-emphasis"><span
							class="d-block text-center mb-2">🎾</span><span>매치목록</span></a></li>
					<li class="nav-item"><a href="court_selectAll.do"
						class="nav-link link-body-emphasis"><span
							class="d-block text-center mb-2">🥎</span><span>코트목록</span></a></li>
					<li class="nav-item"><a href="commuList.do"
						class="nav-link link-body-emphasis"><span
							class="d-block text-center mb-2">🍀</span><span>커뮤니티</span></a></li>
					<li class="nav-item"><a href="AuctionMainHome.do"
						class="nav-link link-body-emphasis"><span
							class="d-block text-center mb-2">👀</span><span>용품경매</span></a></li>
				</ul>
			</nav>
		</div>
		<div class="border-bottom mt-1"></div>
	</div>

	<div class="overlay" onclick="closeSidebar()"></div>
	<div id="sidebar" class="flex-shrink-0 p-3 bg-white"
		style="width: 280px;">
		<a href="home.do"
			class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
			<img src="resources/images/logo.png" width="150"> <!-- Home 넣으려면 여기다 -->
			<span class="fs-5 fw-semibold"></span>
		</a>
		<ul class="list-unstyled ps-0">
			<li class="mb-1">
				<button
					class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
					data-bs-toggle="collapse" data-bs-target="#weather-collapse"
					aria-expanded="true">
					<Strong>현재 날씨</Strong>
				</button>
				<div class="collapse" id="weather-collapse"
					style="text-align: center;">
					<div>
						<span id="weather-icon" style="font-size: 2em;"></span>
						<p id="weather">날씨 로딩중</p>
					</div>
				</div>

			</li>
			<li class="mb-1">
				<button
					class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
					data-bs-toggle="collapse" data-bs-target="#air-collapse"
					aria-expanded="true">
					<Strong>현재 미세먼지</Strong>
				</button>
				<div class="collapse" id="air-collapse" style="text-align: center;">
					<div>
						<span id="pm10-icon" style="font-size: 2em;"></span>
						<p id="result">미세먼지 로딩중</p>
					</div>
				</div>

			</li>
			<li class="mb-1"><a href="n_selectAll.do">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false">
						<Strong>공지사항</Strong>
					</button>
			</a></li>
			<li class="mb-1"><a href="q_selectAll.do">
					<button a href
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#orders-collapse"
						aria-expanded="false">
						<Strong>FAQ</Strong>
					</button>
			</a> <!-- 				<div class="collapse" id="orders-collapse"> --> <!-- 					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small"> -->
				<!-- 						<li><a href="#" --> <!-- 							class="link-dark d-inline-flex text-decoration-none rounded">New</a></li> -->
				<!-- 						<li><a href="#" --> <!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Processed</a></li> -->
				<!-- 						<li><a href="#" --> <!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a></li> -->
				<!-- 						<li><a href="#" --> <!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Returned</a></li> -->
				<!-- 					</ul> --> <!-- 				</div> --></li>
			<li class="border-top my-3"></li>
			<!-- 			<li class="mb-1"> -->
			<!-- 				<button -->
			<!-- 					class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" -->
			<!-- 					data-bs-toggle="collapse" data-bs-target="#account-collapse" -->
			<!-- 					aria-expanded="false">Account</button> -->
			<!-- 				<div class="collapse" id="account-collapse"> -->
			<!-- 					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small"> -->
			<!-- 						<li><a href="#" -->
			<!-- 							class="link-dark d-inline-flex text-decoration-none rounded">New...</a></li> -->
			<!-- 						<li><a href="#" -->
			<!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li> -->
			<!-- 						<li><a href="#" -->
			<!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li> -->
			<!-- 						<li><a href="#" -->
			<!-- 							class="link-dark d-inline-flex text-decoration-none rounded">Sign -->
			<!-- 								out</a></li> -->
			<!-- 					</ul> -->
			<!-- 				</div> -->
			<!-- 			</li> -->
		</ul>
	</div>






	<script type="text/javascript">
		// USER > ADMIN > 비회원
		if ('${role}' === 'USER') {
			$('#m_insert').hide();
			$('#login').hide();
			$('#logout').show();
			$('.adminPage').hide();
			$('#myPage').show();
			$('#menuicon').show(); // Show the menu icon for logged-in users
		} else if ('${role}' === 'ADMIN') {
			$('#m_insert').hide();
			$('#login').hide();
			$('#logout').show();
			$('.adminPage').show();
			$('#myPage').show();
			$('#menuicon').show(); // Show the menu icon for admins
		} else {
			$('#m_insert').show();
			$('#login').show();
			$('#logout').hide();
			$('.adminPage').hide();
			$('#myPage').hide();
			$('#menuicon').hide(); // Hide the menu icon for non-logged-in users
		}

		// 로그인 > 프로필 이미지로 변경
		let profile;

		if ('${user_id}' !== '') {
			profile = `<img src="resources/uploadimg/${m_img}" style="width:28px;height:28px;border-radius:50%;">`;
			$('#m_img').html(profile);
		} else {
			profile = `<img src="resources/images/top_menu/person-circle.svg" style="width:28px;height:28px;">`;
			$('#m_img').html(profile);
		}

		function toggleSidebar() {
			var sidebar = document.getElementById('sidebar');
			sidebar.classList.toggle('show');
			var overlay = document.querySelector('.overlay');
			overlay.classList.toggle('show');
		}

		function closeSidebar() {
			var sidebar = document.getElementById('sidebar');
			sidebar.classList.remove('show');
			var overlay = document.querySelector('.overlay');
			overlay.classList.remove('show');
		}
	</script>
	<script>
		// 날씨 API
		var apiKey = "d34b420efcac6b3d302fe362e54cf7ec";

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;

				$.ajax({
					url : 'http://api.openweathermap.org/data/2.5/weather',
					dataType : 'json',
					type : 'GET',
					data : {
						lat : lat,
						lon : lon,
						appid : apiKey,
						units : 'metric',
						lang : 'kr'
					},

					success : function(data) {
						var weather = "";
						$.each(data.weather, function(index, val) {
							weather += val.main + ', ' + val.description;
						});
						$('#weather').html(
								weather + "</br>현재 온도: " + data.main.temp
										+ '°C');
						var icon = '';
						switch (data.weather[0].main) {
						case 'Clear':
							icon = '☀️';
							break;
						case 'Clouds':
							icon = '☁️';
							break;
						case 'Rain':
							icon = '🌧️';
							break;
						case 'Snow':
							icon = '❄️';
							break;
						case 'Mist':
						case 'Smoke':
						case 'Haze':
						case 'Fog':
							icon = '🌫️';
							break;
						case 'Thunderstorm':
							icon = '⛈️';
							break;
						default:
							icon = '🌈';
						}
						$('#weather-icon').html(icon);
					}
				});
			});
		} else {
			$('#weather').html("지리 위치 정보를 사용할 수 없습니다.");
		}
	</script>
	<script>
		// 모든 지역의 평균 미세먼지 수치를 가져오는 함수
		// 모든 지역의 평균 미세먼지 수치를 가져오는 함수
		function getAllAveragePm10() {
			$.ajax({
				url : "AirQualityServlet",
				dataType : "json",
				success : function(response) {
					console.log(response);
					var allData = response.response.body.items;
					if (allData.length > 0) {
						var averagePm10 = calculateAveragePm10(allData);
						var $result = $("#result");
						var icon = '';

						if (averagePm10 <= 30) {
							$result.text("현재 서울 평균 미세먼지: "
									+ averagePm10.toFixed(2));
							$result.removeClass().addClass("good");
							icon = '😃';
						} else if (averagePm10 > 30 && averagePm10 <= 80) {
							$result.text("현재 서울 평균 미세먼지: "
									+ averagePm10.toFixed(2));
							$result.removeClass().addClass("moderate");
							icon = '😐';
						} else if (averagePm10 > 80 && averagePm10 <= 150) {
							$result.text("현재 서울 평균 미세먼지: "
									+ averagePm10.toFixed(2));
							$result.removeClass().addClass("bad");
							icon = '😷';
						} else {
							$result.text("현재 서울 평균 미세먼지: "
									+ averagePm10.toFixed(2));
							$result.removeClass().addClass("very-bad");
							icon = '🤢';
						}

						$('#pm10-icon').html(icon); // 아이콘을 #pm10-icon 요소에 추가
					} else {
						$("#result").text("데이터가 없습니다.");
						$('#pm10-icon').html('❌'); // 데이터가 없을 경우의 아이콘
					}
				},
				error : function() {
					console.log("데이터를 가져오는 데 실패했습니다.");
					$('#pm10-icon').html('❌'); // 에러 발생 시의 아이콘
				}
			});
		}

		// 평균 미세먼지 량 계산 함수
		function calculateAveragePm10(data) {
			console.log(data);
			var sumPm10 = 0;

			for (var i = 0; i < data.length; i++) {
				var pm10Value = parseInt(data[i].pm10Value);

				if (!isNaN(pm10Value)) {
					sumPm10 += pm10Value;
				} else {
					sumPm10 += 0;
				}
			}

			var averagePm10 = sumPm10 / data.length;
			console.log(sumPm10);
			return averagePm10;
		}

		$(document).ready(function() {
			getAllAveragePm10(); // 페이지 로딩 시 전체 평균 미세먼지 수치 표시
		});
	</script>
	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
</body>

</html>
