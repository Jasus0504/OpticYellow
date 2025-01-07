<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/checkout/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".datetimepicker").datetimepicker({
			format : "Y-m-d H:i",
		});
	});
</script>

<script>
function validateForm() {
	  const inputs = document.querySelectorAll('input[required], select[required], textarea[required]');
	  let isValid = true;

	  inputs.forEach((input) => {
	    if (input.value.trim() === '') {
	      input.classList.add('is-invalid');
	      isValid = false;
	    } else {
	      input.classList.remove('is-invalid');
	    }
	  });

	  // Additional validation for start date and end date
	  const startDateInput = document.getElementById('g_start_dt');
	  const endDateInput = document.getElementById('g_end_dt');

	  if (startDateInput.value.trim() === '') {
	    startDateInput.classList.add('is-invalid');
	    isValid = false;
	  } else {
	    startDateInput.classList.remove('is-invalid');
	  }

	  if (endDateInput.value.trim() === '') {
	    endDateInput.classList.add('is-invalid');
	    isValid = false;
	  } else {
	    endDateInput.classList.remove('is-invalid');
	  }

	  return isValid;
	}

</script>
<style>

/* Popup window style */
.popup {
	display: none;
	position: absolute;
	width: 100%;
	max-height: 200px;
	overflow-y: auto;
	background-color: #fff;
	border: 1px solid #ccc;
	z-index: 999;
	padding: 10px;
	top: 100%;
}

.popup a {
	display: block;
	padding: 5px;
	color: #000;
	text-decoration: none;
}

.popup a:hover {
	background-color: #f0f0f0;
}

.popup .address {
	font-size: 12px;
	color: #777;
}

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

/* Increase height of g_info field */
#g_info {
	resize: vertical;
}

/* Increase font size for labels */
.form-label {
	font-size: 1.2rem; . invalid-feedback { color : red;
	display: none;
	margin-top: 5px;
	font-size: 0.875rem;
}

.invalid-feedback {
	color: red;
	display: none;
	margin-top: 5px;
	font-size: 0.875rem;
}

.invalid-feedback.show {
	display: block;
}
</style>
<!-- <script> -->
<!-- // 	function selectFacility(facName) { -->
<!-- // 		document.getElementById('fac_name').value = facName; -->
<!-- // 		document.getElementById('fac_id').value = facId; -->
<!-- // 		document.getElementById('popup').style.display = 'none'; -->

<!-- // 	} -->

<!-- // 	function openPopup() { -->
<!-- // 		var popup = document.getElementById('popup'); -->
<!-- // 		if (popup.style.display === 'block') { -->
<!-- // 			popup.style.display = 'none'; -->
<!-- // 		} else { -->
<!-- // 			popup.style.display = 'block'; -->
<!-- // 		} -->
<!-- // 	} -->
<!-- </script> -->
<meta charset="UTF-8">
<title>update</title>
</head>
<body class="bg-body-tertiary">
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
			d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
			d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
			d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
			d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
			d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
      </symbol>
    </svg>

	<div
		class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
		<button
			class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
			id="bd-theme" type="button" aria-expanded="false"
			data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
			<svg class="bi my-1 theme-icon-active" width="1em" height="1em">
				<use href="#circle-half"></use></svg>
			<span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
		</button>
		<ul class="dropdown-menu dropdown-menu-end shadow"
			aria-labelledby="bd-theme-text">
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="light" aria-pressed="false">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#sun-fill"></use></svg>
					Light
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="dark" aria-pressed="false">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#moon-stars-fill"></use></svg>
					Dark
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center active"
					data-bs-theme-value="auto" aria-pressed="true">
					<svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
						<use href="#circle-half"></use></svg>
					Auto
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
		</ul>
	</div>

	<div class="container">
		<main>
			<div class="py-5 text-center">
				<a href="home.do"><img src="resources/images/logo.png" alt="이미지"></a>
				<p class="lead">매치 수정 내용을 입력해주세요</p>
			</div>

			<div class="row justify-content-center">

				<div class="col-md-9 col-lg-10 centered-form">
					<!-- 					<h4 class="mb-3">매치 등록</h4> -->
					<form action="g_updateOK.do" method="post"
						enctype="multipart/form-data" class="needs-validation" novalidate
						onsubmit="return validateForm()">

						<div class="row g-3">
							<div class="col-md-12">
								<input type="hidden" id="g_num" name="g_num"
									value="${vo2.g_num}"> <label for="g_name"
									class="form-label">제목</label> <input type="text" id="g_name"
									class="form-control" name="g_name" value="${vo2.g_name}"
									required>
								<div class="invalid-feedback">제목을 입력하세요</div>
							</div>

							<div class="col-md-12">

								<label for="fac_name" class="form-label">테니스장</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control" id="fac_name"
										name="fac_name" placeholder="${vo2.fac_name}"
										onkeyup="filterFunction()" onclick="openPopup()">
									<div id="popup" class="popup">
										<%
										try {
											Class.forName("oracle.jdbc.OracleDriver");
											Connection con = DriverManager.getConnection("jdbc:oracle:thin:@database-1.cmz58cmdxttl.ap-northeast-2.rds.amazonaws.com:1521:ORACLE", "admin", "hi123456");
											Statement stmt = con.createStatement();
											ResultSet rs = stmt.executeQuery("SELECT fac_name, fac_id, address FROM facility");

											boolean facilityFound = false; // 시설이 있는지 여부를 나타내는 변수

											while (rs.next()) {

												String facName = rs.getString(1);
												String facId = rs.getString(2);
												String facAddress = rs.getString(3);

												if (facName.equals(request.getParameter("fac_name"))) {
											facilityFound = true;
												}
										%>
										<a href="#"
											onclick="selectFacility('<%=facName%>','<%=facId%>', '<%=facAddress%>')">
											<%=facName%> <br /> <span class="address"><%=facAddress%></span>
										</a>

										<%
										}
										con.close();
										// 시설이 없는 경우 처리
										if (!facilityFound) {
										String facName = request.getParameter("fac_name");
										%>
										<a href="#" onclick="selectFacility('<%=facName%>','')"> <%=facName%>
											<br /> <span class="address">시설이 없습니다.</span>
										</a>
										<%
										}
										} catch (Exception e) {
										out.print("Error: " + e.getMessage());
										}
										%>
									</div>
								</div>

								<input type="hidden" id="g_address" name="g_address"> <input
									type="hidden" id="fac_id" name="fac_id">
							</div>

							<div class="col-md-10">
								<label for="c_id" class="form-label">코트이름</label> <input
									type="text" class="form-control" name="c_id" id="c_id"
									value="${vo2.c_id}" required>
								<div class="invalid-feedback">코트 이름을 입력하세요</div>
							</div>



							<div class="col-5">
								<label for="ntrp" class="form-label">실력</label>
								<div class="input-group has-validation">
									<select class="form-select" id="g_ntrp" name="g_ntrp" required>
										<option value="1.0" ${vo2.g_ntrp == 1.0 ? 'selected' : ''}>NTRP
											1.0</option>
										<option value="1.5" ${vo2.g_ntrp == 1.5 ? 'selected' : ''}>NTRP
											1.5</option>
										<option value="2.0" ${vo2.g_ntrp == 2.0 ? 'selected' : ''}>NTRP
											2.0</option>
										<option value="2.5" ${vo2.g_ntrp == 2.5 ? 'selected' : ''}>NTRP
											2.5</option>
										<option value="3.0" ${vo2.g_ntrp == 3.0 ? 'selected' : ''}>NTRP
											3.0</option>
										<option value="3.5" ${vo2.g_ntrp == 3.5 ? 'selected' : ''}>NTRP
											3.5</option>
										<option value="4.0" ${vo2.g_ntrp == 4.0 ? 'selected' : ''}>NTRP
											4.0</option>
										<option value="4.5" ${vo2.g_ntrp == 4.5 ? 'selected' : ''}>NTRP
											4.5</option>
										<option value="5.0" ${vo2.g_ntrp == 5.0 ? 'selected' : ''}>NTRP
											5.0</option>
										<option value="5.5" ${vo2.g_ntrp == 5.5 ? 'selected' : ''}>NTRP
											5.5</option>
										<option value="6.0" ${vo2.g_ntrp == 6.0 ? 'selected' : ''}>NTRP
											6.0</option>
										<option value="6.5" ${vo2.g_ntrp == 6.5 ? 'selected' : ''}>NTRP
											6.5</option>
										<option value="7.0" ${vo2.g_ntrp == 7.0 ? 'selected' : ''}>NTRP
											7.0</option>
									</select>
									<div class="invalid-feedback">Please select the number of
										guests.</div>
								</div>
							</div>

							<div class="col-7">
								<label for="g_method" class="form-label">경기방식</label>
								<div class="input-group has-validation">
									<select class="form-select" id="g_method" name="g_method"
										required>
										<option value="혼합복식"
											${vo2.g_method == '혼합복식' ? 'selected' : ''}>혼합복식</option>
										<option value="남자복식"
											${vo2.g_method == '남자복식' ? 'selected' : ''}>남자복식</option>
										<option value="남자단식"
											${vo2.g_method == '남자단식' ? 'selected' : ''}>남자단식</option>
										<option value="여자복식"
											${vo2.g_method == '여자복식' ? 'selected' : ''}>여자복식</option>
										<option value="여자단식"
											${vo2.g_method == '여자단식' ? 'selected' : ''}>여자단식</option>

									</select>
									<div class="invalid-feedback">경기방식을 입력하세요</div>
								</div>
							</div>

							<div class="col-6">
								<label for="g_start_dt" class="form-label">시작일시 </label>
								<div class="input-group has-validation">
									<input type='text' class="form-control datetimepicker"
										name='g_start_dt' id='g_start_dt' value="${vo2.g_start_dt}"
										style='width: 140px;' required>
									<div class="invalid-feedback">시작일시을 입력하세요</div>
								</div>
							</div>
							<div class="col-6">
								<label for="g_end_dt" class="form-label">종료일시 </label>
								<div class="input-group has-validation">
									<input type='text' class="form-control datetimepicker"
										name='g_end_dt' id='g_end_dt' value="${vo2.g_end_dt}"
										style='width: 140px; padding-left: 10px;' required>
									<div class="invalid-feedback">종료일시을 입력하세요</div>
								</div>
							</div>

							<div class="col-md-7">
								<label for="g_bill" class="form-label">회비</label> <input
									type="number" id="g_bill" value="${vo2.g_bill}"
									class="form-control" name="g_bill" required>
								<div class="invalid-feedback">회비를 입력하세요</div>
							</div>

							<div class="col-5">
								<label for="g_amount" class="form-label">인원</label>
								<div class="input-group has-validation">
									<select name="g_amount" class="form-select" id="g_amount"
										value="1" required>
										<option value="1" ${vo2.g_amount == 1 ? 'selected':''}>1</option>
										<option value="2" ${vo2.g_amount == 2 ? 'selected':''}>2</option>
										<option value="3" ${vo2.g_amount == 3 ? 'selected':''}>3</option>
										<option value="4" ${vo2.g_amount == 4 ? 'selected':''}>4</option>
										<option value="5" ${vo2.g_amount == 5 ? 'selected':''}>5</option>
									</select>
									<div class="invalid-feedback">인원을 입력하세요</div>
								</div>
							</div>

							<div class="col-12">
								<label for="g_info" class="form-label">기타 상세내용</label>
								<textarea class="form-control" name="g_info" id="g_info"
									rows="6" placeholder="${vo2.g_info}"></textarea>
								<!--   <div class="invalid-feedback">기타 상세내용을 입력하세요</div> -->
							</div>

						</div>






						<div class="col-sm-6">
							<label for="g_creater" class="form-label"></label> <input
								type="hidden" id="g_creater" name="g_creater" value="${user_id}">
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>



						<hr class="my-4">



						<input type="submit" class="w-100 btn btn-primary btn-lg"
							value="수정완료">
					</form>
				</div>
			</div>
		</main>

	
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script>
	//facName으로 fac_id, address 얻어오기
function selectFacility(facName, facId, facAddress) {
  document.getElementById('fac_name').value = facName;
  document.getElementById('fac_id').value = facId;
  document.getElementById('g_address').value = facAddress;
  document.getElementById('popup').style.display = 'none';
}

	//시설 검색창 누르면 시설목록 보여주기 
	function openPopup() {
		var popup = document.getElementById('popup');
		if (popup.style.display === 'block') {
			popup.style.display = 'none';
		} else {
			popup.style.display = 'block';
		}
	}
	//지역에서 두번째 필터
	function filterFunction() {
		var input, filter, div, a, i;
		input = document.getElementById("fac_name");
		filter = input.value.toUpperCase();
		div = document.getElementById("popup");
		a = div.getElementsByTagName("a");
		for (i = 0; i < a.length; i++) {
			var txtValue = a[i].textContent || a[i].innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
			} else {
				a[i].style.display = "none";
			}
		}
	}
	//테니스장 검색 할 때 포함된 단어 목록만 보여주기
	function fetchFacilities(str) {
		if (str.length === 0) {
			document.getElementById("popup").innerHTML = "";
			return;
		}

		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (this.readyState === 4 && this.status === 200) {
				document.getElementById("popup").innerHTML = this.responseText;
			}
		};
		xmlhttp.open("GET", "facilitySearch.jsp?q=" + str, true);
		xmlhttp.send();
	}
</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>