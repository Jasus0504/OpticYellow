<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link href="resources/css/bootstrap/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/css/login/sign-in.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function fn_action() {
		// 이름 입력 확인
		if (!document.getElementById('name').value) {
			alert("이름을 입력해주세요!");
			return false;
		}

		// 이메일 입력 확인
		if (!document.getElementById('email').value) {
			alert("이메일을 입력해주세요!");
			return false;
		}

	}; // end fn_action()......
</script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">

	<main class="form-signin w-100 m-auto">
		<form name="frm" action="findIdOK.do" method="post"
			onsubmit="return fn_action()">
			<div style="text-align: center;">
				<a href="home.do"><img class="mb-4"
					src="resources/images/logo.png" width="270"></a>
			</div>
			<br>
			<div class="input-group mb-3">
				<input type="text" class="form-control" id="name" name="name"
					style="border-radius: 5px;" value="" placeholder="이름">
			</div>
			<div class="input-group mb-3">
				<input type="email" class="form-control" id="email" name="email"
					style="border-radius: 5px;" value="" placeholder="이메일">
			</div>
			<input class="btn btn-primary w-100 py-2" type="submit"
				value="아이디 찾기">
		</form>
		<br>
		<div align="center">
			<a href="login.do" class="mt-5 mb-3 text-body-secondary">로그인</a> <span>｜</span> <a
				href="findPw.do" class="mt-5 mb-3 text-body-secondary">비밀번호 찾기</a> <span>｜</span>
			<a href="m_insert.do" class="mt-5 mb-3 text-body-secondary">회원가입</a>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>