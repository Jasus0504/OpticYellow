<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/main/headers.css">
	<body class="bg-white">

	<div style="width:100%">
		<div class="container" id="cont_h">
			<header class="" style="height:100px;">
				<div class="d-flex h-100">
					<a href="home.do" class="me-auto my-auto p-2">
						<img src="resources/images/logo.png" width="220">
					</a>
					<form class="my-auto p-2" role="search">
						<input type="text" class="form-control" placeholder="코트 검색">
					</form>
					<ul class="nav my-auto p2">
						<li class="nav-item dropdown">
							<a role="button" id="m_img" class="nav-link dropdown-toggle px-2" data-bs-toggle="dropdown" aria-expanded="false">
							<img src="resources/images/top_menu/person-circle.svg" style="width:28px;">
							</a>
							<ul class="dropdown-menu">
								<li id="login"><a class="dropdown-item" href="login.do">로그인</a></li>
								<li id="logout"><a class="dropdown-item" href="logoutOK.do">로그아웃</a></li>
								<li id="myPage"><a class="dropdown-item" href="myPage.do">마이페이지</a></li>
								<li class="adminPage"><hr class="dropdown-divider"></li>
								<li class="adminPage"><a class="dropdown-item" href="adminPage.do">관리자</a></li>
							</ul>							
						</li>
						<li class="nav-item my-auto">
							<input type="checkbox" id="menuicon">
							<label for="menuicon" style="cursor:pointer;">
								<img src="resources/images/top_menu/list.svg" style="width:28px;">
							</label>
							<div class="sidebar">
								<span>내용을 넣어주시면 됩니다.</span>
								<span>내용을 넣어주시면 됩니다.</span>
								<span>내용을 넣어주시면 됩니다.</span>
								<span>내용을 넣어주시면 됩니다.</span>
								<span>내용을 넣어주시면 됩니다.</span>
							</div>
						</li>
					</ul>
				</div>
			</header>
			<nav style="height:100px">
				<ul class="nav d-flex justify-content-between align-content-end h-100">
					<li class="nav-item"><a href="g_insert.do" class="nav-link link-body-emphasis"><span class="d-block text-center mb-2">✨</span><span>매치등록</span></a></li>
					<li class="nav-item"><a href="g_selectAll.do" class="nav-link link-body-emphasis"><span class="d-block text-center mb-2">🎾</span><span>매치목록</span></a></li>
					<li class="nav-item"><a href="fac_manSelectAll.do" class="nav-link link-body-emphasis"><span class="d-block text-center mb-2">🥎</span><span>코트목록</span></a></li>
					<li class="nav-item"><a href="commuList.do" class="nav-link link-body-emphasis"><span class="d-block text-center mb-2">🍀</span><span>커뮤니티</span></a></li>
					<li class="nav-item"><a href="MainHome.do" class="nav-link link-body-emphasis"><span class="d-block text-center mb-2">👀</span><span>용품경매</span></a></li>
				</ul>
			</nav>			
		</div>
		<div class="border-bottom mt-1"></div>
	</div>
	
	<script type="text/javascript">
	// USER > ADMIN > 비회원 
	if ('${role}' === 'USER') {
		$('#login').hide();
		$('#logout').show();
		$('.adminPage').hide();
		$('#myPage').show();
	} else if ('${role}' === 'ADMIN') {
		$('#login').hide();
		$('#logout').show();
		$('.adminPage').show();
		$('#myPage').show();
	} else {
		$('#login').show();
		$('#logout').hide();
		$('.adminPage').hide();
		$('#myPage').hide();
	}
	
	// 로그인 > 프로필 이미지로 변경
	let profile;
	
	if('${user_id}' !== ''){
		profile = `<img src="resources/uploadimg/${m_img}" style="width:28px;border-radius:50%;">`;
		$('#m_img').html(profile);
	} else {
		profile = `<img src="resources/images/top_menu/person-circle.svg" style="width:28px;">`;
		$('#m_img').html(profile);
	}
	
	// 외부배경 클릭 시 사이드바 닫기
    var checkbox = document.getElementById("menuicon");
    
    document.addEventListener("click", function(event) {
      // 체크박스 외부를 클릭한 경우
      if (event.target !== checkbox) {
        checkbox.checked = false;
      }
    });
	
	</script>
	
</body>
</html>