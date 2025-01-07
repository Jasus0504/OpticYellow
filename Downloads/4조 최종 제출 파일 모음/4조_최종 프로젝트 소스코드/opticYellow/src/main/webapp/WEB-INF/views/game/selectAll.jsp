<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<%-- <jsp:include page="../css.jsp"></jsp:include> --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>selectAll</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
	rel="stylesheet">

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
<body>


	<jsp:include page="../top_menu.jsp"></jsp:include>
	<jsp:include page="../calendar/calendar.jsp"></jsp:include>

	<div class="container">
		<form id="searchForm" action="/opticyellow/g_searchRestList.do"
			method="GET">
			<div class="dropdown-container">
				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false"
						id="regionButton">지역</button>
					<ul class="dropdown-menu" id="region">
						<!-- 지역들은 JavaScript를 통해 추가됩니다 -->
						<li><button class="dropdown-item" type="button" value="전체"
								onclick="updateSubRegion(this.value)">모든 지역</button></li>
						<li><button class="dropdown-item" type="button" value="서울"
								onclick="updateSubRegion(this.value)">서울</button></li>
						<li><button class="dropdown-item" type="button" value="경기"
								onclick="updateSubRegion(this.value)">경기</button></li>
						<li><button class="dropdown-item" type="button" value="인천"
								onclick="updateSubRegion(this.value)">인천</button></li>
						<li><button class="dropdown-item" type="button" value="강원"
								onclick="updateSubRegion(this.value)">강원</button></li>
						<li><button class="dropdown-item" type="button" value="대전"
								onclick="updateSubRegion(this.value)">대전</button></li>
						<li><button class="dropdown-item" type="button" value="충남/세종"
								onclick="updateSubRegion(this.value)">충남/세종</button></li>
						<li><button class="dropdown-item" type="button" value="충북"
								onclick="updateSubRegion(this.value)">충북</button></li>
						<li><button class="dropdown-item" type="button" value="대구"
								onclick="updateSubRegion(this.value)">대구</button></li>
						<li><button class="dropdown-item" type="button" value="경북"
								onclick="updateSubRegion(this.value)">경북</button></li>
						<li><button class="dropdown-item" type="button" value="부산"
								onclick="updateSubRegion(this.value)">부산</button></li>
						<li><button class="dropdown-item" type="button" value="울산"
								onclick="updateSubRegion(this.value)">울산</button></li>
						<li><button class="dropdown-item" type="button" value="경남"
								onclick="updateSubRegion(this.value)">경남</button></li>
						<li><button class="dropdown-item" type="button" value="광주"
								onclick="updateSubRegion(this.value)">광주</button></li>
						<li><button class="dropdown-item" type="button" value="전남"
								onclick="updateSubRegion(this.value)">전남</button></li>
						<li><button class="dropdown-item" type="button" value="전북"
								onclick="updateSubRegion(this.value)">전북</button></li>
						<li><button class="dropdown-item" type="button" value="제주"
								onclick="updateSubRegion(this.value)">제주</button></li>
					</ul>
				</div>
				<!-- 		</div> -->

				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false"
						id="subRegionButton">상세 지역</button>
					<ul class="dropdown-menu" id="subRegion">
						<!-- 상세 지역들은 JavaScript를 통해 추가됩니다 -->
					</ul>
				</div>
				<!-- 		</div> -->



				<script>
					function updateSubRegion(region) {
						var subRegionSelect = document
								.getElementById("subRegion"); // 두 번째 드롭다운 요소 가져오기

						// subRegion 드롭다운 초기화
						subRegionSelect.innerHTML = "";

						if (region === "전체") {
							subRegionSelect.disabled = true; // subRegion 드롭다운 비활성화
						} else {
							subRegionSelect.disabled = false; // subRegion 드롭다운 활성화

							if (region === "서울") {
								var seoulSubRegions = [ "강남구", "강동구", "강북구",
										"강서구", "관악구", "광진구", "구로구", "금천구",
										"노원구", "도봉구", "동대문구", "동작구", "마포구",
										"서대문구", "서초구", "성동구", "성북구", "송파구",
										"양천구", "영등포구", "용산구", "은평구", "종로구",
										"중구", "중랑구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "부산") {
								var seoulSubRegions = [ "강서구", "금정구", "남구",
										"동구", "동래구", "부산진구", "북구", "사상구",
										"사하구", "서구", "수영구", "연제구", "영도구", "중구",
										"해운대구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "대구") {
								var seoulSubRegions = [ "남구", "달서구", "달성군",
										"동구", "북구", "서구", "수성구", "중구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "인천") {
								var seoulSubRegions = [ "강화군", "계양구", "남동구",
										"동구", "미추홀구", "부평구", "서구", "연수구", "옹진군" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "광주") {
								var seoulSubRegions = [ "광산구", "남구", "동구",
										"북구", "서구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "대전") {
								var seoulSubRegions = [ "동구", "서구", "유성구", "중구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "울산") {
								var seoulSubRegions = [ "남구", "동구", "북구",
										"울주군", "중구" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "경기") {
								var seoulSubRegions = [ "과천시", "광명시", "광주시",
										"구리시", "군포시", "김포시", "남양주시", "동두천시",
										"부천시", "성남시", "수원시", "시흥시", "안산시",
										"안성시", "안양시", "양주시", "양평군", "여주시",
										"연천군", "오산시", "용인시", "의왕시", "의정부시",
										"이천시", "파주시", "평택시", "포천시", "하남시",
										"화성시" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "강원") {
								var seoulSubRegions = [ "강릉시", "고성군", "동해시",
										"삼척시", "속초시", "양구군", "양양군", "영월군",
										"원주시", "인제군", "정선군", "철원군", "춘천시",
										"태백시", "평창군", "홍천군", "화천군", "횡성군" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "충북") {
								var seoulSubRegions = [ "괴산군", "단양군", "보은군",
										"영동군", "옥천군", "음성군", "제천시", "증평군",
										"진천군", "청원군", "청주시", "충주시" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "충남/세종") {
								var seoulSubRegions = [ "강화군", "계양구", "남동구",
										"동구", "미추홀구", "부평구", "서구", "연수구", "옹진군" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
							if (region === "인천") {
								var seoulSubRegions = [ "강화군", "계양구", "남동구",
										"동구", "미추홀구", "부평구", "서구", "연수구", "옹진군" ];
								for (var i = 0; i < seoulSubRegions.length; i++) {
									var li = document.createElement("li"); // li 태그 생성
									var button = document
											.createElement("button"); // button 태그 생성
									button.className = "dropdown-item"; // class 속성 설정
									button.type = "button"; // type 속성 설정
									button.value = seoulSubRegions[i]; // value 속성 설정
									button.textContent = seoulSubRegions[i]; // 텍스트 내용 설정
									button.onclick = function() { // 클릭 이벤트 리스너 추가
										document
												.getElementById("subRegionButton").textContent = this.textContent;
									};
									li.appendChild(button); // li 태그 안에 button 태그 추가
									subRegionSelect.appendChild(li); // 두 번째 드롭다운에 li 태그 추가
								}
							}
						}
					}
				</script>

				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">레벨(ntrp)</button>
					<ul class="dropdown-menu" id="ntrp">
						<li><button class="dropdown-item" type="button" value="1.0">1이상</button></li>
						<li><button class="dropdown-item" type="button" value="2.0">2이상</button></li>
						<li><button class="dropdown-item" type="button" value="3.0">3이상</button></li>
						<li><button class="dropdown-item" type="button" value="4.0">4이상</button></li>
						<li><button class="dropdown-item" type="button" value="5.0">5이상</button></li>
						<li><button class="dropdown-item" type="button" value="6.0">6이상</button></li>
					</ul>
				</div>
				<!-- 		</div> -->

				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown"
						aria-expanded="false">성별</button>
					<ul class="dropdown-menu" id="gender">
						<li><button class="dropdown-item" type="button" value="무관">무관</button></li>
						<li><button class="dropdown-item" type="button" value="여성">여성</button></li>
						<li><button class="dropdown-item" type="button" value="남성">남성</button></li>
					</ul>
				</div>
				<!-- 		</div> -->

				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown"
						aria-expanded="false">마감여부</button>
					<ul class="dropdown-menu" id="open">
						<li><button class="dropdown-item" type="button" value="전체">전체</button></li>
						<li><button class="dropdown-item" type="button" value="Y">모집중</button></li>
						<li><button class="dropdown-item" type="button" value="N">마감</button></li>
					</ul>
				</div>
				<!-- 		</div> -->
				<!-- 		<div class="col"> -->
				<button class="btn btn-primary" type="button" onclick="submitForm()">검색</button>

				<!-- 		</div> -->
			</div>
		</form>
	</div>




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






	<script>
		function submitForm() {
			var form = document.createElement("form");
			form.action = "/opticyellow/g_searchRestList.do"; // 컨트롤러 URL로 변경
			form.method = "GET";

			// 선택된 값들을 폼 필드로 추가
			var regionButton = document.getElementById("regionButton");
			var subRegionButton = document.getElementById("subRegionButton");
			var dropdownMenuButton1 = document
					.getElementById("dropdownMenuButton1");
			var dropdownMenuButton2 = document
					.getElementById("dropdownMenuButton2");
			var dropdownMenuButton3 = document
					.getElementById("dropdownMenuButton3");

			var regionInput = document.createElement("input");
			regionInput.type = "hidden";
			regionInput.name = "region";
			if (regionButton.textContent === "지역") {
				regionInput.value = "전체";
			} else if (regionButton.textContent === "모든 지역") {
				regionInput.value = "전체";
			} else {
				regionInput.value = regionButton.textContent;
			}
			form.appendChild(regionInput);

			var subRegionInput = document.createElement("input");
			subRegionInput.type = "hidden";
			subRegionInput.name = "subRegion";
			if (subRegionButton.textContent === "상세 지역") {
				subRegionInput.value = "";
			} else {
				subRegionInput.value = subRegionButton.textContent;
			}
			form.appendChild(subRegionInput);

			var ntrpInput = document.createElement("input");
			ntrpInput.type = "hidden";
			ntrpInput.name = "ntrp";
			if (dropdownMenuButton1.textContent === "레벨(ntrp)") {
				ntrpInput.value = "1.0";
			} else {
				ntrpInput.value = dropdownMenuButton1.textContent.slice(0, -2);
			}
			form.appendChild(ntrpInput);

			var genderInput = document.createElement("input");
			genderInput.type = "hidden";
			genderInput.name = "gender";
			if (dropdownMenuButton2.textContent === "성별") {
				genderInput.value = "무관";
			} else {
				genderInput.value = dropdownMenuButton2.textContent;
			}
			form.appendChild(genderInput);

			var openInput = document.createElement("input");
			openInput.type = "hidden";
			openInput.name = "open";
			if (dropdownMenuButton3.textContent === "모집중") {
				openInput.value = "Y";
			} else if (dropdownMenuButton3.textContent === "마감") {
				openInput.value = "N";
			} else if (dropdownMenuButton3.textContent === "마감여부") {
				openInput.value = "전체"
			} else if (dropdownMenuButton3.textContent === "전체") {
				openInput.value = "전체"
			}
			form.appendChild(openInput);
			// 폼 전송
			document.body.appendChild(form);
			form.submit();
		}
	</script>



	<script>
		// 이벤트 리스너를 추가하여 클릭한 항목의 텍스트를 드롭다운 버튼의 텍스트로 설정
		document
				.querySelectorAll('.dropdown-menu')
				.forEach(
						function(menu) {
							menu
									.addEventListener(
											'click',
											function(event) {
												if (event.target
														.matches('.dropdown-item')) {
													event.target
															.closest(
																	'.dropdown')
															.querySelector(
																	'.dropdown-toggle').textContent = event.target.textContent;
												}
											});
						});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>