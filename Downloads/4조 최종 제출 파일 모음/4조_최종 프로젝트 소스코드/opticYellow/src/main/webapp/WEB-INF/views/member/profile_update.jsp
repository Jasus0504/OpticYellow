<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.112.5">
<title>Optic Yellow</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

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

.profile-photo__circle {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background-color: #eaeaea;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.profile-photo__image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 50%;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 20px;
	margin-top: 30px;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function fn_action() {

	}

	function imgChange() {
	    var fileInput = document.getElementById('multipartFile'); // 업로드한 프로필 img 주소
	    var imgSrc = $("#profileImage"); // 기존 프로필 img 주소
	    var defaultImage = imgSrc.attr("src"); // 기존 이미지 경로

	    if (fileInput.files.length > 0) {
	        var reader = new FileReader(); // 파일을 읽는 객체
	        // 파일 목록의 첫 번째 파일을 읽음
	        reader.readAsDataURL(fileInput.files[0]);

	        // FileReader가 성공적으로 파일을 읽으면 호출되는 callback 함수
	        reader.onload = function(e) {
	            // imgSrc의 src 속성에 reader가 읽은 내용을 저장
	            imgSrc.attr("src", e.target.result);
	        };
	    } else {
	        // 선택한 파일이 없을 경우 기존 이미지를 복구
	        imgSrc.attr("src", defaultImage);
	    }
	}// end imgChange()......

	$(document).ready(
			function() {
				console.log('ready...');
				var m_id = "${user_id}";
				$.ajax({
					url : "json_mypage_profile.do",
					data : {
						m_id : m_id
					},
					method : 'GET',
					dataType : 'json',
					success : function(vo2) {
						console.log('ajax...success:', vo2);//{}
						$("#m_id").val(vo2.m_id);
						$("#name").val(vo2.name);
						$("#introduce").val(vo2.introduce);
						$("#m_img").val(vo2.m_img);
						$("#gender").val(vo2.gender);
						$("#m_ntrp").val(vo2.m_ntrp);
						// 성별 선택

						$("input[name=gender][value='" + vo2.gender + "']")
								.prop('checked', true);

						// NTRP 선택
						$("select[name=m_ntrp]").val(vo2.m_ntrp);

						// 프로필 이미지 설정
			            if (vo2.m_img) {
			                $("#profileImage").attr("src", "resources/uploadimg/" + vo2.m_img);
			            } else {
			                // 기존 이미지가 없을 경우 유저의 m_img로 설정
			                $("#profileImage").attr("src", "resources/uploadimg/" + $("#m_img").val());
			            }

					},
					error : function(xhr, status, error) {
						console.log('xhr.status:', xhr.status);
					}
				});

				// 변경하기 버튼 클릭 이벤트 핸들러
				$("#submitBtn").click(function(event) {
					// 이름 입력 확인
					if (!document.getElementById('name').value) {
						alert("이름을 입력해주세요!");
						return false;
					}

					alert("변경 성공!");
					return ture;
				});
			});
</script>

</head>
<body class="bg-body-tertiary">

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">프로필 수정</li>
			</ol>
		</nav>
	</div>
	<div class="container">
		<main>
			<div class="col-12 d-flex justify-content-center align-items-center">

				
				<input type="hidden" id="name" name="name" value="${vo2.name}">
				<input type="hidden" id="introduce" name="introduce" value="${vo2.introduce}">
				<input type="hidden" id="gender" name="gender" value="${vo2.gender}">
				<input type="hidden" id="m_ntrp" name="m_ntrp" value="${vo2.m_ntrp}">

				<div class="col-md-7 col-lg-8">
					<!-- 					<h4 class="mb-3">프로필 수정</h4> -->
					<form class="needs-validation" action="mypage_profile_updateOK.do" method="POST" enctype="multipart/form-data">
						<input type="hidden" id="m_id" name="m_id" value="${vo2.m_id}">
						<input type="hidden" id="m_img" name="m_img" value="${vo2.m_img}">
						<!-- 나머지 폼 요소들을 여기에 추가하세요 -->
						<div class="col-12 d-flex flex-column align-items-center">
							<div class="profile-photo__circle">
								<img id="profileImage" class="profile-photo__image" name="m_img" src="resources/uploadimg/${vo2.m_img}">

							</div>
							<p>
							<div class="input-group mb-3">
								<input class="form-control" type="file" id="multipartFile" name="multipartFile" oninput="imgChange()">
							</div>
						</div>
						<div class="col-12">
							<label for="name" class="form-label">이름</label>

							<input type="text" class="form-control" id="name" name="name" placeholder="" value="${vo2.name}" required>
						</div>
						<div class="col-12">
							<p>
							<p>
								<label for="introduce" class="form-label">자기소개</label>

								<input type="text" class="form-control" id="introduce" name="introduce" placeholder="" value="${vo2.introduce}">
						</div>
						<p>
						<div class="row gy-3">
							<div class="col-md-6">
								<label for="gender" name="gender" class="form-label">성별</label>

								<div class="my-3">
									<input id="m_gender" name="gender" type="radio" class="form-check-input" value="M">
									남자
									<input id="f_gender" name="gender" type="radio" class="form-check-input" value="F">
									여자
								</div>
							</div>
							<div class="col-md-6">


								<label for="m_ntrp" name="m_ntrp" class="form-label">NTRP</label> <select class="form-select" name="m_ntrp" id="m_ntrp" required>
									<option value="1">NTRP 1.0</option>
									<option value="1.5">NTRP 1.5</option>
									<option value="2">NTRP 2.0</option>
									<option value="2.5">NTRP 2.5</option>
									<option value="3">NTRP 3.0</option>
									<option value="3.5">NTRP 3.5</option>
									<option value="4">NTRP 4.0</option>
									<option value="4.5">NTRP 4.5</option>
									<option value="5">NTRP 5.0</option>
									<option value="5.5">NTRP 5.5</option>
									<option value="6">NTRP 6.0</option>
									<option value="6.5">NTRP 6.5</option>
									<option value="7">NTRP 7.0</option>
								</select>
							</div>
						</div>
						<p>
						<hr class="col-12">
						<button class="col-12 btn btn-primary btn-lg" id="submitBtn" type="submit">변경하기</button>
					</form>
				</div>
			</div>
		</main>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>

</html>
