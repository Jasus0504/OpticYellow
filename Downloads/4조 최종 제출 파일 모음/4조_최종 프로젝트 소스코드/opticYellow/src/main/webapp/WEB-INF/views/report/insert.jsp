<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
	rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/Normal.css" />
</head>
<body onload="on()"
	class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-signin w-50 m-auto">
		<div class="py-5 text-center">
			<h1>
				신고페이지<br>
			</h1>
		</div>
		<form name="frm" action="r_insertOK.do" method="post"
			onsubmit="return validateForm()" enctype="multipart/form-data">
			<div class="mb-3 row">
				<span class="notice">신고사유</span> <select id="r_reason"
					name="r_reason" class="form-select"
					aria-label="Default select example">
					<option value="사기의심">사기 의심</option>
					<option value="부적합한 물건">부적합한 물건</option>
					<option value="도배">도배</option>
				</select>
			</div>
			<br>
			<div class="mb-3 row">
				<span class="notice">제목</span>
				<div class="col">
					<input type="text" class="form-control" id="r_name" name="r_name"
						value="">
				</div>
			</div>
			<div class="form-floating">
				<textarea class="form-control" placeholder="신고내용" id="r_info"
					name="r_info" style="height: 100px"></textarea>
				<label for="floatingTextarea2">신고내용</label>
			</div>
			<br>
			<div>
				<label for="p_num"></label> <input id="p_num" name="p_num"
					type="hidden" value="${param.p_num}">
			</div>
			<div>
				<input id="r_reporter" name="r_reporter" value="${user_id}"
					type="hidden">
			</div>
			<br> <input class="btn btn-primary w-100 py-2" type="submit"
				value="신고 접수" style="margin-bottom: 10%">
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
			var r_name = document.getElementById("r_name").value;
			var r_info = document.getElementById("r_info").value;

			if (r_name === "" || r_info === "") {
				alert("제목과 신고내용을 모두 입력해주세요.");
				return false; // 폼 제출을 막음
			}
		}
	</script>

</body>
</html>