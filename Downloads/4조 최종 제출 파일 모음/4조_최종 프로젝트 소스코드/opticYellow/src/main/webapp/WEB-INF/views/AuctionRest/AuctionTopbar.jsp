<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" data-bs-theme="light">
<head>

<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Shop Layout V2 - Glowing - Bootstrap 5 HTML Templates</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<link rel="icon" href="resources/Jae/assets/images/others/favicon.ico">
<link rel="stylesheet" href="resources/Jae/assets/vendors/lightgallery/css/lightgallery-bundle.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/animate/animate.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/slick/slick.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/mapbox-gl/mapbox-gl.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/assets/css/theme.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
@media (min-width: 1200px)
.container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 860px !important;
}
</style>
	
</head>
<body>

<jsp:include page="top_menuA.jsp"></jsp:include>

<header id="header" class="header header-sticky header-sticky-smart disable-transition-all z-index-5">


	<div class="topbar bg-primary">
	</div>
	<div class="sticky-area">
		<div class="main-header nav navbar bg-body navbar-light navbar-expand-xl py-6 py-xl-0">
			<div class="container flex-nowrap w-100">


				<div class="d-none d-xl-flex w-xl-50 w-100">
					<ul class="navbar-nav w-100">
						<li>
							<a href="AuctionMainHome.do" class="navbar-brand ml-3" style="margin-top:18px;">
							<img class="light-mode-img" src="resources/Jae/images/Auctionlogo.svg" width="50px">
							</a>
						</li>						
						<li class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
							<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px "
							   href="AuctionMainHome.do"  id="menu-item-pages" aria-expanded="false">경매 HOME</a><li  class="" aria-expanded="false">
												</li>
						
						<li class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
							<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px "
							   href="p_introduce.do"  id="menu-item-pages" aria-expanded="false">경매 소개</a><li  class="" aria-expanded="false">
												</li>
						
						<li class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
							<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px "
							   href="p_insert.do"  id="menu-item-pages" aria-expanded="false">용품판매</a><li  class="" aria-expanded="false">
												</li>
						
						<li class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
							<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px dropdown-toggle"
							   href="#" data-bs-toggle="dropdown" id="menu-item-pages" aria-haspopup="true" aria-expanded="false">나의 거래</a>
					    <ul class="dropdown-menu py-6" aria-labelledby="menu-item-pages">
					    <li  class="dropend dropdown-hover" aria-haspopup="true" aria-expanded="false">
						
						<a class="dropdown-item pe-6 border-hover"
						   href="b_sell_list.do" >
						<span class="border-hover-target">
							나의 판매목록
						</span>
						</a></li>	
						
						
						<li>
						<a class="dropdown-item pe-6 border-hover"
						   href="b_buy_list.do" >					
						<span class="border-hover-target">
							나의 응찰기록
						</span>
						</a></li>	
						
					<!-- 	<li >
						<a class="dropdown-item pe-6 border-hover"
						   href="b_bought_list.do" >
						<span class="border-hover-target">
							나의 구매목록
						</span>
						</a></li>	 -->
												
						<li >
						<a class="dropdown-item pe-6 border-hover"
						   href="confirm_buy_menu.do?buyer=${user_id}" >
						<span class="border-hover-target">
							낙찰 가능목록
						</span>
						</a></li>
						
							<li >
						<a class="dropdown-item pe-6 border-hover"
						   href="deal_done.do?seller=${user_id}" >
						<span class="border-hover-target">
							거래완료 승인대기 목록
						</span>

						</a></li>				
						
						</ul></li>
						
						<li id = "m_report" class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
						<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px "
	   						href="r_mylist.do"  id="menu-item-pages" aria-expanded="false">신고내역</a><li  class="" aria-expanded="false">
						</li>	

						<li id = "a_report" class="nav-item transition-all-xl-1 py-11 me-xxl-12 me-xl-10 dropdown dropdown-hover" style="width:15%">
						<a class="nav-link d-flex justify-content-between position-relative py-0 px-0 text-uppercase fw-semibold ls-1 fs-14px "
	   						href="r_selectAll.do"  id="menu-item-pages" aria-expanded="false">신고목록</a><li  class="" aria-expanded="false">
						</li>	
	
					</ul>
				</div>
			
				
				


</div>
<script type="text/javascript">
		// USER > ADMIN > 비회원
		if ('${role}' === 'USER') {
			$('#m_report').show();
			$('#a_report').hide();
		} else if ('${role}' === 'ADMIN') {
			$('#m_report').hide();
			$('#a_report').show();
		} else {
			$('#m_report').show();	
			$('#a_report').hide();
		}
		
		
		
		 $(function() {
		        console.log("onload...");
		        $.ajax({
		            url: "json_r_unread.do",
		            method: 'GET',
		            dataType: 'json',
		            success: function(vo2) {
		                console.log(vo2);
		                let tag_vo2 = ``;

		                if (vo2.length > 0) {
		                    tag_vo2 += `<span class="new-label" style="color: red;"> New</span>`;
		                }

		                $("a[href='r_selectAll.do']").append(tag_vo2);

		            },
		            error: function(xhr, status, error) {
		                console.log('xhr.status:', xhr.status);
		            }
		        });
		        adminOnly();
		    });

		    function adminOnly() {
		        console.log('${role}');
		        var Element = document.getElementById("ADMIN")

		        if ('${role}' === 'USER')
		            Element.style.display = "none";
		    }
		
		</script>
<!-- <div class="form-wrapper">
  <form action="p_searchList.do" class="lh-1 color-inherit text-decoration-none">
    <div class="d-flex align-items-center">
      <select name="searchKey" id="searchKey" class="me-2">
        <option value="AllProduct">전체</option>
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
      <input type="text" name="searchWord" id="searchWord" value="" class="me-2">
      <input type="submit" value="검색">
    </div>
  </form>
</div> -->
					
		</div>
	</div>
	
<!-- 	<style>
  .form-wrapper {
    width: 80%; /* 폼의 전체 크기를 조정합니다 */
    margin: 0 auto; /* 가운데 정렬을 위해 왼쪽과 오른쪽에 자동으로 여백을 추가합니다 */
  }

  .form-wrapper .d-flex {
    align-items: center;
  }

  .form-wrapper select,
  .form-wrapper input[type="text"],
  .form-wrapper input[type="submit"] {
    height: 30px; /* 폼 요소의 높이를 조정합니다 */
    font-size: 14px; /* 폼 요소의 글꼴 크기를 조정합니다 */
  }
  
 .dropdown-menu {
  margin-top: 0; /* 드롭다운 메뉴의 위쪽 여백을 0으로 설정 */
  left: 0; /* 드롭다운 메뉴의 가로 위치를 조정 */
  top: 100%; /* 드롭다운 메뉴의 세로 위치를 조정 */
}
  
</style> -->
</header>

</body>
</html>