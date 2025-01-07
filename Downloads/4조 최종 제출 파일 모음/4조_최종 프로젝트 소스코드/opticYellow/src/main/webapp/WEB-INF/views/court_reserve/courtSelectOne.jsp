<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>selectOne</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">


<script>
	function newPage() {
		window.location.href='court_running.do?fac_id=' + '${vo2.fac_id}'
	}
</script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
</head>
<body>



	<main class="container">

		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="3000"
			style="position: relative; margin-bottom: 20px; margin-top: 20px; height: 350px;">
			<div class="carousel-inner">
				<c:if
					test="${not empty vo2.court_pic1 and not empty vo2.court_pic2 and not empty vo2.court_pic3}">
					<div class="carousel-item active">
						<img src="resources/images/court_image/${vo2.court_pic1}"
							class="d-block w-100" alt="Image 1"
							style="height: 100%; border-radius: 20px;">
					</div>
					<div class="carousel-item">
						<img src="resources/images/court_image/${vo2.court_pic2}"
							class="d-block w-100" alt="Image 2"
							style="height: 100%; border-radius: 20px;">
					</div>
					<div class="carousel-item">
						<img src="resources/images/court_image/${vo2.court_pic3}"
							class="d-block w-100" alt="Image 3"
							style="height: 100%; border-radius: 20px;">
					</div>
				</c:if>
				<c:if
					test="${not empty vo2.court_pic1 or not empty vo2.court_pic2 or not empty vo2.court_pic3}">
					<c:if test="${not empty vo2.court_pic1}">
						<div class="carousel-item active">
							<img src="resources/images/court_image/${vo2.court_pic1}"
								class="d-block w-100" alt="Image 1"
								style="height: 100%; border-radius: 20px;">
						</div>
					</c:if>
					<c:if test="${not empty vo2.court_pic2}">
						<div class="carousel-item">
							<img src="resources/images/court_image/${vo2.court_pic2}"
								class="d-block w-100" alt="Image 2"
								style="height: 100%; border-radius: 20px;">
						</div>
					</c:if>
					<c:if test="${not empty vo2.court_pic3}">
						<div class="carousel-item">
							<img src="resources/images/court_image/${vo2.court_pic3}"
								class="d-block w-100" alt="Image 3"
								style="height: 100%; border-radius: 20px;">
						</div>
					</c:if>
				</c:if>
				<c:if
					test="${empty vo2.court_pic1 and empty vo2.court_pic2 and empty vo2.court_pic3}">
					<div class="carousel-item active">
						<img src="resources/images/court_image/f_default.jpg"
							class="d-block w-100" alt="Default Image"
							style="height: 100%; border-radius: 20px;">
					</div>
				</c:if>
			</div>
			<c:if
				test="${not empty vo2.court_pic1 or not empty vo2.court_pic2 or not empty vo2.court_pic3}">
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</c:if>
		</div>





		<div class="row g-1">
			<div class="col-md-5">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<!-- Row 1 - Level and Gender -->
						<div class="row mb-3">
							<!-- Box 1 - Level -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 바닥 타입</br>${vo2.floor_type}
								</strong>
							</div>

							<!-- Box 2 - Gender -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 실내 실외 여부</br>${vo2.in_or_out}</strong>
							</div>
						</div>
						<!-- Row 2 - Floor Type and Indoor/Outdoor -->
						<div class="row mb-1">
							<!-- Box 3 - Floor Type -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 코트 면 개수</br>${vo2.court_no}
								</strong>
							</div>

							<!-- Box 4 - Indoor/Outdoor -->
							<div class="col">
								&nbsp;&nbsp; <strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> </strong>
							</div>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<!-- Row 3 - Conv -->
						<div class="row mb-1">
							<!-- Box 5 - Conv -->
							<div class="col" style="display: inline-block;">

								<p class="d-inline-block mb-2 text-dark"
									style="font-size: 1rem; display: inline-block;">${vo2.conv}
									시설이 있습니다.</p>
							</div>
						</div>

						<hr style="border-top: 1px solid #ccc;">
						<!-- Row 4 - Creater -->
						<div class="row mb-1">
							<!-- Box 6 - Creater -->
							<div class="col" style="display: inline-block;">
								<p style="font-size: 2rem; display: inline-block;">⏰</p>
								<p class="d-inline-block mb-2 text-dark"
									style="font-size: 1rem; display: inline-block;">운영시간은
									${vo2.open_time}:00 부터 ${vo2.close_time}:00입니다.</p>
							</div>
						</div>

						<!-- The rest of your content here... -->
					</div>
				</div>




			</div>
			<!-- 오른쪽 신청 박스 -->

			<div class="col-md-7">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<!-- 						<strong class="d-inline-block mb-2 text-dark"> <br> -->
						<!-- 						</strong> -->
						<p class="mb-1" style="font-size: 2.3rem;">${vo2.fac_name}</p>
						<div class="mb-1 text-muted">${vo2.address}</div>
						<hr style="border-top: 1px solid #ccc;">
						<div>
							<strong class="d-inline-block mb-2 text-dark"
								style="font-size: 1.3rem;"><span id="g_bill">${vo2.c_price}</span>원
							</strong>(시간당)
							<div class="mb=0"
								style="font-size: 1.1rem; display: flex; align-items: flex-start;">
								<p
									style="font-size: 2.3rem; vertical-align: top; line-height: 1; margin-top: 0;">🚗</p>
								<p style="margin-left: 0.5rem; margin-top: 0;">오시는길
									-${vo2.come}</p>
							</div>
							<div class="mb-1 text-muted" style="font-size: 0.8rem;">(코드등록자가
								설정한 시간과 비용입니다.)</div>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<div class="mb-1 text-muted" style="font-size: 1rem;"></div>


						<button onclick="newPage()" class="btn btn-primary btn-lg">코트
							예약 현황 보기</button>


					</div>
				</div>
			</div>
		</div>
	</main>
	<div id="map" class="mt-3 mb-3" style="width: 50%; height: 350px; margin: 0 auto;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cf6b08ae8cad71b9e6a94dd24c8900a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						'${vo2.address}',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo2.fac_name}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
	<!-- 전체  -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>

