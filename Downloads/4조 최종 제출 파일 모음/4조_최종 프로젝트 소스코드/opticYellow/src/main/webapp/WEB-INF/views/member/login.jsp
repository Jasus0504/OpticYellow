<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Optic Yellow</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/login/sign-in.css" />
<script type="text/javascript">
	function fn_action() {
		// 아이디 입력 확인
		if (!document.getElementById('m_id').value) {
			alert("아이디를 입력해주세요!");
			return false;
		}

		// 비밀번호 입력 확인
		if (!document.getElementById('pw').value) {
			alert("비밀번호를 입력해주세요!");
			return false;
		}
	}
</script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-signin w-100 m-auto">
		<form action="loginOK.do" method="post" onsubmit="return fn_action()">
			<div style="text-align:center;">
			<a href="home.do"><img class="mb-4" src="resources/images/logo.png" width="270"></a>
			</div>
			<br>
			<div class="form-floating">
				<input type="text" class="form-control" id="m_id" name="m_id"
					value="${m_id}" placeholder="아이디"> <label
					for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pw" name="pw"
					value="" placeholder="비밀번호"> <label
					for="floatingPassword">비밀번호</label>
			</div>

		    <div class="form-check text-start my-3">
				<input type="checkbox" id="flexCheckDefault" class="form-check-input" name="idchk" checked>
				<label class="form-check-label" for="flexCheckDefault">
				아이디 기억하기
				</label>
			</div>

			<input class="btn btn-primary w-100 py-2" type="submit" value="로그인">
		</form>
		<br>
		<div align="center">
			<a href="findId.do" class="mt-5 mb-3 text-body-secondary">아이디</a>
			<span>｜</span>
			<a href="findPw.do" class="mt-5 mb-3 text-body-secondary">비밀번호 찾기</a>
			<span>｜</span>
			<a href="m_insert.do" class="mt-5 mb-3 text-body-secondary">회원가입</a>
		</div>
	</main>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>