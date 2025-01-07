<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/css/mypage/list2.css" rel="stylesheet"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<style>
body {
	background-color: #F8F9FA !important;
}

.btn.sale {
	background-color: #3C7DEF; /* 판매 내역 버튼 배경색 */
	color: #FFFFFF; /* 판매 내역 버튼 글자색 */
}

.btn.buy {
	background-color: #3C7DEF; /* 구매 내역 버튼 배경색 */
	color: #FFFFFF; /* 구매 내역 버튼 글자색 */
}

.btn.sale.active {
	background-color: #1061D9 !important; /* 판매 내역 버튼 선택시 배경색 */
}

.btn.buy.active {
	background-color: #1061D9 !important; /* 구매 내역 버튼 선택시 배경색 */
}

#list-base {
	margin-bottom: 1.5%
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 10px;
	margin-top: 30px;
}

.b-example-divider {
	height: 15rem !important;
}

.group_back {
	background-color: #F8F9FA !important;
	padding: 0.7% 0.7% 0.1% 0.7% !important;
}

main{
	margin-top:1.5%;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function formatDateTime(dateTime) {
    var date = new Date(dateTime);
    var year = date.getFullYear().toString();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    var hours = ('0' + date.getHours()).slice(-2);
    var minutes = ('0' + date.getMinutes()).slice(-2);
    var formattedDateTime = year.slice(-2) + '/' + month + '/' + day + ' ' + hours + ':' + minutes;
    return formattedDateTime;
}

function buy_list() {
	
	
	// 구매 내역 버튼 선택 및 판매 내역 버튼 선택 해제
    $(".btn.buy").removeClass("active");
    $(".btn.sale").addClass("active");
    
    console.log("buy_list()...");
    var buyer = "${user_id}";
    console.log(buyer);

    $.ajax({
        url: "json_auction_buy_list.do",
        data: {
            buyer: buyer
        },
        method: 'GET',
        dataType: 'json',

        success: function (arr) {
            console.log('ajax...success:', arr);
            let auction_list = '';
            let auction = `            
			            <div class="p-2 justify-content-center" style="width: 25%; text-align: center; font-weight: bolder;">
						<a href="#" class="text-gray-dark"></a>
					</div>
					<div class="p-2 justify-content-center" style="width: 25%; text-align: center; font-weight: bolder;">
						<a href="#" class="text-gray-dark">상품 이름</a>
					</div><span>|</span>
					<div class="p-2 justify-content-center" style="width: 25%; text-align: center; font-weight: bolder;">
						<a href="#" class="text-gray-dark">입찰 일자</a>
					</div><span>|</span>
					<div class="p-2 justify-content-center" style="width: 25%; text-align: center; font-weight: bolder;">
						<a href="#" class="text-gray-dark">입찰 가격</a>
					</div>`;
          
            $.each(arr, function (index, vo) {
                var bidTime = formatDateTime(vo.bid_time);
                auction_list += `
					 			<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
					 				<div class="d-flex flex-row text-body-secondary justify-content-center align-items-center">
					 					<div class="p-2 justify-content-center" style="width: 25%; text-align: center; font-weight: bolder;">
					 						<a href="#" class="text-gray-dark">🧾</a>
					 					</div>
					 					<div class="p-2 justify-content-center" style="width: 25%; text-align: center;">
					 						<a href="#" class="text-gray-dark">\${vo.p_name}</a>
					 					</div>
					 					<div class="p-2 justify-content-center" style="width: 25%; text-align: center;">
					 						<a href="#" class="text-gray-dark">\${bidTime}</a>
					 					</div>
					 					<div class="p-2 justify-content-center" style="width: 25%; text-align: center;">
					 						<a href="#" class="text-gray-dark">\${vo.price}</a>
					 					</div>
					 				</div>
					 			</div>
					 		`;
					            });
			
            $("#auction").html(auction);
            $("#auction_list").html(auction_list);
        },
        error: function (xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
}

function sale_list() {

	// 판매 내역 버튼 선택 및 구매 내역 버튼 선택 해제
    $(".btn.sale").removeClass("active");
    $(".btn.buy").addClass("active");
    
    console.log("sale_list()...");
    var user_id = "${user_id}";
    console.log(user_id);
    $.ajax({
        url: "json_b_sold_list.do",
        data: {
        	user_id: user_id
        },
        method: 'GET',
        dataType: 'json',
        success: function (arr) {
            console.log('ajax...success:', arr);
            let auction_list = '';
            let auction = `        
			            <div class="p-2 justify-content-center" style="width: 20%; text-align: center; font-weight: bolder;">
							<a href="#" class="text-gray-dark" ></a>
						</div>
			            <div class="p-2 justify-content-center" style="width: 20%; text-align: center; font-weight: bolder;">
							<a href="#" class="text-gray-dark" >상품 이름</a>
						</div><span>|</span>
						<div class="p-2 justify-content-center" style="width: 20%; text-align: center; font-weight: bolder;">
							<a href="#" class="text-gray-dark">경매 시작 시간</a>
						</div><span>|</span>
						<div class="p-2 justify-content-center" style="width: 20%; text-align: center; font-weight: bolder;">
							<a href="#" class="text-gray-dark">경매 마감 시간</a>
						</div><span>|</span>
						<div class="p-2 justify-content-center" style="width: 20%; text-align: center; font-weight: bolder;">
							<a href="#" class="text-gray-dark">최종 응찰 가격</a>
						</div>`;
            
            $.each(arr, function (index, vo) {
                var insertTime = formatDateTime(vo.p_insert_time);
                var deadLine = formatDateTime(vo.dead_line);
                auction_list += `
				 			<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
				 				<div class="d-flex flex-row text-body-secondary justify-content-center align-items-center">
				 					<div class="p-2 justify-content-center" style=" width: 20%; text-align: center; font-weight: bold;">
				 						<a href="#" class="text-gray-dark">🛒</a>
				 					</div>
				 					<div class="p-2 justify-content-center" style="width: 20%; text-align: center;">
				 						<a href="#" class="text-gray-dark">\${vo.p_name}</a>
				 					</div>
				 					<div class="p-2 justify-content-center" style="width: 20%; text-align: center;">
				 						<a href="#" class="text-gray-dark">\${insertTime}</a>
				 					</div>
				 					<div class="p-2 justify-content-center" style="width: 20%; text-align: center;">
				 						<a href="#" class="text-gray-dark">\${deadLine}</a>
				 					</div>
				 					<div class="p-2 justify-content-center" style="width: 20%; text-align: center;">
				 						<a href="#" class="text-gray-dark">\${vo.price}</a>
				 					</div>
				 				</div>
				 			</div>
				 		`;
				     });
 			
 			$("#auction").html(auction);
            $("#auction_list").html(auction_list);
        },
        error: function (xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
}

</script>


</head>
<body onload="buy_list()">
	<jsp:include page="../top_menu.jsp"></jsp:include>



	<main class="container">
		<div class="container">
			<nav aria-label="breadcrumb" class="breadcrumb-container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
					<li class="breadcrumb-item active" aria-current="page">거래내역</li>
				</ol>
			</nav>
		</div>
		<button type="button" class="btn btn-primary btn-lg sale"
			onclick="buy_list();">구매 내역</button>
		<button type="button" class="btn btn-primary btn-lg buy"
			onclick="sale_list(); ">판매 내역</button>
	</main>

		<main class="container group_back">
			<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
				<div id="auction"
					class="d-flex flex-row text-body-secondary justify-content-between align-items-center"
					style="height: 15px !important;"></div>
			</div>

			<div id="auction_list"></div>
		</main>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</body>
</html>