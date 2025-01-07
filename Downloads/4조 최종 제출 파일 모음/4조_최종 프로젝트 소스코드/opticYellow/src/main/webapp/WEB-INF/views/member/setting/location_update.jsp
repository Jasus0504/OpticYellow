<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Optic Yellow</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.3/examples/sign-in/">
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

body {
	background-color: #F8F9FA !important;
}

select {
	margin-bottom: 5% !important;
	text-align: center;
}

h1 {
	margin-top: 15% !important;
	text-align: center;
}

#positionCenter {
	transform: translate(0%, 10%);
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 150px;
	margin-top: 30px;
}

.breadcrumb-container .breadcrumb-item a {
	text-decoration: none;
	border-bottom: none;
	color: black;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-top: 30px;
}
</style>
<link href="resources/setting/signin.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	function updateSubRegion() {
		var region = document.getElementById("region").value; // 첫 번째 드롭다운의 선택된 값 가져오기
		var subRegionSelect = document.getElementById("subRegion"); // 두 번째 드롭다운 요소 가져오기

		// subRegion 드롭다운 초기화
		subRegionSelect.innerHTML = "";

		if (region === "세종특별자치시") {
			subRegionSelect.disabled = true; // subRegion 드롭다운 비활성화
		} else {
			subRegionSelect.disabled = false; // subRegion 드롭다운 활성화

			if (region === "서울특별시") {
				var seoulSubRegions = [ "강남구", "강동구", "강북구", "강서구", "관악구",
						"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
						"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구",
						"영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
				for (var i = 0; i < seoulSubRegions.length; i++) {
					var option = document.createElement("option"); // select 태그 안에 option 속성을 생성해서 var option에 저장
					option.value = seoulSubRegions[i]; // value 속성 설정
					option.text = seoulSubRegions[i]; // 텍스트 내용 설정
					subRegionSelect.appendChild(option); // 두 번째 드롭다운에 옵션 추가
				}

			} else if (region === "부산광역시") {
				var busanSubRegions = [ "강서구", "금정구", "남구", "동구", "동래구",
						"부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
						"중구", "해운대구" ];
				for (var i = 0; i < busanSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = busanSubRegions[i];
					option.text = busanSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "대구광역시") {
				var daeguSubRegions = [ "남구", "달서구", "달성군", "동구", "북구", "서구",
						"수성구", "중구" ];
				for (var i = 0; i < daeguSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = daeguSubRegions[i];
					option.text = daeguSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "인천광역시") {
				var incheonSubRegions = [ "강화군", "계양구", "남동구", "동구", "미추홀구",
						"부평구", "서구", "연수구", "옹진군" ];
				for (var i = 0; i < incheonSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = incheonSubRegions[i];
					option.text = incheonSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "광주광역시") {
				var gwangjuSubRegions = [ "광산구", "남구", "동구", "북구", "서구" ];
				for (var i = 0; i < gwangjuSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = gwangjuSubRegions[i];
					option.text = gwangjuSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "대전광역시") {
				var daejeonSubRegions = [ "동구", "서구", "유성구", "중구" ];
				for (var i = 0; i < daejeonSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = daejeonSubRegions[i];
					option.text = daejeonSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "울산광역시") {
				var ulsanSubRegions = [ "남구", "동구", "북구", "울주군", "중구" ];
				for (var i = 0; i < ulsanSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = ulsanSubRegions[i];
					option.text = ulsanSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "경기도") {
				var gyeonggiSubRegions = [ "과천시", "광명시", "광주시", "구리시", "군포시",
						"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시",
						"안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시",
						"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시",
						"하남시", "화성시" ];
				for (var i = 0; i < gyeonggiSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = gyeonggiSubRegions[i];
					option.text = gyeonggiSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "강원도") {
				var gangwonSubRegions = [ "강릉시", "고성군", "동해시", "삼척시", "속초시",
						"양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시",
						"태백시", "평창군", "홍천군", "화천군", "횡성군" ];
				for (var i = 0; i < gangwonSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = gangwonSubRegions[i];
					option.text = gangwonSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "충청북도") {
				var chungcheongbukSubRegions = [ "괴산군", "단양군", "보은군", "영동군",
						"옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시", "충주시" ];
				for (var i = 0; i < chungcheongbukSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = chungcheongbukSubRegions[i];
					option.text = chungcheongbukSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "충청남도") {
				var chungcheongnamSubRegions = [ "계룡시", "공주시", "금산군", "논산시",
						"당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시",
						"청양군", "태안군", "홍성군" ];
				for (var i = 0; i < chungcheongnamSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = chungcheongnamSubRegions[i];
					option.text = chungcheongnamSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "전라북도") {
				var jeollabukSubRegions = [ "고창군", "군산시", "김제시", "남원시", "무주군",
						"부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시",
						"진안군" ];
				for (var i = 0; i < jeollabukSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = jeollabukSubRegions[i];
					option.text = jeollabukSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "전라남도") {
				var jeollanamSubRegions = [ "강진군", "고흥군", "곡성군", "광양시", "구례군",
						"나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시",
						"영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군",
						"화순군" ];
				for (var i = 0; i < jeollanamSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = jeollanamSubRegions[i];
					option.text = jeollanamSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "경상북도") {
				var gyeongsangbukSubRegions = [ "경산시", "경주시", "고령군", "구미시",
						"군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군",
						"영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군",
						"청송군", "칠곡군", "포항시" ];
				for (var i = 0; i < gyeongsangbukSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = gyeongsangbukSubRegions[i];
					option.text = gyeongsangbukSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "경상남도") {
				var gyeongsangnamSubRegions = [ "거제시", "거창군", "고성군", "김해시",
						"남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군",
						"창원시", "통영시", "하동군", "함안군", "함양군", "합천군" ];
				for (var i = 0; i < gyeongsangnamSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = gyeongsangnamSubRegions[i];
					option.text = gyeongsangnamSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "제주특별자치도") {
				var jejuSubRegions = [ "서귀포시", "제주시" ];
				for (var i = 0; i < jejuSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = jejuSubRegions[i];
					option.text = jejuSubRegions[i];
					subRegionSelect.appendChild(option);
				}
			} else if (region === "지역 선택") {
				var areaSubRegions = [ "상세 지역" ];
				for (var i = 0; i < areaSubRegions.length; i++) {
					var option = document.createElement("option");
					option.value = areaSubRegions[i];
					option.text = areaSubRegions[i];
					subRegionSelect.appendChild(option);
				}

			}

		}
		// 선택된 값 저장
		var m_location = region + " " + subRegionSelect.value;
		document.getElementById('m_location').value = m_location;

	} // end updateSubRegion()......

	$(document).ready(function() {
		console.log('ready...');
		var m_id = "${user_id}";
		var selectedRegion = ""; // 이전에 선택된 첫 번째 드롭다운의 값
		var selectedSubRegion = ""; // 이전에 선택된 두 번째 드롭다운의 값

		$.ajax({
			url : "json_mypage_profile.do",
			data : {
				m_id : m_id
			},
			method : 'GET',
			dataType : 'json',
			success : function(vo2) {
				console.log('ajax...success:', vo2);
				$("#span_m_id").text(vo2.m_id);
				$("#m_id").val(vo2.m_id);

				var region = "";
				var subRegion = "";

				if (vo2.m_location !== null && vo2.m_location.trim() !== "") {
					var locationParts = vo2.m_location.split(' ');
					region = locationParts[0];

					if (locationParts.length > 1) {
						subRegion = locationParts.slice(1).join(' ');
					}
				}

				selectedRegion = region; // 이전에 선택된 첫 번째 드롭다운의 값 저장
				selectedSubRegion = subRegion; // 이전에 선택된 두 번째 드롭다운의 값 저장

				$("#region").val(region); // 첫 번째 드롭다운의 선택된 값을 설정
				updateSubRegion(); // 두 번째 드롭다운 업데이트

				// 첫 번째 드롭다운의 값이 변경되었을 때 두 번째 드롭다운 업데이트
				$("#region").change(function() {
					updateSubRegion(); // 두 번째 드롭다운 업데이트
				});

				// 두 번째 드롭다운 값이 변경되었을 때 숨겨진 input 요소에 선택된 값을 할당
				$("#subRegion").change(function() {
					var selectedSubRegion = $(this).val().trim();
					var selectedRegion = $("#region").val().trim();
					var m_location = "";

					if (selectedRegion !== "") {
						m_location = selectedRegion;
						if (selectedSubRegion !== "") {
							m_location += " " + selectedSubRegion;
						}
					}
					document.getElementById("m_location").value = m_location; // m_location 값을 숨겨진 input 요소에 할당

					console.log("m_location:", m_location);
				});
				$("#subRegion").val(subRegion);

			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
		$("#submitBtn").click(function(e) {
			var region = $("#region").val().trim();
			var subRegion = $("#subRegion").val().trim();

			if (region === "" || subRegion === "") {
				e.preventDefault();
				alert("지역을 선택해주세요.");
			} else {
				alert("변경 성공!");
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item"><a href="mypage_setting_OK.do">설정</a></li>
				<li class="breadcrumb-item active" aria-current="page">선호지역 변경</li>
			</ol>
		</nav>
	</div>
	<main class="form-signin w-100 m-auto">

		<form action="mypage_profile_location_updateOK.do" method="POST">
			<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
			<input type="hidden" id="m_location" name="m_location"
				value="${vo2.m_location}">

			<div id="positionCenter">
				<h1 class="h3 mb-3 fw-normal">선호지역 변경</h1>

				<select class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" id="region" name="region"
					onchange="updateSubRegion()">
					<option value="">지역 선택</option>
					<option value="서울특별시">서울특별시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
				</select> <select class="form-select form-select-lg mb-3"
					aria-label=".form-select-lg example" id="subRegion"
					name="subRegion">

					<option value="">상세 지역</option>
				</select> <input type="submit" class="w-100 btn btn-lg btn-primary"
					id="submitBtn" value="변경하기">
			</div>
		</form>
	</main>
	<jsp:include page="../../footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>