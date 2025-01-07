<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.112.5">
<title>OPTIC YELLOW</title>
<link rel="stylesheet" href="resources/mypage/list-groups.css">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/list-groups/">

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
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	function update() {
		// 수정 버튼 클릭 > 수정 버튼 비활성화 > 수정완료 버튼 활성화
		var ntrp = document.getElementById('ntrp');
		var ntrpVal = document.getElementById('ntrpVal');
		var updateBtn = document.getElementById('updateBtn');
		var submitBtn = document.getElementById('submitBtn');

		// select 태그 생성
		var select = document.createElement('select');
		select.id = "sel_ntrp";
		select.className = "form-select w-75";

		// option 태그 추가
		var options = [ "NTRP 1.0", "NTRP 1.5", "NTRP 2.0", "NTRP 2.5",
				"NTRP 3.0", "NTRP 3.5", "NTRP 4.0", "NTRP 4.5", "NTRP 5.0",
				"NTRP 5.5", "NTRP 6.0", "NTRP 6.5", "NTRP 7.0" ];
		for (var i = 0.5, j = 0; i < 7; i += 0.5, j++) {
			var option = document.createElement('option');
			option.value = i + 0.5;
			option.text = options[j];

			// 기선택 항목으로 selected
			if (option.text === ntrpVal.textContent) {
				option.selected = true;
			}

			select.appendChild(option);
		}

		var wrap = document.getElementById('wrap');
		wrap.classList.add('d-flex');
		wrap.classList.add('justify-content-between');
		// appendChild = 뒤에 추가, prepend = 앞에 추가
		wrap.prepend(select);
		ntrpVal.style.display = "none";
		// 		ntrp.style.display = "none";
		updateBtn.style.display = "none";
		submitBtn.style.display = "inline-block";

	}

	function submit() {
		var m_ntrp = document.getElementById('sel_ntrp');

		$.ajax({
			url : "json_ntrp_update.do",
			data : {
				m_ntrp : m_ntrp.value
			},
			method : "POST",
			dataType : "json",
			success : function(data) {
				if (data.result == 'OK') {
					alert('NTRP 등급이 수정되었습니다.');

					location.reload(true);
				}
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}

		}) // end ajax

	}// end submit()......

	
</script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<div
		class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-start justify-content-center container">
		<div class="list-group list-group-checkable d-grid gap-2 border-0">

			<div class="text-align-center"> <img src="resources/uploadimg/${vo2.m_img}"
					style="width: 80px; border-radius: 50%; height: 80px;">
			</div>
			<div class="text-align-center mb-2">
				<span class="fs-5"><strong>${user_id}</strong></span>
			</div>

			<input class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios13"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios13"
				onclick="location.href='profile.do?m_id=${user_id}'"> 프로필 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios14"
				value="">
			<div id="wrap">
				<label id="updateBtn" class="list-group-item rounded-3 py-3"
					for="listGroupCheckableRadios14" onclick="update()"> <span
					id="ntrpVal">NTRP ${vo2.m_ntrp}</span>
				</label> <span><button id="submitBtn" class="btn btn-primary"
						onclick="submit()" style="display: none;">수정완료</button></span>
			</div>
		</div>

		<div class="list-group list-group-checkable d-grid gap-2 border-0">

			<input class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios2"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios2"
				onclick="location.href='game_list.do?g_joiner=${user_id }'">
				신청 내역 </label> <input class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios3"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios3"
				onclick="location.href='auction_buy_list.do?buyer=${user_id}'">
				거래 내역 </label> <input class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios4"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios4"
				onclick="location.href='friend_list.do'"> 친구 내역 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios6"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios6"
				onclick="location.href='friend_game_list.do'"> 친구가 신청한 매치 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios7"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios7"
				onclick="location.href='mypage_profile.do?m_id=${user_id}'">
				프로필 수정 </label> <input class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios8"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios8"
				onclick="location.href='mypage_setting.do'"> 설정 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios9"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios9"
				onclick="location.href='q_selectAll.do'"> FAQ </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios10"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios10"
				onclick="location.href='n_selectAll.do'"> 공지사항 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios11"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios11"
				onclick="location.href='qna_selectAll.do'"> 1:1 문의 </label> <input
				class="list-group-item-check pe-none" type="radio"
				name="listGroupCheckableRadios" id="listGroupCheckableRadios12"
				value=""> <label class="list-group-item rounded-3 py-3"
				for="listGroupCheckableRadios12"
				onclick="location.href='fac_registration.do'"> 코트 등록 </label>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

</body>
</html>