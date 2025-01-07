<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" data-bs-theme="light">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- <link rel="icon" href="resources/Jae/assets/images/others/favicon.ico"> -->


<link rel="stylesheet" href="resources/Jae/assets/vendors/lightgallery/css/lightgallery-bundle.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/animate/animate.min.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/slick/slick.css">
<link rel="stylesheet" href="resources/Jae/assets/vendors/mapbox-gl/mapbox-gl.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/assets/css/theme.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
</head>


<body>
	
	<jsp:include page="AuctionRest/AuctionTopbar.jsp"></jsp:include> 
	<main id="content" class="wrapper layout-page">
		
<section>
    
    <div class="row align-items-center hero hero-header-03 mx-0 bg-section-2">
	<div class="col-lg-6 order-1 order-lg-0 text-center py-lg-0 py-16 px-sm-0 px-6">
		<div data-animate="fadeInUp" class="fs-4 fw-semibold text-primary mb-8">Optic Yellow</div>
		<h2 data-animate="fadeInUp" class="mx-auto hero-540 fs-1 mb-4 px-4">테니스 용품 전용 중고거래</h2>
		<p data-animate="fadeInUp" class="mx-auto hero-desc fs-18px text-body-calculate" >나의 물품을 판매하고, 구매할 수 있는 기회</p>
		<a data-animate="fadeInUp" href="p_searchList.do?searchKey=AllProduct&searchWord=" class="btn btn-lg btn-dark mt-6 btn-hover-bg-primary btn-hover-border-primary">Shop Now</a>
	</div>
	<div class="col-lg-6 order-0 order-lg-1 px-0">
		<div class="d-block hover-zoom-in hover-shine">
			<img src="" data-src="resources/Jae/images/TennisStuff.png" class="lazy-image img-fluid w-100 vh-100 object-fit-cover" alt="slider" width="952" height="850">
		</div>
	</div>
</div>

</section>


<section class="container container-xxl pt-14 pt-lg-17">
	<div class="mb-lg-13 mb-7">
		<div class="text-center" ><h2 class="mb-6">카테고리</h2>
		<p class="fs-18px mb-0">다양한 장비로 뛰어난 퍼포먼스를 보여주세요</p></div>

	</div>
	<div class="row">
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=racket&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=racket&searchWord=" data-src="resources/Jae/images/Tennis_racket.jpg" width="160" height="160" alt="Moisturizers">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=racket&searchWord=" class="text-decoration-none">라켓</a>
			 
		</h4>
	</div>
</div>

			</div>
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=racket_bag&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=racket_bag&searchWord=" data-src="resources/Jae/images/Tennis_tennisbag.jpg" width="160" height="160" alt="Toners">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=racket_bag&searchWord=" class="text-decoration-none">라켓가방</a>
			 
		</h4>
	</div>
</div>

			</div>
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=tshirt&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=tshirt&searchWord=" data-src="resources/Jae/images/Tennis_shirt.jpg" width="160" height="160" alt="Masks">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=tshirt&searchWord=" class="text-decoration-none">티셔츠</a>
			 
		</h4>
	</div>
</div>

			</div>
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=pants&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=pants&searchWord=" data-src="resources/Jae/images/Tennis_pants.jpg" width="160" height="160" alt="Kits">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=pants&searchWord=" class="text-decoration-none">바지</a>
			 
		</h4>
	</div>
</div>

			</div>
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=shoes&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=shoes&searchWord=" data-src="resources/Jae/images/Tennis_shoe.jpg" width="160" height="160" alt="Serum">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=shoes&searchWord=" class="text-decoration-none">신발</a>
			 
		</h4>
	</div>
</div>

			</div>
			<div class="col-lg-2 col-md-4 col-sm-6 mt-lg-0 mt-10">
				<div class=" card border-0 fw-semibold ">
	<a href="p_searchList.do?searchKey=accessory&searchWord=" class="rounded-circle mx-auto hover-zoom-in w-100 image-box-1">
		

<img class="lazy-image img-fluid card-img light-mode-img" src="p_searchList.do?searchKey=accessory&searchWord=" data-src="resources/Jae/images/Tennis_acc.jpg" width="160" height="160" alt="Oil Cleansers">
	</a>
	<div class="card-body pt-9 pb-0 d-flex justify-content-center px-0">
		<h4 class="fs-5 text-center position-relative">
			<a href="p_searchList.do?searchKey=accessory&searchWord=" class="text-decoration-none">액세서리</a>
			
		</h4>
	</div>
</div>

			
</div>



			</div>

<div>
</section>

<section id="product_tabs">
	
	<div class="container container-xxl pt-14 pt-lg-16 pb-15 pb-lg-20 mb-4" data-bs-toggle="tab-dropdown">
		<ul class="nav nav-tabs border-0 d-lg-flex justify-content-center mb-12 d-none" role="tablist"><li class="nav-item" role="presentation">
					<h2 class="mb-0 px-2 mx-1">
						<button class="nav-link px-10 py-0 border-0 text-body-emphasis opacity-30 active"  data-bs-toggle="tab" data-bs-target="#best-sellers-tab-pane" type="button" role="tab" aria-controls="best-sellers-tab-pane" aria-selected="true">가장 높은 조회수</button>
					</h2>
				</li><li class="nav-item" role="presentation">
					<h2 class="mb-0 px-2 mx-1">
						<button class="nav-link px-10 py-0 border-0 text-body-emphasis opacity-30"  data-bs-toggle="tab" data-bs-target="#new-arrivals-tab-pane" type="button" role="tab" aria-controls="new-arrivals-tab-pane" aria-selected="false">최근 등록 물품</button>
					</h2>
				</li></ul>
		<ul class="nav nav-tabs border-0 justify-content-center mb-12 d-flex d-lg-none py-2" role="tablist">
			<li class="nav-item me-4"><h3 class="mb-0">You are in</h3></li>
			<li class="nav-item dropdown"><a class="dropdown-toggle text-body-emphasis text-decoration-none d-flex align-items-center h3 mb-0" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Best Sellers</a><ul class="dropdown-menu"><li class="nav-item"><a class="dropdown-item m-0 h5 active" href="#" data-bs-toggle="tab" data-bs-target="#best-sellers-tab-pane" role="tab" aria-controls="best-sellers-tab-pane" aria-selected="true">Best Sellers</a></li><li class="nav-item"><a class="dropdown-item m-0 h5" href="#" data-bs-toggle="tab" data-bs-target="#new-arrivals-tab-pane" role="tab" aria-controls="new-arrivals-tab-pane" aria-selected="false">New Arrivals</a></li><li class="nav-item"><a class="dropdown-item m-0 h5" href="#" data-bs-toggle="tab" data-bs-target="#sale-tab-pane" role="tab" aria-controls="sale-tab-pane" aria-selected="false">Sale</a></li></ul>
			</li>
		</ul>
			<br>
				<br>
				
		<div class="tab-content"><div class="tab-pane fade show active" id="best-sellers-tab-pane" role="tabpanel"  tabindex="0">
					<div class="row gy-50px">


	 <div class="row" id="productList">
            </div>
            
		</div>
				</div>
				
				
				<div class="tab-pane fade" id="new-arrivals-tab-pane" role="tabpanel"  tabindex="0">
					<div class="row gy-50px">
						 <div class="row" id="productList2">
						  </div>
					</div>
				</div></div>
		<div class="text-center mt-11 pt-3">
			<a href="p_searchList.do?searchKey=AllProduct&searchWord=" class="btn btn-outline-dark">전체 물품 보기</a>
		</div>
	</div>
</section>


<section id="with_client_logo_1">
	
	<div class="container pt-14 pb-16 py-lg-20">
		<div class="row mt-5 mb-15">
			<div class="col-lg-9 offset-lg-1 col-xl-8 offset-xl-2">
				<div class="slick-slider main" data-slick-options='{"slidesToShow": 1,"dots":false,"arrows":false, "asNavFor": "#with_client_logo_1 .thumb"}'>
					
						<div class="text-center" data-animate="fadeInUp">
							<h4 class="mb-0">"장인은 도구 탓을 하지 않는다,</h4> 
							<h4 class="mb-0">왜냐하면 그들은 이미 좋은 도구를 갖고 있기 때문이다."</h4>
							
						</div>
						</div>
			</div>
		</div>

	</div>
</section>


<section class="bg-section-2 overflow-hidden" id="specia_offer_beauty_inspired_by_real_life_1"> <!-- style= "background-color: #ECECEC;" -->>
	
	<div class="container container-xxl">
		<div class="row">
			<div class="col-lg-6 ps-6">
				<div class="py-lg-23 py-16 mt-lg-3 mb-lg-5 ms-lg-auto content-wrap">
					<div class="text-left" >
		<p class="fs-15px mb-7 ls-1 text-body-emphasis fw-semibold text-uppercase">OpticYellow</p><h2 class="mb-6 mw-xl-50 mw-lg-60 pt-1">서울 및 수도권<br> 테니스 대전</h2>
		<p class="fs-18px mb-0 mw-xl-60 mw-lg-75">개인 혹은 파트너와 함께 팀을 만들어, 다양한 상품이 있는 지역대회에 참가하세요!</p></div>

					<a href="home.do" class="btn btn-white mt-10 mb-2">지금 바로 신청하기</a>
				</div>
			</div>
			<div class="col-lg-6 py-25 py-lg-0 position-relative">
				<div class="card-img-overlay d-flex align-items-center justify-content-center w-lg-half-screen">
					
<div class="lazy-bg bg-overlay position-absolute z-index-0 w-100 h-100 bg-col-lg-half-screen-right   light-mode-img" data-bg-src="resources/Jae/images/tennisGo.png">
</div>
<div class="lazy-bg bg-overlay dark-mode-img position-absolute z-index-0 w-100 h-100 bg-col-lg-half-screen-right" data-bg-src="resources/Jae/images/tennisGo.png">
</div>
					<a href="https://www.youtube.com/watch?v=xk2BSlU4WME" class="square view-video rounded-circle z-index-1 bg-body text-body-emphasis fs-2 bg-dark-hover text-light-hover" style="--square-size:115px;"><svg class="icon"><use xlink:href="#icon-play-fill"></use></svg></a>


				</div>
			</div>
		</div>
	</div>
	<jsp:include page="AuctionRest/AuctionFooter.jsp"></jsp:include> <!-- Footer -->
</section>

	</main>
<jsp:include page="AuctionRest/AuctionMainHomeRest.jsp"></jsp:include>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
    console.log("onload...");
    
    $.ajax({
      url: "json_view_select8.do",
      method: 'GET',
      dataType: 'json', 
      success: function(data) {
        console.log(data);
        let tag_vo2 = "";
        for (let i = 0; i < data.length; i++) {
          let vo2 = data[i];
          tag_vo2 += `
        	  <div class="col-lg-4 col-xl-3 col-sm-6">
				<div class="card card-product grid-1 bg-transparent border-0">
			   <figure class="card-img-top position-relative mb-7 overflow-hidden " >
				   <a href="p_selectOne.do?p_num=\${vo2.p_num}" class="hover-zoom-in d-block" title="Shield Conditioner">
		    <img src="#" data-src="resources/uploadimg/\${vo2.p_pic1}" class="img-fluid lazy-image w-100" alt="\${vo2.p_name}"  style="width: 200px; height: 200px;">
			</a>
			   </figure>
			   <div class="card-body text-center p-0">
			<span class="d-flex align-items-center price text-body-emphasis fw-bold justify-content-center mb-3 fs-6">
		        <ins class="text-decoration-none">\${vo2.price}원</ins></span>

				   <h4 class="product-title card-title text-primary-hover text-body-emphasis fs-15px fw-500 mb-3"><a class="text-decoration-none text-reset" href="p_selectOne.do?p_num=\${vo2.p_num}">\${vo2.p_name}</a></h4>
				   <div class="d-flex align-items-center fs-12px justify-content-center">
			<span class="reviews ms-4 pt-3 fs-14px">\${vo2.p_viewcount} views</span>
			</div>
			   </div>
		</div>
		</div>
          `;
        }
        
        $("#productList").html(tag_vo2);
      },
      error: function(xhr, status, error) {
        console.log('xhr.status:', xhr.status);
      }
    });
    
    $.ajax({
      url: "json_new_select8.do",
      method: 'GET',
      dataType: 'json', 
      success: function(data) {
        console.log(data);
        let tag_vo2 = "";
        for (let i = 0; i < data.length; i++) {
          let vo2 = data[i];
          tag_vo2 += `
        	  <div class="col-lg-4 col-xl-3 col-sm-6">
				<div class="card card-product grid-1 bg-transparent border-0">
			   <figure class="card-img-top position-relative mb-7 overflow-hidden " >
				   <a href="p_selectOne.do?p_num=\${vo2.p_num}" class="hover-zoom-in d-block" title="Shield Conditioner">
		    <img src="#" data-src="resources/uploadimg/\${vo2.p_pic1}" class="img-fluid lazy-image w-100" alt="\${vo2.p_name}"  style="width: 200px; height: 200px;">
			</a>
			   </figure>
			   <div class="card-body text-center p-0">
			<span class="d-flex align-items-center price text-body-emphasis fw-bold justify-content-center mb-3 fs-6">
		        <ins class="text-decoration-none">$\${vo2.price}</ins></span>

				   <h4 class="product-title card-title text-primary-hover text-body-emphasis fs-15px fw-500 mb-3"><a class="text-decoration-none text-reset" href="p_selectOne.do?p_num=\${vo2.p_num}">\${vo2.p_name}</a></h4>
				   <div class="d-flex align-items-center fs-12px justify-content-center">
			<span class="reviews ms-4 pt-3 fs-14px">\${vo2.p_viewcount} reviews</span>
			</div>
			   </div>
		</div>
		</div>
          `;
        }
        
        $("#productList2").html(tag_vo2);
      },
      error: function(xhr, status, error) {
        console.log('xhr.status:', xhr.status);
      }
    });
  });

</script>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>

