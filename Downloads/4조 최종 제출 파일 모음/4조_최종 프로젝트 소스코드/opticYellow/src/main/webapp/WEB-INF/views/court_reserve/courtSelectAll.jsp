<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/css/mypage/list2.css" rel="stylesheet"
	type="text/css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<style>
#list-base {
	margin-bottom: 1.5%;
	margin-top: 1.5%;
}

main {
	background-color: #F8F9FA !important;
	padding: 0.1% 0;
}

.select-container select {
	display: inline-block;
	margin-bottom: 1.5%;
	margin-top: 1.5%;
	background-color: #F8F9FA;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	function fn_on(){
		console.log("fn_on...");
		
		let param_page = "${param.page}";
		let param_range = "${param.range}";
		
		if(param_page!==""){
			param_page = "${param.page}";
			param_range = "${param.range}";
		} else{
			param_page = 1;
			param_range = 1;
		}
		
		$.ajax({
			url : "json_courtSelectAll.do",
			data : {
				page: param_page,
				range: param_range
			},
			method:'GET',
			dataType:'json',
			success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			
	 			$.each(arr,function(index,vo){
	 				tag_vos += `
	 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
	 					<div
	 						class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
	 						<div class="flex-wrap p-2 fs-6 justify-content-center"
	 							style="width:35%; text-align: center;">
	 							<a href="courtSelectOne.do?fac_id=\${vo.fac_id}" class="text-gray-dark"><strong>\${vo.fac_name}</strong></a>
	 						</div>
	 						<div class="p-2 fs-6 justify-content-between"
	 							style="width: 50%; display: flex; justify-content: center; flex-wrap: wrap;">
	 							<!-- 첫 번째 행 -->
	 							<div class="p-2 text-dark"
	 								style="width: 100%; text-align: left; font-size: 16px;">
	 								🍀 \${vo.floor_type} | 🥎 \${vo.in_or_out}
	 							</div>

	 							<!-- 두 번째 행 -->
	 							<div class="p-2 text-gray-dark"
	 								style="flex: 1; font-size: 14px; display: flex; align-items: center;">
	 								 💰 시간 당 \${vo.c_price} | 🕒 \${vo.open_time}:00  ~ \${vo.close_time}:00
	 								
	 								</div>
	 						</div>
	 						<div class="p-2 justify-content-center"
	 							style="width: 20%; text-align: center;">
	 							<button class="btn p-3"
	 								style="flex: 1; text-align: center; font-size: 16px;">
	 								<a href="courtSelectOne.do?fac_id=\${vo.fac_id}">상세정보</a>
	 							</button>
	 						</div>
	 					</div>
	 				</div>
	 				`;
	 			});
				
				let page = ``;
	 			
	 			if(${pagination.prev}){
	 				page = `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize})">Previous</a></li>`;
	 			}
	 			
	 			for (let i = ${pagination.startPage}; i <= ${pagination.endPage}; i++) {
	 				page += ` 
	 					<li class="page-item value="${pagination.page == i ? 'active' : ''}">
	 					<a class="page-link" onClick="fn_pagination(\${i}, ${pagination.range},${pagination.rangeSize})"> \${i} </a></li>
					`;					
	 			}
	 			
	 			if(${pagination.next}){
	 				page += `<li class="page-item"><a class="page-link" onClick="fn_prev(${pagination.page},${pagination.range},${pagination.rangeSize})">Next</a></li>`;
	 			}
	 			
				$("#vos").html(tag_vos);
				$(".pagination").html(page);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
	}		
	function searchList(){
		console.log("searchList...");
		
		let param_page = "${param.page}";
		let param_range = "${param.range}";
		
		if(param_page!==""){
			param_page = "${param.page}";
			param_range = "${param.range}";
		} else{
			param_page = 1;
			param_range = 1;
		}
		 $.ajax({
	         url : "json_courtSearchList.do",
	         data:{
	            region:$('#region').val(),
	            subRegion:$('#subRegion').val(),
	            in_or_out:$('#in_or_out').val(),
	            floor_type:$('#floor_type').val(),
	            page: param_page,
				range: param_range
	         },
	         method:'GET',
	         dataType:'json',
			 success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			
	 			$.each(arr,function(index,vo){
	 				tag_vos += `
	 					<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
	 					<div
	 						class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
	 						<div class="flex-wrap p-2 fs-6 justify-content-center"
	 							style="width:35%; text-align: center;">
	 							<a href="courtSelectOne.do?fac_id=\${vo.fac_id}" class="text-gray-dark"><strong> \${vo.fac_name}</strong></a>
	 						</div>
	 						<div class="p-2 fs-6 justify-content-between"
	 							style="width: 50%; display: flex; justify-content: center; flex-wrap: wrap;">
	 							<!-- 첫 번째 행 -->
	 							<div class="p-2 text-dark"
	 								style="width: 100%; text-align: left; font-size: 16px;">
	 								🍀 \${vo.floor_type} | 🥎 \${vo.in_or_out}
	 							</div>

	 							<!-- 두 번째 행 -->
	 							<div class="p-2 text-gray-dark"
	 								style="flex: 1; font-size: 14px; display: flex; align-items: center;">
	 								 💰 시간 당 \${vo.c_price} | 🕒 \${vo.open_time}:00  ~ \${vo.close_time}:00
	 								
	 								</div>
	 						</div>
	 						<div class="p-2 justify-content-center"
	 							style="width: 20%; text-align: center;">
	 							<button class="btn p-3"
	 								style="flex: 1; text-align: center; font-size: 16px;">
	 								<a href="courtSelectOne.do?fac_id=\${vo.fac_id}">예약하기</a>
	 							</button>
	 						</div>
	 					</div>
	 				</div>
	 				`;
	 			});
				
				$("#vos").html(tag_vos);
				$(".pagination").html("");
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
	}//end searchList...
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "court_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "court_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "court_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
	
	
</script>
</head>
<body onload="fn_on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<div class="container">
		<form onchange="searchList()">
			<div class="select-container">
				<!-- 		<div class="col"> -->
				<div class="dropdown">
					<select class="form-select" aria-label="Default select example"
						name="region" id="region" onchange="updateSubRegion()"
						style="width: 120px;">
						<option value="전체">모든 지역</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="대전">대전</option>
						<option value="충남">충남/세종</option>
						<option value="충북">충북</option>
						<option value="대구">대구</option>
						<option value="경북">경북</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="경남">경남</option>
						<option value="광주">광주</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="제주">제주</option>
					</select> <select class="form-select" aria-label="Default select example"
						id="subRegion" name="subRegion" style="width: 120px;">
						<option value="">상세 지역</option>
					</select> <select class="form-select" aria-label="Default select example"
						id="in_or_out" name="in_or_out" style="width: 110px;">
						<option value="전체">실내/외</option>
						<option value="실내">실내</option>
						<option value="실외">실외</option>
					</select> <select class="form-select" aria-label="Default select example"
						id="floor_type" name="floor_type" style="width: 120px;">
						<option value="전체">바닥 종류</option>
						<option value="하드">하드</option>
						<option value="잔디">잔디</option>
						<option value="클레이">클레이</option>
					</select>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
			function updateSubRegion() {
				var region = document.getElementById("region").value; // 첫 번째 드롭다운의 선택된 값 가져오기
				var subRegionSelect = document.getElementById("subRegion"); // 두 번째 드롭다운 요소 가져오기

				// subRegion 드롭다운 초기화
				subRegionSelect.innerHTML = "";

					if (region === "서울") {
						var seoulSubRegions = [ "선택하세요", "강남구", "강동구", "강북구", "강서구", "관악구",
								"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구",
								"영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						for (var i = 0; i < seoulSubRegions.length; i++) {
							var option = document.createElement("option"); // select 태그 안에 option 속성을 생성해서 var option에 저장
							option.value = seoulSubRegions[i]; // value 속성 설정
							option.text = seoulSubRegions[i]; // 텍스트 내용 설정
							subRegionSelect.appendChild(option); // 두 번째 드롭다운에 옵션 추가
						}

					} else if (region === "부산") {
						var busanSubRegions = [ "선택하세요", "강서구", "금정구", "남구", "동구", "동래구",
								"부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구" ];
						for (var i = 0; i < busanSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = busanSubRegions[i];
							option.text = busanSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "대구") {
						var daeguSubRegions = [ "선택하세요", "남구", "달서구", "달성군", "동구", "북구", "서구",
								"수성구", "중구" ];
						for (var i = 0; i < daeguSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = daeguSubRegions[i];
							option.text = daeguSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "인천") {
						var incheonSubRegions = [ "선택하세요", "강화군", "계양구", "남동구", "동구", "미추홀구",
								"부평구", "서구", "연수구", "옹진군" ];
						for (var i = 0; i < incheonSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = incheonSubRegions[i];
							option.text = incheonSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "광주") {
						var gwangjuSubRegions = [ "선택하세요", "광산구", "남구", "동구", "북구", "서구" ];
						for (var i = 0; i < gwangjuSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = gwangjuSubRegions[i];
							option.text = gwangjuSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "대전") {
						var daejeonSubRegions = [ "선택하세요", "동구", "서구", "유성구", "중구" ];
						for (var i = 0; i < daejeonSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = daejeonSubRegions[i];
							option.text = daejeonSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "울산") {
						var ulsanSubRegions = [ "선택하세요", "남구", "동구", "북구", "울주군", "중구" ];
						for (var i = 0; i < ulsanSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = ulsanSubRegions[i];
							option.text = ulsanSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "경기") {
						var gyeonggiSubRegions = [ "선택하세요", "과천시", "광명시", "광주시", "구리시", "군포시",
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
					} else if (region === "강원") {
						var gangwonSubRegions = [ "선택하세요", "강릉시", "고성군", "동해시", "삼척시", "속초시",
								"양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시",
								"태백시", "평창군", "홍천군", "화천군", "횡성군" ];
						for (var i = 0; i < gangwonSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = gangwonSubRegions[i];
							option.text = gangwonSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "충북") {
						var chungcheongbukSubRegions = [ "선택하세요", "괴산군", "단양군", "보은군", "영동군",
								"옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시", "충주시" ];
						for (var i = 0; i < chungcheongbukSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = chungcheongbukSubRegions[i];
							option.text = chungcheongbukSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "충남") {
						var chungcheongnamSubRegions = [ "선택하세요", "세종특별자치시", "계룡시", "공주시", "금산군", "논산시",
								"당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시",
								"청양군", "태안군", "홍성군" ];
						for (var i = 0; i < chungcheongnamSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = chungcheongnamSubRegions[i];
							option.text = chungcheongnamSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "전북") {
						var jeollabukSubRegions = [ "선택하세요", "고창군", "군산시", "김제시", "남원시", "무주군",
								"부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시",
								"진안군" ];
						for (var i = 0; i < jeollabukSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = jeollabukSubRegions[i];
							option.text = jeollabukSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "전남") {
						var jeollanamSubRegions = [ "선택하세요", "강진군", "고흥군", "곡성군", "광양시", "구례군",
								"나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시",
								"영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군",
								"화순군" ];
						for (var i = 0; i < jeollanamSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = jeollanamSubRegions[i];
							option.text = jeollanamSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "경북") {
						var gyeongsangbukSubRegions = [ "선택하세요", "경산시", "경주시", "고령군", "구미시",
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
						var gyeongsangnamSubRegions = [ "선택하세요", "거제시", "거창군", "고성군", "김해시",
								"남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군",
								"창원시", "통영시", "하동군", "함안군", "함양군", "합천군" ];
						for (var i = 0; i < gyeongsangnamSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = gyeongsangnamSubRegions[i];
							option.text = gyeongsangnamSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "제주") {
						var jejuSubRegions = [ "선택하세요", "서귀포시", "제주시" ];
						for (var i = 0; i < jejuSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = jejuSubRegions[i];
							option.text = jejuSubRegions[i];
							subRegionSelect.appendChild(option);
						}
					} else if (region === "전체") {
						var areaSubRegions = [ "선택하세요" ];
						for (var i = 0; i < areaSubRegions.length; i++) {
							var option = document.createElement("option");
							option.value = areaSubRegions[i];
							option.text = areaSubRegions[i];
							subRegionSelect.appendChild(option);
						}

					}

				
		
			} // end updateSubRegion()......
	</script>

	<main class="container">
		<div id="vos"></div>

		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination d-flex justify-content-center">

			</ul>
		</div>
		<!-- pagination{e} -->

	</main>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>