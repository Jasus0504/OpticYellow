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
<title>OpticYellow</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



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
<jsp:include page="../AuctionRest/AuctionTopbar.jsp"></jsp:include> <!-- Head -->
	<main id="content" class="wrapper layout-page">
		<section class="page-title z-index-2 position-relative">
    
    
    
    </div><div class="text-center py-13">
        <div class="container">
            <h2 class="mb-0">거래 가능 물품</h2></div>
    </div>
</section>
<!-- 미니사이드 바 -->
<div class="container container-xxl pb-16 pb-lg-18">
    <div class="row">
        <div class="col-lg-3">
            <jsp:include page="../AuctionRest/AuctionSidebar.jsp"></jsp:include>
        </div>
        <div class="col-lg-9 order-lg-1">
            <div class="row" id="productList">
            </div>
        </div>
    </div>
</div>

                     
        </div>
        <div class="col-lg-3 d-lg-block d-none">
			<div class="position-sticky top-0">
			
		



			</div>
        </div>
    </div>
</div>



</main>
	
	
<jsp:include page="../AuctionRest/AuctionFooter.jsp"></jsp:include> <!-- Footer -->
<jsp:include page="../AuctionRest/AuctionListRest.jsp"></jsp:include>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

var searchKey = "${param.searchKey}";
var searchWord = "${param.searchWord}";

$(function(){
	console.log("onload...");
	
	$.ajax({
		url: "json_p_searchList.do",
		data: { searchKey: searchKey, searchWord: searchWord },
		method: 'GET',
		dataType: 'json', 
		success: function(data) {
			console.log(data);
			let tag_vo2 = "";
			for (let i = 0; i < data.length; i++) {
				let vo2 = data[i];
				let colClass;
				if (i === 0) {
					colClass = "col-sm-6 col-lg-4 col-xl-3";
				} else if (i === data.length - 1) {
					colClass = "col-sm-6 col-lg-4 col-xl-3";
				} else {
					colClass = "col-sm-6 col-lg-4 col-xl-3";
				}
				tag_vo2 += `
					<div class="\${colClass}">
						<div class="card card-product grid-2 bg-transparent border-0" data-animate="fadeInUp">
							<figure class="card-img-top position-relative mb-7 overflow-hidden">
								<a href="p_selectOne.do?p_num=\${vo2.p_num}" class="hover-zoom-in d-block" title="\${vo2.p_name}">
									<img src="#" data-src="resources/uploadimg/\${vo2.p_pic1}" class="img-fluid lazy-image w-100" alt="\${vo2.p_name}" style="width: 200px; height: 200px;">
								</a>
								<div class="position-absolute d-flex z-index-2 product-actions  vertical"></div>
							</figure>
							<div class="card-body text-center p-0">
								<span class="d-flex align-items-center price text-body-emphasis fw-bold justify-content-center mb-3 fs-6">\${vo2.price}원</span>
								<h4 class="product-title card-title text-primary-hover text-body-emphasis fs-15px fw-500 mb-3"><a class="text-decoration-none text-reset" href="p_selectOne.do?p_num=\${vo2.p_num}">\${vo2.p_name}</a></h4>
								<div class="d-flex align-items-center fs-12px justify-content-center">
									<div class="rating">
										<div class="empty-stars"></div>
									</div>
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
});
	

</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

</html>
