<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/Normal.css" />
</head>
<body onload="on()" class="d-flex align-items-center py-4 bg-body-tertiary">
		<main class="form-signin w-50 m-auto">
			<div class="py-5 text-center">
				<a href="home.do"><img src="resources/images/logo.png" alt="이미지"></a>
				<p class="lead">내 용품 판매하기</p>
			</div>
				<form name="frm" action="p_insertOK.do" method="post"
					onsubmit="return validateForm()" enctype="multipart/form-data">
					
					
					<div class="mb-3 row">
						<span class="notice">제목</span>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="p_name" name="p_name" value="">
						</div>												
					</div>
					
					
					<div class="mb-3 row">
						<span class="notice">물품 상태</span>
						<div>
						<select id="p_cond" name=p_cond class="form-select" aria-label="Default select example">
							<option value="미개봉 재품">미개봉 품</option>
						<option value="거의 새제품">거의 새제품</option>
						<option value="약간의 흠집있음">약간의 흠집있음</option>
						<option value="중고, 사용감 있음">중고, 사용감 있음</option>
						<option value="중고, 사용감 많음">중고, 사용감 많음</option>
						</select>						
					</div>
								
					</div>						
					<div class="mb-3 row">
						<span class="notice">물품 소개</span>
						<div class="col-sm-9">
							<input class="form-control" name="p_info" id="p_info" value="" oninput="passConfirm()" 
							style="height: 100px">
						</div>								
					</div>
					
					<div class="mb-3 row">
						<span class="notice">시작가:</span>
						<div class="col">
							<input class="form-control" id="start_price" name="start_price" value="">
						</div>				
					</div>
					
					<div class="mb-3 row">
						<span class="notice">최소거래 금액</span>
						<span class="notice">(마감 시간 기준 최고 응찰금액이 최소거래 금액 이하 일 경우 거래가 진행되지 않습니다.)</span>
						<div class="col">
							<input class="form-control" id="low" name="low" value="">
						</div>				
					</div>
					
					<div class="mb-3 row">
						<span class="notice">물품 카테고리</span>
						<div>
						<select id="cat" name="cat" class="form-select" aria-label="Default select example">
							<option value="racket">라켓</option>
						<option value="racket_bag">라켓 가방</option>
						<option value="sports_bag">스포츠 가방</option>
						<option value="tshirt">티셔츠</option>
						<option value="pants">바지</option>
						<option value="shoes">신발</option>
						<option value="accessory">액세서리</option>
						<option value="ball">테니스 공</option>
						<option value="etc">기타</option>
						</select>						
					</div>
					</div>				
					<br>
						<span class="notice">경매 마감일자</span>			
					<div class="input-group mb-3">
						<input class="form-control" type="datetime-local" id="dead_line" name="dead_line">
					</div>					
					
					<span class="notice">물품 사진</span>
					
					<div class="input-group mb-3">
						<input class="form-control" type="file" id="file" name="multipartFile1">
					</div>
					
					<div class="input-group mb-3">
						<input class="form-control" type="file" id="file1" name="multipartFile2" >
					</div>
					
					<div class="input-group mb-3">
						<input class="form-control" type="file" id="file2" name="multipartFile3">
					</div>
					<div>
						<input id="seller" name="seller" value="${user_id}" type="hidden">
					</div>
					
					<br>
					<input class="btn btn-primary w-100 py-2" type="submit" value="용품 등록" style="margin-bottom:10%">																																									
				</form>
		</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3f0c1fe74c7dcbbb5be92ce95ca81a1&libraries=services"></script>
	<script>
function validateForm() {
    var fileInput = document.getElementById("file");
    var file = fileInput.value;

    if (file === "") {
        alert("최소한 한 개 이상의 제품 사진을 등록하셔야 합니다.");
        return false; // 폼 전송을 중지
    }

    
    
    var deadLineInput = document.getElementById("dead_line");
    var deadLine = new Date(deadLineInput.value);

 /*    
    var oneDayInMillis = 24 * 60 * 60 * 1000;
    var currentTime = new Date();
    var timeDifference = deadLine - currentTime;

    if (timeDifference <= oneDayInMillis) {
        alert("마감시간은 최소 하루 이상이어야 합니다.");
        return false; // 폼 전송을 중지
    } */

    return true; // 폼 전송 실행
}
</script>


</body>
</html>