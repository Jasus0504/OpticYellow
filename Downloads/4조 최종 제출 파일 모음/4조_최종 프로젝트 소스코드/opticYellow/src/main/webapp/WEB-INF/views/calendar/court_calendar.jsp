<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>캘린더</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="${path}/resources/js/calendar.js"></script>
<link href="${path}/resources/css/calendar.css" rel="stylesheet" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
</head>
<body class="py-5">
	<main class="container">
		<div class="calendar">
			<!-- 		<div class="calendar-header"> -->
	<!-- 		<span class="calendar-yearmonth"></span> -->
			<div class="calendar-controls">
				<button type="button" class="calendar-prev"><img src="resources/images/calendar/arrow-left.svg" style="width:20px;"></button>
	
				<div id="calendar"  style="width:100%"></div>
	
				<button type="button" class="calendar-next"><img src="resources/images/calendar/arrow-right.svg" style="width:20px;"></button>
			</div>
			<!-- 				<button type="button" class="calendar-next">&gt;</button> -->
			<!-- 				<button type="button" class="calendar-today">오늘</button> -->
			<!-- 			<div class="calendar-views"> -->
			<!-- 				<button type="button" class="calendar-view-year">연간</button> -->
			<!-- 				<button type="button" class="calendar-view-month">월간</button> -->
			<!-- 				<button type="button" class="calendar-view-week">주간</button> -->
			<!-- 			</div> -->
		</div>
	</main>
	<script>
		$(document).ready(function() {
			calendarWeek(new Date()); // 주간 달력을 화면에 나타내기 위해 함수 호출
			$(".calendar-view-week").addClass("active"); // 주간 달력 버튼을 활성화 상태로 표시
		});

		// 이하 생략

		// 달력 뷰 버튼
		$(".calendar-views > button").on("click", function(event) {
			$(".calendar-views > button").each(function() {
				$(this).removeClass("active");
			});
			if ($(event.target).hasClass("calendar-view-year")) {
				calendarYear(new Date());
			} else if ($(event.target).hasClass("calendar-view-month")) {
				calendarMonth(new Date());
			} else if ($(event.target).hasClass("calendar-view-week")) {
				calendarWeek(new Date());
			}
			$(event.target).addClass("active");
		});

		// 이전 이동 버튼
		$(".calendar-controls > .calendar-prev").on(
				"click",
				function() {
					if ($(".calendar").hasClass("year")) {
						var year = $("#calendar").attr("data-date");
						calendarYear(new Date(parseInt(year) - 1, 1, 1));
					} else if ($(".calendar").hasClass("month")) {
						var yearmonth = $("#calendar").attr("data-date").split(
								"-");
						calendarMonth(new Date(parseInt(yearmonth[0]),
								parseInt(yearmonth[1]) - 2, 1));
					} else if ($(".calendar").hasClass("week")) {
						var yearmonthday = $("#calendar").attr("data-date")
								.split("-");
						calendarWeek(new Date(parseInt(yearmonthday[0]),
								parseInt(yearmonthday[1]) - 1,
								parseInt(yearmonthday[2]) - 7));
					}
				});

		// 다음 이동 버튼
		$(".calendar-controls > .calendar-next").on(
				"click",
				function() {
					if ($(".calendar").hasClass("year")) {
						var year = $("#calendar").attr("data-date");
						calendarYear(new Date(parseInt(year) + 1, 1, 1));
					} else if ($(".calendar").hasClass("month")) {
						var yearmonth = $("#calendar").attr("data-date").split(
								"-");
						calendarMonth(new Date(parseInt(yearmonth[0]),
								parseInt(yearmonth[1]), 1));
					} else if ($(".calendar").hasClass("week")) {
						var yearmonthday = $("#calendar").attr("data-date")
								.split("-");
						calendarWeek(new Date(parseInt(yearmonthday[0]),
								parseInt(yearmonthday[1]) - 1,
								parseInt(yearmonthday[2]) + 7));
					}
				});

		// 오늘 이동 버튼
		$(".calendar-controls > .calendar-today").on("click", function() {
			if ($(".calendar").hasClass("year")) {
				calendarYear(new Date());
			} else if ($(".calendar").hasClass("month")) {
				calendarMonth(new Date());
			} else if ($(".calendar").hasClass("week")) {
				calendarWeek(new Date());
			}
		});
// 		// 날짜 클릭
// 		var selectedDate = null;
// 		$(document).on("click",".calendar table > tbody > tr > td",
// 						function(event) {
// 							//event.preventDefault();
// 							event.stopPropagation();
// 							var eventTarget = event.target;
// 							while (eventTarget.tagName != "TD") {
// 								eventTarget = eventTarget.parentElement;
// 							}
// 							if ($(eventTarget).attr("data-date") != undefined) {
// 								var date = $(eventTarget).attr("data-date");
// 								selectedDate = date; // 날짜를 저장
// 							console.log(date);
// 							}
// 						});
		
// 		// 선택한 날짜를 반환하는 함수
// 		function getSelectedDate() {
// 		    return selectedDate;
// 		}
		

		// 임시 공휴일 해시맵(HashMap)
		var hashmapTemporaryHoliday = [];
		hashmapTemporaryHoliday["2022-3-9"] = {
			"title" : "20대 대통령 선거일"
		};

		function calendarMonth(date) {
			$(".calendar").removeClass("year");
			$(".calendar").addClass("month");
			// 년월
			$(".calendar-yearmonth").html(
					date.getFullYear() + "년 " + (date.getMonth() + 1) + "월");

			var options = {
				showDay : true,
				showFullDayName : true,
				showToday : true,
				arHoliday : hashmapTemporaryHoliday
			};

			var html = calendarHTML(date, options);
			$("#calendar").attr("data-date",
					date.getFullYear() + "-" + (date.getMonth() + 1));
			$("#calendar").html(html);
		}

		function calendarYear(date) {
			$(".calendar").removeClass("month");
			$(".calendar").addClass("year");
			// 년
			$(".calendar-yearmonth").html(date.getFullYear() + "년");

			var options = {
				showDay : true,
				showToday : true,
				arHoliday : hashmapTemporaryHoliday
			};

			var html = "";
			html += "<table>";
			html += "<tbody>";
			for (var index1 = 0; index1 < 4; index1++) {
				html += "<tr>";
				for (var index2 = 0; index2 < 3; index2++) {
					html += "<td>";
					html += "<div class=\"calendar-month\">"
							+ (index1 * 3 + index2 + 1) + "월</div>";
					html += calendarHTML(new Date(date.getFullYear(),
							(index1 * 3 + index2), 1), options);
					html += "</td>";
				}
				html += "</tr>";
			}
			html += "</tbody>";
			html += "</table>";

			$("#calendar").attr("data-date", date.getFullYear());
			$("#calendar").html(html);
		}

		calendarMonth(new Date());
		$(".calendar-view-month").addClass("active");
	</script>
	
</body>
</html>