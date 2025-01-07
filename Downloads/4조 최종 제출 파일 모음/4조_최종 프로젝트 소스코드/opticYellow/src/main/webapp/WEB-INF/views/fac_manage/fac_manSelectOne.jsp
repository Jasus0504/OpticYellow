<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/dist/css/bootstrap-icons.min.css">
<style>
.map-container {
	font-size: 1.1rem;
	display: flex;
	align-items: flex-start;
}

.map-container p:first-child {
	font-size: 2.3rem;
	vertical-align: top;
	line-height: 1;
	margin-top: 0;
}

.carousel-inner img {
	border-radius: 20px;
}
</style>
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

<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "json_facManSelectOne.do",
			data : {
				fac_id : '${param.fac_id}'
			},
			method : 'GET',
			dataType : 'json',
			success : function(vo2) {
				console.log('ajax...success:', vo2);
				populateData(vo2);
				loadBackgroundImages(vo2);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});

		function populateData(vo2) {
			$("#vo1 .col-md-5 .col strong:eq(0)").html(
					"바닥 타입<br>" + vo2.floor_type);
			$("#vo1 .col-md-5 .col strong:eq(1)").html(
					"실내 실외 여부<br>" + vo2.in_or_out);
			$("#vo1 .col-md-5 .col strong:eq(2)").html(
					"코트 면 개수<br>" + vo2.court_no);
			$("#vo1 .col-md-5 .col strong:eq(3)").html(
					"승인 여부<br>" + vo2.f_confirm);
			$("#time").html(
					"운영시간은 " + vo2.open_time + ":00 부터 " + vo2.close_time
							+ ":00입니다.");
			$("#conv").html(vo2.conv);

			$("#vo1 .col-md-7 p.mb-1").text(vo2.fac_name);
			$("#address").text(vo2.address);
			$("#bill").text(vo2.c_price);
			$("#come").text(vo2.come);

			$("#vo1 .col-md-7 div.row a:eq(0)").attr("href",
					"fac_update.do?fac_id=" + vo2.fac_id);
			$("#vo1 .col-md-7 div.row a:eq(1)").attr("href",
					"fac_deleteOK.do?fac_id=" + vo2.fac_id);
			$("#vo1 .col-md-7 div.row a:eq(2)").attr(
					"href",
					"fac_confirmOKOne.do?fac_id=" + vo2.fac_id + "&fac_name="
							+ vo2.fac_name + "&court_no=" + vo2.court_no);
		}

		function loadBackgroundImages(vo2) {
			var courtPic1 = vo2.court_pic1;
			var courtPic2 = vo2.court_pic2;
			var courtPic3 = vo2.court_pic3;

			if (courtPic1 && courtPic2 && courtPic3) {
				loadCarouselImages([ courtPic1, courtPic2, courtPic3 ]);
			} else if (courtPic1 && courtPic2) {
				loadCarouselImages([ courtPic1, courtPic2 ]);
			} else if (courtPic1) {
				loadCarouselImages([ courtPic1 ]);
			} else {
				loadCarouselImages([ 'f_default.jpg' ]);
			}
		}

		function loadCarouselImages(images) {
			var carouselInner = $('.carousel-inner');
			carouselInner.empty();

			images.forEach(function(image, index) {
				var carouselItem = $('<div></div>').addClass('carousel-item');
				if (index === 0) {
					carouselItem.addClass('active');
				}

				var img = $('<img>').attr('src',
						'resources/images/court_image/' + image).addClass(
						'd-block w-100').attr('alt', 'Image ' + (index + 1))
						.css('height', '100%');

				carouselItem.append(img);
				carouselInner.append(carouselItem);
			});

			if (images.length > 1) {
				$('.carousel-control-prev, .carousel-control-next').show();
			} else {
				$('.carousel-control-prev, .carousel-control-next').hide();
			}

			$('.carousel').carousel({
				interval : 3000
			});
		}
	});
	
	function confirmFacility(event) {
	    var confirmStatus = $("#vo1 .col-md-5 .col strong:eq(3)").text();
	    if (confirmStatus.includes("Y")) {
	        alert("이미 승인된 테니스장입니다");
	        event.preventDefault(); 
	    } else {
	        window.location.href = "fac_confirmOKOne.do?fac_id=" + vo2.fac_id + "&fac_name=" + vo2.fac_name + "&court_no=" + vo2.court_no;
	    }
	}

</script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<main class="container">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="3000"
			style="position: relative; height: 350px; margin-bottom: 20px; margin-top: 20px;">
			<div class="carousel-inner">
				<!-- Images will be dynamically loaded here -->
			</div>
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
		</div>



		<div class="row g-1" id="vo1">
			<div class="col-md-5">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<!-- Row 1 - Level and Gender -->
						<div class="row mb-3">
							<!-- Box 1 - Level -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 바닥 타입<br>${vo2.floor_type}</strong>
							</div>

							<!-- Box 2 - Gender -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 실내 실외 여부<br>${vo2.in_or_out}</strong>
							</div>
						</div>
						<!-- Row 2 - Floor Type and Indoor/Outdoor -->
						<div class="row mb-1">
							<!-- Box 3 - Floor Type -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 코트 면 개수<br>${vo2.court_no}</strong>
							</div>
							<!-- Box 4 - Confirm -->
							<div class="col">
								<strong class="d-inline-block mb-3 text-dark"
									style="font-size: 1rem;"> 승인 여부<br>${vo2.f_confirm}</strong>
							</div>

							<!-- 							Box 4 - Indoor/Outdoor -->
							<!-- 							<div class="col"> -->
							<!-- 								&nbsp;&nbsp; <strong class="d-inline-block mb-3 text-dark" -->
							<!-- 									style="font-size: 1rem;"> </strong> -->
							<!-- 							</div> -->
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<!-- Row 3 - Conv -->
						<div class="row mb-1">
							<!-- Box 5 - Conv -->
							<div class="col" style="display: inline-block;">
								<p class="d-inline-block mb-2 text-dark" 
									style="font-size: 1rem; display: inline-block;"><span id="conv">${vo2.conv}</span>
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
									style="font-size: 1rem; display: inline-block;">
									<span id="time">운영시간은 ${vo2.open_time}:00 부터
										${vo2.close_time}:00입니다.</span>
								</p>
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
						<p class="mb-1" style="font-size: 2.3rem;">${vo2.fac_name}</p>
						<div class="mb-1 text-muted">
							<span id="address">${vo2.address}</span>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<div>
							<strong class="d-inline-block mb-2 text-dark"
								style="font-size: 1.3rem;"><span id="bill">${vo2.c_price}</span>원</strong>(시간당)
							<div class="mb=0"
								style="font-size: 1.1rem; display: flex; align-items: flex-start;">
								<p
									style="font-size: 2.3rem; vertical-align: top; line-height: 1; margin-top: 0;">🚗</p>
								<p style="margin-left: 0.5rem; margin-top: 0;">
									오시는길 -<span id="come">${vo2.come}</span>
								</p>
							</div>


							<div class="mb-1 text-muted" style="font-size: 0.8rem;">(코드등록자가
								설정한 시간당 비용과 위치입니다.)</div>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<!-- 						<div class="mb-1 text-muted" style="font-size: 1rem;"> -->
					</div>

					<div class="row mb-5">
						<div class="col">
							<a href="fac_update.do?fac_id=${vo2.fac_id}">
								<button class="myButton btn btn-primary btn-lg btn-block px-5">수정</button>
							</a>
						</div>
						<div class="col">
							<a href="fac_deleteOK.do?fac_id=${vo2.fac_id}">
								<button class="myButton btn btn-danger btn-lg btn-block px-5">삭제</button>
							</a>
						</div>
						<div class="col">
							<a
								href="fac_confirmOKOne.do?fac_id=${vo2.fac_id}&fac_name=${vo2.fac_name}&court_no=${vo2.court_no}">
								<button onclick="confirmFacility(event)" class="myButton btn btn-secondary btn-lg btn-block px-5">승인</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- 전체 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
