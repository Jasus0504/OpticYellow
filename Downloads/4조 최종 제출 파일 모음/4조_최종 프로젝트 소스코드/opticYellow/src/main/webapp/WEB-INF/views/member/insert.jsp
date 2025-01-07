<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/member_insert/checkout.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	// onload
	function on(){
		// 1. 선호 시간대 생성
		var m_time = document.getElementById("m_time"); // select 가져오기
		
		var startTime = 9;
		var endTime = 22;
		
		for (var i = startTime; i < endTime; i++) {
			var option = document.createElement("option");
			var timeString = i.toString().padStart(2,"0") + ":00 ~ " + (i+1).toString().padStart(2,"0") + ":00";
			option.value = timeString;
			option.text = timeString;
			m_time.appendChild(option);
		}
		
	} // end onload......

 	// 필수값 입력 확인
 	function fn_action() {

 		// 아이디 입력 확인
 		if(!document.getElementById('m_id').value){
 			alert("아이디를 입력해주세요.");
 			return false;
 		} else if(!/^[a-zA-Z0-9]{5,12}$/.test(document.getElementById('m_id').value)){
 			alert("아이디를 영문 4자리 이상, 12자리 이하로 입력해주세요.");
 			location.reload();
 			return false;
 		}

 		// 비밀번호 입력 확인
 		if(!document.getElementById('pw').value){
 			alert("비밀번호를 입력해주세요.");
 			return false;
 		}
		
 		// 비밀번호 확인 입력 확인, 비밀번호와 비밀번호 확인 비교
 		if(!document.getElementById('pwConfirm').value
 				|| document.getElementById('pw').value
 				!= document.getElementById('pwConfirm').value){
 			alert("비밀번호 확인을 진행해주세요.");
 			return false;
 		}

 		// 이름 입력 확인
 		if(!document.getElementById('name').value){
 			alert("이름을 입력해주세요.");
 			return false;
 		}

 		// 성별 체크 확인
 		if (document.frm.gender[0].checked == false
 				&& document.frm.gender[1].checked == false) {
 			alert("성별을 체크해주세요.");
 			return false;
 		}
		
 		// 주소 입력 확인
 		if(!document.getElementById('addr').value){
 			alert("주소를 입력해주세요.");
 			return false;
 		}
		
 		// 전화번호 입력 확인
 		if(!document.getElementById('tel').value){
 			alert("전화번호를 입력해주세요.");
 			return false;
 		}else if(!/^\d{3}-\d{4}-\d{4}$/.test(document.getElementById('tel').value)){
 			alert("전화번호(010-0000-000)를 형식에 맞게 입력해주세요.");
 			return false;
 		}
		
 		// 이메일 입력 확인
 		if(!document.getElementById('email').value){
 			alert("이메일을 입력해주세요.");
 			return false;
 		}
		
 		// 생년월일 입력 확인
 		if(!document.getElementById('birth')){
 			alert("생년월일을 입력해주세요.");
 			return false;
 		} else if(!/^\d{4}-\d{2}-\d{2}$/.test(document.getElementById('birth').value)){
 			alert("생년월일(YYYY-MM-DD)을 형식에 맞게 입력해주세요.");
 			return false;
 		}

 		// 선호지역 입력 확인
 		if(!document.getElementById('m_location').value){
 			alert("선호지역을 선택해주세요.");
 			return false;
 		}

 		// 선호시간 입력 확인
 		if(!document.getElementById('m_time').value){
 			alert("선호시간을 선택해주세요.");
 			return false;
 		}
		
		
 	}; // end fn_action()
	
 	function idCheck(){
 		$.ajax({
 			url: "json_idCheck.do",
 			data: {m_id:$('#m_id').val()},
 			method: 'POST',
 			dataType: 'json',
 			success: function(response){
 				console.log(response.result);
 				if(response.result === 'OK'){
 					alert("사용 가능한 아이디입니다.");
 				} else{
 					alert("이미 사용중인 아이디입니다.");
 					location.reload();
 				}
 			},
 			error: function(xhr,status,error){
 				console.log('xhr.status:',xhr.status);
 			}
			
 		}); // end ajax
 	}; // end idCheck()

 	// 비밀번호 2차 확인
 	function passConfirm() {
 		// 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같으면 비밀번호 일치, 그렇지 않으면 불일치 텍스트 출력
 		var password = document.getElementById('pw');					
 		var passwordConfirm = document.getElementById('pwConfirm');	
 		var confrimMsg = document.getElementById('confirmMsg'); // 확인 메세지 > span 태그
 		var correctColor = "#0000ff";
 		var wrongColor ="#ff0000";
		
 		if(password.value == passwordConfirm.value){
 			confirmMsg.style.color = correctColor;
 			confirmMsg.innerHTML ="비밀번호 일치"; // innerHTML로 HTML 내부에 내용 추가
 		}else{
 			confirmMsg.style.color = wrongColor;
 			confirmMsg.innerHTML ="비밀번호 불일치";
 		}

 	} // end passConfirm()
 	
 	// 선호지역 선택
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
	
	function subChange(){
		var region = document.getElementById("region").value; // 첫 번째 드롭다운의 선택된 값 가져오기
		var subRegionSelect = document.getElementById("subRegion").value; // 두 번째 드롭다운 요소 가져오기	
		
        var m_location = region + " " + subRegionSelect;
        document.getElementById('m_location').value = m_location;
		
	} // end subChange()......
	
	function imgChange(){
		
 		var fileInput = document.getElementById('multipartFile'); // 업로드한 프로필 img 주소
 		var imgSrc = document.getElementById('imgSrc'); // 기존 프로필 img 주소
 		
 		if(fileInput.files){ // fileInput 값이 있으면 true
 			var reader = new FileReader(); // 파일을 읽는 객체
 			
 			// 파일 목록의 첫 번째 파일을 읽음
 			reader.readAsDataURL(fileInput.files[0]);
 			
 			// FileReader가 성공적으로 파일을 읽으면 호출되는 callback 함수
 			reader.onload = function(e){
 				// imgSrc의 src 속성에 reader가 읽은 내용을 저장
 				imgSrc.setAttribute("src",e.target.result);
 			};
 			
 		}
 		
	} // end imgChange()......
	

 	
</script>
</head>
<body onload="on()" class="d-flex align-items-center py-4 bg-body-tertiary">
		<main class="form-signin w-50 m-auto">
			<div class="py-5 text-center">
				<a href="home.do"><h1>WELCOME TO<br>OPTIC YELLOW</h1></a>
			</div>	
				<form name="frm" action="m_insertOK.do" method="post"
					onsubmit="return fn_action()" enctype="multipart/form-data">
					<img src="resources/uploadimg/default.png" id="imgSrc" class="mx-auto d-block">
					<span class="notice">프로필</span>
					<div class="input-group mb-3">
						<input class="form-control" type="file" id="multipartFile" name="multipartFile" oninput="imgChange()">
					</div>
					<div class="mb-3 row">
						<span class="notice">아이디</span>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="m_id" name="m_id" value="">
						</div>
						<div class="col-sm-3">
							<button type="button" onclick="idCheck()" class="btn btn-primary mb-3">중복아이디 체크</button>
						</div>
					</div>
					<div class="mb-3 row">
						<span class="notice">비밀번호</span>
						<div class="col">
							<input type="password" class="form-control" id="pw" name="pw" value="">
						</div>				
					</div>						
					<div class="mb-3 row">
						<span class="notice">비밀번호 확인</span>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwConfirm" value="" oninput="passConfirm()">
						</div>
						<div class="col-sm-3">
							<span id="confirmMsg"></span>
						</div>				
					</div>
					<div class="mb-3 row">
						<span class="notice">이름</span>
						<div class="col">
							<input type="text" class="form-control" id="name" name="name" value="">
						</div>				
					</div>
					<div>
						<span class="notice">성별&nbsp;&nbsp;&nbsp;</span>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="M">
							<label class="form-check-label" for="inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="F">
							<label class="form-check-label" for="inlineRadio2">여성</label>
						</div>
					</div>
					<br>
					<div class="mb-3 row">
						<span class="notice">주소</span>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="addr" name="addr" value="">
						</div>
						<div class="col-sm-3">
							<button type="button" onclick="sample5_execDaumPostcode()" class="btn btn-primary mb-3">주소 찾기</button>
						</div>
					</div>	
					<div class="mb-3 row">
						<span class="notice">전화번호</span>
						<div class="col">
							<input type="text" class="form-control" id="tel" name="tel" value="" placeholder="010-0000-0000">
						</div>				
					</div>
					<div class="mb-3 row">
						<span class="notice">이메일</span>
						<div class="col">
							<input type="text" class="form-control" id="email" name="email" value="" placeholder="abcdefg@email.com">
						</div>				
					</div>
					<div class="mb-3 row">
						<span class="notice">생년월일</span>
						<div class="col">
							<input type="text" class="form-control" id="birth" name="birth" value="" placeholder="0000-00-00">
						</div>				
					</div>
					<div>
						<select id="m_ntrp" name="m_ntrp" class="form-select" aria-label="Default select example">
							<option value="1.0">NTRP 1.0</option><option value="1.5">NTRP 1.5</option>
							<option value="2.0">NTRP 2.0</option><option value="2.5">NTRP 2.5</option>
							<option value="3.0">NTRP 3.0</option><option value="3.5">NTRP 3.5</option>
							<option value="4.0">NTRP 4.0</option><option value="4.5">NTRP 4.5</option>
							<option value="5.0">NTRP 5.0</option><option value="5.5">NTRP 5.5</option>
							<option value="6.0">NTRP 6.0</option><option value="6.5">NTRP 6.5</option>
							<option value="7.0">NTRP 7.0</option>
						</select>						
					</div>
					<br>
					<div class="form-floating">
						<textarea class="form-control" placeholder="자기소개" id="introduce" name="introduce" style="height: 100px"></textarea>
						<label for="floatingTextarea2">자기소개</label>
					</div>
					<br>
					<div class="mb-3 row">
						<div class="col-sm-6">
						<input type="hidden" id="m_location" name="m_location" value="">
						<select id="region" name="region" onchange="updateSubRegion()" class="form-select">
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
						</select>
						</div>
						<div class="col-sm-6">
							<select id="subRegion" name="subRegion" onchange="subChange()" class="form-select">
								<option value="">상세 지역</option>
							</select>						
						</div>													
					</div>
					<div>
						<select id="m_time" name="m_time" class="form-select" aria-label="Default select example">
							<option value="">선호시간 선택</option>
						</select>						
					</div>
					<br>
					<input class="btn btn-primary w-100 py-2" type="submit" value="회원 가입" style="margin-bottom:10%">																																									
				</form>
		</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3f0c1fe74c7dcbbb5be92ce95ca81a1&libraries=services"></script>
	<script>
	// 지도 검색
	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function (data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addr").value = addr;
			}
		}).open();
	}
	</script>
</body>
</html>