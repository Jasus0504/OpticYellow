<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<style>
.btn {
	border-radius: 100px;
}

/* .dropdown-container { */
/* 	display: flex; */
/* 	justify-content: flex-start; */
/* 	flex-wrap: wrap; */
/* } */

/* .dropdown-container .dropdown { */
/* 	margin-right: 10px; /* 오른쪽 간격을 10px로 설정 */
* /
	/* } */                      

html, body {
	overflow-x: hidden; /* Prevent scroll on narrow devices */
}

/* body { */
/* 	padding-top: 56px; */
/* } */
@media ( max-width : 991.98px) {
	.offcanvas-collapse {
		position: fixed;
		top: 56px; /* Height of navbar */
		bottom: 0;
		left: 100%;
		width: 100%;
		padding-right: 1rem;
		padding-left: 1rem;
		overflow-y: auto;
		visibility: hidden;
		background-color: #343a40;
		transition: transform .3s ease-in-out, visibility .3s ease-in-out;
	}
	.offcanvas-collapse.open {
		visibility: visible;
		transform: translateX(-100%);
	}
}

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
	.carousel-container {
		width: 750px; /* Adjust this value to your preference */
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 20px auto; /* Added this line */
	}
}

@media ( min-width : 992px) {
	.container {
		width: 940px;
	}
	.carousel-container {
		width: 940px; /* Adjust this value to your preference */
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 20px auto;
	}
}

/* #carouselExample {
	background-color: #ffffff;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.rounded-carousel {
	border-radius: 20px;
	object-fit: cover;
	height: 100%;
	width: 100%;
	display: block;
} */

/*  .main.container {  background-color: #f2f2f2; /* 배경색 변경 */
* /* 	 } .container { */
	/* 	background-color: #f2f2f2; /* 전체 배경색 변경 */ *
	/* 	padding-top: 5px; /* 위쪽 여백 추가 */ *
	/* 	padding-bottom: 5px; /* 아래쪽 여백 추가*/ * /* } */                    

.bg-body {
	background-color: #ffffff; /* 목록의 배경색 변경 */
}

#list-base {
	margin-bottom: 1.5%; /* 목록 사이 간격 설정 */
}

/* 화살표 색 */
.carousel-control-prev, .carousel-control-next {
	filter: invert(1);
}

.carousel-control-prev-icon::before, .carousel-control-next-icon::before
	{
	color: #3C7DEF; /* Adjust this color to your preference */
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function fn() {

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
								weather + "<br/>현재 온도: " + data.main.temp
										+ '°C');
					}
				});
			});
		} else {
			$('#weather').html("지리 위치 정보를 사용할 수 없습니다.");
		}

	}
</script>
</head>
<body onload="fn()">
	<jsp:include page="top_menu.jsp"></jsp:include>

	
	<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-container">
			<div class="carousel-inner" style="border-radius: 20px;">
				<div class="carousel-item active">
					<img src="resources/images/home/b1.jpg" class="d-block w-100" alt="b1">
				</div>
				<div class="carousel-item">
				  <img src="resources/images/home/b1.jpg" class="d-block w-100" alt="b1">
				</div>
				<div class="carousel-item">
					<img src="resources/images/home/b1.jpg" class="d-block w-100" alt="b1">
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" style="margin-left:5%" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" style="margin-right:5%" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>




<!-- 	<div id="carouselExample" class="carousel slide mb-0" -->
<!-- 		data-bs-ride="carousel" data-bs-interval="3000"> -->
<!-- 		<div class="carousel-indicators"> -->
<!-- 			<button type="button" data-bs-target="#carouselExampleIndicators" -->
<!-- 				data-bs-slide-to="0" class="active" aria-current="true" -->
<!-- 				aria-label="Slide 1"></button> -->
<!-- 			<button type="button" data-bs-target="#carouselExampleIndicators" -->
<!-- 				data-bs-slide-to="1" aria-label="Slide 2"></button> -->
<!-- 			<button type="button" data-bs-target="#carouselExampleIndicators" -->
<!-- 				data-bs-slide-to="2" aria-label="Slide 3"></button> -->
<!-- 		</div> -->
<!-- 		<div class="carousel-inner"> -->
<!-- 			<div class="carousel-item active"> -->
<!-- 				<div -->
<!-- 					class="carousel-container d-flex justify-content-center align-items-center"> -->
<!-- 					<img src="resources/images/home/b1.jpg" -->
<!-- 						class="d-block rounded-carousel" alt="..."> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item active"> -->
<!-- 				<div -->
<!-- 					class="carousel-container d-flex justify-content-center align-items-center"> -->
<!-- 					<img src="resources/images/home/b1.jpg" -->
<!-- 						class="d-block rounded-carousel" alt="..."> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="carousel-item active"> -->
<!-- 				<div -->
<!-- 					class="carousel-container d-flex justify-content-center align-items-center"> -->
<!-- 					<img src="resources/images/home/b1.jpg" -->
<!-- 						class="d-block rounded-carousel" alt="..."> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 		<button class="carousel-control-prev" type="button" -->
<!-- 			data-bs-target="#carouselExample" data-bs-slide="prev"> -->
<!-- 			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span -->
<!-- 				class="visually-hidden">Previous</span> -->
<!-- 		</button> -->
<!-- 		<button class="carousel-control-next" type="button" -->
<!-- 			data-bs-target="#carouselExample" data-bs-slide="next"> -->
<!-- 			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span -->
<!-- 				class="visually-hidden">Next</span> -->
<!-- 		</button> -->
<!-- 	</div> -->
	<!-- 	<div class="border-bottom mt-1"></div> -->







	<jsp:include page="calendar/calendar.jsp"></jsp:include>

	<main class="container">
		<c:forEach var="vo" items="${vos}">
			<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base"
				data-remaining="${vo.g_remaining}">
				<div
					class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
					<div class="flex-wrap p-2 fs-6 justify-content-center"
						style="width: 15%; text-align: center;">
						<a href="#" class="text-gray-dark"><strong>${vo.g_start_dt}</strong></a>
					</div>
					<div class="p-2 fs-6 justify-content-between"
						style="width: 70%; display: flex; justify-content: center; flex-wrap: wrap;">
						<!-- 첫 번째 행 -->
						<div class="p-2 text-dark"
							style="width: 100%; text-align: left; font-size: 18px;">
							<a href="g_selectOne.do?g_num=${vo.g_num}"> ${vo.g_name}</a>
						</div>

						<!-- 두 번째 행 -->
						<div class="p-2 text-gray-dark"
							style="flex: 1; font-size: 14px; display: flex; align-items: center;">
							🎾ntrp ${vo.g_ntrp}▲ | 🥎${vo.g_method} | 🚩 ${vo.fac_name}</div>
					</div>
					<div class="p-2 justify-content-center"
						style="width: 33%; text-align: center;">
						<a href="g_selectOne.do?g_num=${vo.g_num}" class="btn p-3"
							style="flex: 1; text-align: center; font-size: 16px;">button</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</main>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var listBases = document.querySelectorAll('[id^="list-base"]');
			listBases.forEach(function(listBase) {
				var button = listBase.querySelector('.btn');
				var gRemaining = listBase.dataset.remaining;

				if (gRemaining == 0) {
					button.classList.add("btn-secondary");
					button.innerText = '　마감　';
				} else if (gRemaining < 2) {
					button.classList.add("btn-danger");
					button.innerText = '마감임박';
				} else {
					button.classList.add("btn-primary");
					button.innerText = '신청가능';
				}
			});
		});
	</script>



	<jsp:include page="footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
