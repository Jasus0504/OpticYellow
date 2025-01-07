<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.112.5">
<title>Optic Yellow</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/checkout/">
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

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
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

.btn-bd-primary { -
	-bd-violet-bg: #712cf9; -
	-bd-violet-rgb: 112.520718, 44.062154, 249.437846; -
	-bs-btn-font-weight: 600; -
	-bs-btn-color: var(- -bs-white); -
	-bs-btn-bg: var(- -bd-violet-bg); -
	-bs-btn-border-color: var(- -bd-violet-bg); -
	-bs-btn-hover-color: var(- -bs-white); -
	-bs-btn-hover-bg: #6528e0; -
	-bs-btn-hover-border-color: #6528e0; -
	-bs-btn-focus-shadow-rgb: var(- -bd-violet-rgb); -
	-bs-btn-active-color: var(- -bs-btn-hover-color); -
	-bs-btn-active-bg: #5a23c8; -
	-bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}

h4 {
	margin-top: 10% !important;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "json_courtSelectOne.do",
			data : {
				court_id : '${param.court_id}'
			},
			method : 'GET',
			dataType : 'json',
			success : function(vo2) {
				console.log('ajax...success:', vo2);
				$('#span_cname').text(vo2.court_name);
				setEvents(vo2.c_price);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		}); // end ajax

		function setEvents(c_price) {
			$(".datetimepicker").datetimepicker({
				format : "Y-m-d H:i",
				onChangeDateTime : function() {
					calculateTotalFee();
					getDate();
				}
			});

			function calculateTotalFee() {
				var start_hour = extractHour($("#start_time").val());
				var end_hour = extractHour($("#end_time").val());
				if (start_hour !== null && end_hour !== null) {
					var total_fee = c_price * (end_hour - start_hour);
					$('#span_fee').text(total_fee);
					$('#total_fee').val(total_fee);
				} else {
					$('#span_fee').text('');
					$('#total_fee').val('');
				}
			}
		}
	});

	function extractHour(datetimeString) {
		var hour = null;
		if (datetimeString) {
			var time = datetimeString.split(" ")[1];
			hour = parseInt(time.split(":")[0], 10);
		}
		return hour;
	}

	function extractDate(datetimeString) {
		var date = null;
		if (datetimeString) {
			date = datetimeString.split(" ")[0];
		}
		return date;
	}

	function getDate() {
		var start_date = extractDate($("#start_time").val());
		var end_date = extractDate($("#end_time").val());
		return {
			start_date : start_date,
			end_date : end_date
		};
	}

	function reserveCheck() {
		console.log('reserveCheck()....');

		var dates = getDate();
		var start_date = dates.start_date;
		var end_date = dates.end_date;

		var start_hour = extractHour($("#start_time").val());
		var end_hour = extractHour($("#end_time").val());
		let msg = '';
		let isAvailable = false;

		$.ajax({
					url : "json_reserveCheck.do",
					data : {
						court_id : $("#court_id").val(),
						start_date : start_date,
						end_date : end_date
					},
					method : 'GET',
					dataType : 'json',
					success : function(vos) {
						console.log(vos);
						
						if(vos.length == 0) {
							var open_hour = ${param.open_time};
							var close_hour = ${param.close_time};

							if((start_hour < open_hour)	|| (end_hour > close_hour)) {
							msg = '예약불가';
							isAvailable = false;
							} else {
							msg = '예약가능';
							isAvailable = true;
							}
						} else {
							$.each(vos,function(index, vo) {
								var r_start_hour = extractHour(vo.start_time);
								var r_end_hour = extractHour(vo.end_time);
								var open_hour = ${param.open_time};
								var close_hour = ${param.close_time};

								console.log(start_hour, end_hour, r_start_hour, r_end_hour, open_hour, close_hour);

								console.log((end_hour > r_start_hour) && (start_hour < r_start_hour));
								console.log((start_hour < r_end_hour) && (end_hour > r_end_hour));
								console.log((start_hour < r_start_hour) && (end_hour > r_end_hour));
								console.log((start_hour > r_start_hour) && (end_hour < r_end_hour));
								console.log((start_hour == r_start_hour) && (end_hour < r_end_hour));
								console.log((start_hour > r_start_hour) && (end_hour == r_end_hour));
								console.log((start_hour == r_start_hour) && (end_hour == r_end_hour));
								console.log((start_hour < open_hour));
								console.log((end_hour > close_hour));
								if (((end_hour > r_start_hour) && (start_hour < r_start_hour))
									|| ((start_hour < r_end_hour) && (end_hour > r_end_hour))
									|| ((start_hour < r_start_hour) && (end_hour > r_end_hour))
									|| ((start_hour > r_start_hour) && (end_hour < r_end_hour))
									|| ((start_hour == r_start_hour) && (end_hour < r_end_hour))
									|| ((start_hour > r_start_hour) && (end_hour == r_end_hour))
									|| ((start_hour == r_start_hour) && (end_hour == r_end_hour))
									|| (start_hour < open_hour)	|| (end_hour > close_hour)) {
										msg = '예약불가'
										isAvailable = false;
					                    return false;
										} else {
										msg = '예약가능'
										isAvailable = true;
										}
							});
						}
						
						$("#demo").html(msg);
						if (isAvailable) {
					        $('button[type="submit"]').prop('disabled', false);
					    } else {
					        $('button[type="submit"]').prop('disabled', true);
					    }
					},
					error : function(xhr, status, error) {
						console.log('xhr.status:', xhr.status);
					}
				});
	}

	function kakaoPayReady() {
		var total_fee = document.getElementById("total_fee").value;
		var span_cname = $("#span_cname").text();

		$.ajax({
			url : "rest_courtfee_kakaoPayReady.do",
			data : {
				total_amount : total_fee,
				item_name : span_cname
			},
			method : "POST",
			dataType : "json",
			success : function(data) {
				// 전달받은 data의 결제준비 요청 페이지 링크로 새창 열기
				window.open(data.next_redirect_pc_url);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		}) // end ajax

		// 결제와 동시에 court_reserveOK.do로 데이터 전송
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "court_reserveOK.do");

		var input1 = document.createElement("input");
		input1.setAttribute("type", "hidden");
		input1.setAttribute("name", "user_id");
		input1.setAttribute("value", "${user_id}");
		form.appendChild(input1);

		var input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.setAttribute("name", "court_id");
		input2.setAttribute("value", "${param.court_id}");
		form.appendChild(input2);

		var input3 = document.createElement("input");
		input3.setAttribute("type", "text");
		input3.setAttribute("name", "start_time");
		input3.setAttribute("value", $("#start_time").val());
		form.appendChild(input3);

		var input4 = document.createElement("input");
		input4.setAttribute("type", "text");
		input4.setAttribute("name", "end_time");
		input4.setAttribute("value", $("#end_time").val());
		form.appendChild(input4);

		var input5 = document.createElement("input");
		input5.setAttribute("type", "hidden");
		input5.setAttribute("name", "total_fee");
		input5.setAttribute("value", $("#total_fee").val());
		form.appendChild(input5);

		// 딜레이를 주기 위해 setTimeout 사용
		setTimeout(function() {
			document.body.appendChild(form);
			form.submit();
		}, 1000);
	} // end kakaoPayReady()
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<!-- 	<table> -->
	<!-- 		<tr> -->
	<!-- 			<td><label for="user">예약자 ID:</label></td> -->
	<!-- 			<td><input type="hidden" id="user_id" name="user_id" -->
	<%-- 				value="${user_id}">${user_id}</td> --%>
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td><label for="court">선택한 코트:</label></td> -->
	<!-- 			<td><span id="span_cname"></span><input type="hidden" -->
	<%-- 				id="court_id" name="court_id" value="${param.court_id}"></td> --%>
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td> -->
	<!-- 				<link rel="stylesheet" type="text/css" media="screen" -->
	<!-- 					href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"> -->
	<!-- 				<script -->
	<!-- 					src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script> -->
	<!-- 				시작일시 : <input type='text' class='datetimepicker' name='start_time' -->
	<!-- 				id='start_time' style='width: 140px;'> -->
	<!-- 			</td> -->
	<!-- 			<td>종료일시 : <input type='text' class='datetimepicker' -->
	<!-- 				name='end_time' id='end_time' -->
	<!-- 				style='width: 140px; padding-left: 10px;'> -->
	<!-- 			</td> -->
	<!-- 			<td><button type="button" onclick="reserveCheck()">코트 -->
	<!-- 					중복 체크</button> <span id="demo"></span></td> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td><label for="total_fee">총 요금:</label></td> -->
	<!-- 			<td><span id="span_fee"></span><input type="hidden" -->
	<!-- 				id="total_fee" name="total_fee" value=""></td> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<!-- 			<td colspan="2"><button type="submit" onclick="kakaoPayReady()">결제</button></td> -->
	<!-- 		</tr> -->
	<!-- 	</table> -->

	<div class="container">
		<main>

			<div class="col-12 d-flex justify-content-center align-items-center">
				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3" style="text-align: center;">코트 예약</h4>
						<div class="row g-3">
							<div class="col-sm-4" style="text-align: center;">
								<label for="user" class="form-label">예약자</label><br>
							</div>
							<div class="col-sm-8">
								<input type="hidden" class="form-control" id="user_id"
									name="user_id" placeholder="" value="${user_id}"
									style="text-align: center;" readonly>${user_id}
							</div>

							<div class="col-sm-4" style="text-align: center;">
								<label for="court" class="form-label">선택한 코트</label><br>
							</div>
							<div class="col-sm-8">
								<span id="span_cname"></span> 
								<input type="hidden"
									class="form-control" id="court_id" name="court_id"
									placeholder="" value="${param.court_id}"
									style="text-align: center;" readonly>
							</div>
							<div class="col-sm-4" style="text-align: center;">
								<link rel="stylesheet" type="text/css" media="screen"
									href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
								<script
									src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
								<label for="start" class="form-label">시작 일시</label><br>
							</div>
							<div class="col-sm-5">
								<input type="text" class="form-control datetimepicker"
									id="start_time" name="start_time" placeholder="" value=""
									style="text-align: center;">
							</div>

							<div class="col-sm-4" style="text-align: center;">
								<label for="end" class="form-label">종료 일시</label><br>
							</div>
							<div class="col-sm-5">
								<input type="text" class="form-control datetimepicker" id="end_time"
									name="end_time" placeholder="" value=""
									style="text-align: center;">
							</div>
							<div class="col-sm-3">
								<button type="button" class="btn btn-primary"
									onclick="reserveCheck()" style="font-size: 15px">예약 중복
									체크</button>
									<span id="demo"></span>
							</div>
							<div class="col-sm-4" style="text-align: center;">
								<label for="total_fee" class="form-label">총 요금</label><br>
							</div>
							<div class="col-sm-8">
								<span id="span_fee"></span> 
								<input type="hidden" class="form-control"
									id="total_fee" name="total_fee" placeholder="" value=""
									style="text-align: center;" readonly>
							</div>

						</div>
						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg"
							onclick="kakaoPayReady()" type="submit" disabled>결제하기</button>
				</div>
			</div>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>

