<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테니스장 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function fn_action() {
		// 테니스장 이름 입력 확인
		if (!document.getElementById('fac_name').value) {
			alert("테니스장 이름을 입력해주세요!");
			return false;
		}

		// 주소 입력 확인
		if (!document.getElementById('address').value) {
			alert("주소를 입력해주세요!");
			return false;
		}
		
		// 코트 수 입력 확인
		if (!document.getElementById('court_no').value) {
			alert("코트 수를 입력해주세요!");
			return false;
		}
		
		// 실내 / 외 입력 확인
		if (!document.getElementById('in_or_out').value) {
			alert("실내 / 외 여부를 입력해주세요!");
			return false;
		}
		
		// 코트 종류 입력 확인
		if (!document.getElementById('floor_type').value) {
			alert("코트 종류를 입력해주세요!");
			return false;
		}
		
		// 여는 시간 입력 확인
		if (!document.getElementById('open_time').value) {
			alert("여는 시간을 입력해주세요!");
			return false;
		}
		
		// 닫는 시간 입력 확인
		if (!document.getElementById('close_time').value) {
			alert("닫는 시간을 입력해주세요!");
			return false;
		}
		
		// 코트 대여료 입력 확인
		if (!document.getElementById('c_price').value) {
			alert("코트 대여료를 입력해주세요!");
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<div class="container">
	<div class="py-5 text-center">
		<h1>테니스장 등록하기</h1>
	</div>

	<form action="fac_registrationOK.do" method="post" onsubmit="return fn_action()"
		enctype="multipart/form-data">
		<div class="mb-3 row">
			<label for="register_id" class="col-lg-2 col-form-label">테니스장
				등록자</label>
			<div class="col-lg-10">
				<input type="text" readonly class="form-control-plaintext"
					id="register_id" name="register_id" value="${user_id}">
			</div>
		</div>

		<div class="mb-3 row">
			<label for="fac_name">테니스장 이름</label>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="fac_name" name="fac_name" value="">
			</div>
		</div>

		<div class="mb-3 row">
			<span class="notice">주소</span>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="address" name="address"
					value="">
			</div>
			<div class="col-sm-3">
				<button type="button" onclick="sample5_execDaumPostcode()"
					class="btn btn-primary mb-3">주소 찾기</button>
			</div>
		</div>

		<div class="mb-3 row">
			<div class="col-sm-2">
				<label for="court_no">코트 수</label> <input type="text"
					class="form-control" id="court_no" name="court_no" value="">
			</div>
		</div>

		<div class="mb-3 row">
			<label for="in_or_out">실내 / 실외</label>
			<div class="col-sm-2">
				<select
					name="in_or_out" class="form-select" id="in_or_out">
					<option value="">선택하세요</option>
					<option value="실내">실내</option>
					<option value="실외">실외</option>
				</select>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="floor_type">코트 종류</label>
			<div class="col-sm-2">
				<select name="floor_type" class="form-select" id="floor_type">
					<option value="">선택하세요</option>
					<option value="클레이">클레이</option>
					<option value="하드">하드</option>
					<option value="잔디">잔디</option>
				</select>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="open_time">여는 시간</label>
			<div class="col-sm-2">
				<select name="open_time" class="form-select col-3" id="open_time">
					<option value="">선택하세요</option>
					<option value="00">00:00</option>
					<option value="01">01:00</option>
					<option value="02">02:00</option>
					<option value="03">03:00</option>
					<option value="04">04:00</option>
					<option value="05">05:00</option>
					<option value="06">06:00</option>
					<option value="07">07:00</option>
					<option value="08">08:00</option>
					<option value="09">09:00</option>
					<option value="10">10:00</option>
					<option value="11">11:00</option>
					<option value="12">12:00</option>
					<option value="13">13:00</option>
					<option value="14">14:00</option>
					<option value="15">15:00</option>
					<option value="16">16:00</option>
					<option value="17">17:00</option>
					<option value="18">18:00</option>
					<option value="19">19:00</option>
					<option value="20">20:00</option>
					<option value="21">21:00</option>
					<option value="22">22:00</option>
					<option value="23">23:00</option>
				</select>
			</div>
		</div>
		
		<div class="mb-3 row">
			<label for="close_time">닫는 시간</label>
				<div class="col-sm-2">
					<select
						name="close_time" class="form-select" id="close_time">
						<option value="">선택하세요</option>
						<option value="01">01:00</option>
						<option value="02">02:00</option>
						<option value="03">03:00</option>
						<option value="04">04:00</option>
						<option value="05">05:00</option>
						<option value="06">06:00</option>
						<option value="07">07:00</option>
						<option value="08">08:00</option>
						<option value="09">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
						<option value="23">24:00</option>
					</select>
				</div>
			</div>
			
		<div class="mb-3 row">
			<label for="conv"><h3>편의 시설</h3></label>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="무료주차장">
					<label class="form-check-label" for="conv">무료주차장</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="무료주차장">
					<label class="form-check-label" for="conv">유료주차장</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="탈의실">
					<label class="form-check-label" for="conv">탈의실</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="샤워실">
					<label class="form-check-label" for="conv">샤워실</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="휴게실">
					<label class="form-check-label" for="conv">휴게실</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="매점">
					<label class="form-check-label" for="conv">매점</label>
				</div>
				<div class="form-check col-sm-3">
					<input class="form-check-input" type="checkbox" id="conv" name="conv" value="남녀구분 화장실">
					<label class="form-check-label" for="conv">남녀구분 화장실</label>
				</div>
			</div>
		
		<div class="mb-3 row col-9">
			<div class="input-group">
  				<span class="input-group-text">오시는 길</span>
  				<textarea class="form-control" aria-label="With textarea" rows="10" cols="20" name="come"></textarea>
			</div>
		</div>

		<div class="input-group mb-3 w-75">
  			<label class="input-group-text" for="court_pic1">테니스장 사진1:</label>
 			<input type="file" class="form-control" id="court_pic1" name="multipartFile1">
		</div>
		
		<div class="input-group mb-3 w-75">
  			<label class="input-group-text" for="court_pic2">테니스장 사진2:</label>
 			<input type="file" class="form-control" id="court_pic2" name="multipartFile2">
		</div>
		
		<div class="input-group mb-3 w-75">
  			<label class="input-group-text" for="court_pic3">테니스장 사진3:</label>
 			<input type="file" class="form-control" id="court_pic3" name="multipartFile3">
		</div>
		
		<div class="row g-3 mb-3 align-items-center">
  			<div class="col-auto">
    			<label for="c_price" class="col-form-label">코트 대여료: 시간당</label>
  			</div>
  			<div class="col-auto">
    			<input type="text" id="c_price" name="c_price" class="form-control">
  			</div>
  			<div class="col-auto">
    			<span id="passwordHelpInline" class="col-form-label">
      				원
    			</span>
  			</div>
		</div>
		
		<div class="mb-3 row">
			<div class="col-3">
				<button type="submit" class="btn btn-primary">제출하기</button>
			</div>
		</div>
	</form>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3f0c1fe74c7dcbbb5be92ce95ca81a1&libraries=services"></script>
<script>
function sample5_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function (data) {
			var addr = data.address; // 최종 주소 변수

			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("address").value = addr;
		}
	}).open();
}
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>