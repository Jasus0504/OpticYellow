<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>


<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
}

/* .container { */
/* 	width: 100%; */
/* 	max-width: 940px; */
/* } */
#time_table th:first-child, #time_table td:first-child {
	width: 120px;
	font-size: 13px;
	font-weight: bold;
}

.table td {
	padding: 0;
	text-align: center;
	vertical-align: middle;
}

#time_table td.yes {
	background: url(resources/images/yes.png) no-repeat center center;

	/* 이미지 경로 및 속성 설정 */
}

#time_table td.no {
	background: url(resources/images/no.png) no-repeat center center;
	/* 이미지 경로 및 속성 설정 */
}

.centered-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 10vh;
}

.centered-text {
	text-align: center;
}

.container {
	position: relative;
	height: 70px;
}

.status {
	position: absolute;
	bottom: 0;
	right: 0;
}

.status-box {
	display: inline-block;
	padding: 5px 10px;
	margin: 5px;
	font-size: 12px;
	color: #fff;
	border-radius: 5px;
}

.available {
	background-color: #3C7DEF;
}

.unavailable {
	background-color: grey;
}
</style>




<script>
function extractHour(datetimeString) {
	var hour = null;
	if (datetimeString) {
		var time = datetimeString.split(" ")[1];
		hour = parseInt(time.split(":")[0], 10);
	}
	return hour;
}

// 선택된 날짜를 저장하는 변수, 초기값은 오늘 날짜
var selectedDateForAjax = new Date().toISOString().slice(0, 10);

// 이전 예약 목록의 초기화 및 새로운 예약 목록 로딩 함수
function updateReservationList() {
	// 테이블 초기화
	$("#time_table tbody").empty();
	selectAll();
}


//선택된 날짜 넣기 
function updateSelectedDateHighlight() {
  $(".calendar table > tbody > tr > td").each(function () {
    $(this).removeClass("selected"); 
    var dateClicked = $(this).attr("data-date");
    if (dateClicked != undefined && dateClicked === selectedDateForAjax) {
      $(this).addClass("selected");
      $(".selected-date").text(dateClicked); 
    }
  });
}

// 날짜가 선택되었을 때의 이벤트
$(document).on("click", ".calendar table > tbody > tr > td", function () {
  updateReservationList();
  var dateClicked = $(this).attr("data-date");
  if (dateClicked != undefined) {
    selectedDateForAjax = dateClicked;
    updateSelectedDateHighlight(); // Call the function to update the selected date highlight
  }
});



function selectAll() {
	console.log('selectAll()...');
	$.ajax({
		url: "json_courtRunning.do",
		data: {
			fac_id: '${param.fac_id}'
		},
		method: 'GET',
		dataType: 'json',
		success: function (vos) {
			console.log('ajax...success:', vos);

			$.each(vos, function (index, vo) {
				let avail_row = '';
				let open_time = parseInt(vo.open_time);
				let close_time = parseInt(vo.close_time);
				let court_name =vo.court_name;
				let court_id =vo.court_id;

				let tag_txt = "<tr id='" + court_id + "'><th>" + court_name + "</th>";


			
			
				for (let i = 0; i < 24; i++) {
					if (i >= open_time && i < close_time) {
						avail_row += "<td class='yes'></td>";
					} else {
						avail_row += "<td class='no'></td>";
					}
				}

				tag_txt += avail_row;

				tag_txt += `
					<td>
					<button class="btn btn-primary" type="button" onclick="openPopup('\${court_id}', '\${open_time}', '\${close_time}')">예약</button>
					</td>
				</tr>
				`;

				$('#time_table tbody').append(tag_txt);

				$.ajax({
					url: "json_courtReserveInfo.do",
					data: {
						court_id: vo.court_id,
						start_date: selectedDateForAjax,
						end_date: selectedDateForAjax
					},
					method: 'GET',
					dataType: 'json',
					success: function (arr) {
						console.log(arr);
						$.each(arr, function (index, vo) {
							if (vo) {
								var start_hour = extractHour(vo.start_time);
								var end_hour = extractHour(vo.end_time);

								for (var i = 0; i < 24; i++) {
									if ((i >= start_hour) && (i < end_hour)) {
										$('#' + vo.court_id + ' td:eq(' + i + ')').removeClass('yes').addClass('no');

									}
								}
							}
						});
					},
					error: function (xhr, status, error) {
						console.log('xhr.status:', xhr.status);
					}
				});
			});
		},
		error: function (xhr, status, error) {
			console.log('xhr.status:', xhr.status);
		}
	});
}
function openPopup(court_id, open_time, close_time) {
    window.open('court_reserve.do?court_id=' + court_id + '&open_time=' + open_time + '&close_time=' + close_time, 'popup', 'width=1000,height=500');
}
</script>
<body onload="selectAll()">
	<main>
		<div class="container">
			<div class="row align-items-center">
				<div class="col d-flex justify-content-center">
					<div class="centered-text">
						<span class="fs-4"><strong>코트 예약 현황</strong><br></span><span
							class="selected-date"></span>
					</div>
				</div>
			</div>
			<div class="status">
				<div class="status-box available">예약가능</div>
				<div class="status-box unavailable">예약불가</div>

			</div>
		</div>

		<!-- 			<div class="container"> -->

		<!-- 				<div class="col d-flex justify-content-center"> -->
		<!-- 					<div class="centered-text"> -->
		<!-- 						<span class="fs-4"><strong>코트 예약 현황</strong></span> -->
		<!-- 					</div> -->
		<!-- 				</div> -->

		<!-- 			</div> -->



		<!-- 		<div class="text-center mb-10 mt-10"> -->
		<!-- 			<span class="fs-4"><strong>코트 예약 현황</strong></span> -->

		<!-- 		</div> -->
		<jsp:include page="../calendar/court_calendar.jsp"></jsp:include>
		<div class="mt-4">
			<table class="table" id="time_table">
				<thead>
					<tr>
						<th>코트 \ 시간</th>
						<c:forEach var="i" begin="0" end="23">
							<th>${i}&nbsp;&nbsp;&nbsp;</th>
						</c:forEach>
						<th></th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<div class="text-center my-3">
        	<a href="court_list.do?user_id=${user_id}" class="btn btn-primary" role="button">예약 내역 보러가기</a>
    	</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
