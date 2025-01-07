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
<title>응찰페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="resources/Jae/assets/vendors/lightgallery/css/lightgallery-bundle.min.css">
<link rel="stylesheet"
	href="resources/Jae/assets/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/Jae/assets/vendors/animate/animate.min.css">
<link rel="stylesheet"
	href="resources/Jae/assets/vendors/slick/slick.css">
<link rel="stylesheet"
	href="resources/Jae/assets/vendors/mapbox-gl/mapbox-gl.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/assets/css/theme.css">

<%-- <jsp:include page="../css.jsp"></jsp:include> --%>
</head>
<body>
	<jsp:include page="../AuctionRest/AuctionTopbar.jsp"></jsp:include>
	<!-- Head -->

	<main id="content" class="wrapper layout-page">
		<section class="z-index-2 position-relative pb-2 mb-12"></section>

		<section class="container container-xxl pt-6 pb-13 pb-lg-20">

			<div id="product"></div>

		</section>


	</main>



	<jsp:include page="../AuctionRest/AuctionFooter.jsp"></jsp:include>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<jsp:include page="../AuctionRest/AuctionSelectOneRest.jsp"></jsp:include>

	<table id="memberList">

	</table>

</body>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	let dline;
	let insert_time;
	let highPriceValue;
    let startPriceValue;
	let seller;
	let buyer;
	let low;
	$(function(){
	    console.log("onload...");
	    console.log("${user_id}");
	    $.ajax({
	        url : "json_p_selectOne.do",
	        data: { p_num: ${param.p_num} },
	        method: 'GET',
	        dataType: 'json', 
	        success : function(vo2) {
	            dline = vo2.dead_line;
	    	    console.log(dline);
	            insert_time = vo2.p_insert_time;
	            
	            //그래플 위한 코드 선언 
	            let gdline = new Date(vo2.dead_line);
				let ginsert_time = new Date(vo2.p_insert_time);
				let gcurrentTime = new Date();			
	            
				let timeDiff = gcurrentTime.getTime() - ginsert_time.getTime();
				let value = timeDiff / (gdline.getTime() - ginsert_time.getTime());
				
				var value2 = Math.floor(value * 100) / 100;				
				
				//
	            var endDate = new Date(dline);
	            var formattedEndDate = formatDate(endDate);
	        	console.log(vo2);        
	            let tag_vo2 = `
	                <div class="row">
	                    <div class="col-md-6 pe-lg-13">
	                        <div class="position-sticky top-0">
	                            <div class="row">
	                            
	                            <div id="vertical-slider-thumb">
	                                   	        
	                            <a href="resources/uploadimg/\${vo2.p_pic2}" data-gallery="product-gallery">
	                                <img src="resources/uploadimg/\${vo2.p_pic2}" class="cursor-pointer lazy-image mx-3 mx-xl-0 px-0 mb-xl-7" width="75" height="100" title="" alt="">
	                            </a>	                            
	                            <a href="resources/uploadimg/\${vo2.p_pic3}" data-gallery="product-gallery">
	                                <img src="resources/uploadimg/\${vo2.p_pic3}" class="cursor-pointer lazy-image mx-3 mx-xl-0 px-0 mb-xl-7" width="75" height="100" title="" alt="">
	                            </a>	                            	    
	                        </div>
	                    	
	                                <div class="col-xl-10 ps-xl-8 pe-xl-0 order-0 order-xl-1">
	                                    <div id="vertical-slider-slides">
	                                    <a href="resources/uploadimg/\${vo2.p_pic1}" data-gallery="product-gallery">
	                                    <img src="resources/uploadimg/\${vo2.p_pic1}" width="400" height="400" title="">	                                    
	                                </a>		                                    
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="col-md-6 pt-md-0 pt-10">
	                        <p class="d-flex align-items-center mb-6">
	                            <span class="badge text-bg-primary fs-6 fw-semibold ms-7 px-6 py-3">현재가격: \${vo2.price}원</span>
	                        </p>
            <h1 class="mb-4 pb-2 fs-4">\${vo2.p_name}</h1>
            <div class="d-flex align-items-center fs-15px mb-6">
                <p class="mb-0 fw-semibold text-body-emphasis">상태</p>
                <div class="d-flex align-items-center fs-12px justify-content-center mb-0 px-6 rating-result">
                    <div class="rating">
                    </div>
                </div>
                <a href="#" class="border-start ps-6 text-body">사용감 살짝!</a>
            </div>
            <div class="button-container" style="display: flex;">
            <button onclick="goToEditPage(\${vo2.price})" class="myButton" id="editPage">수정하기</button>
            <button onclick="goToDeletePage()" class="myButton" id="deletePage">삭제하기</button>
            <button onclick="goFinalDicision(\${vo2.p_num})" class="FinalButton" id="FinalButton">최종확인하기</button>
            <button onclick="reportProduct()" class="ReportButton" id="ReportButton">신고하기</button>
        </div>
        
            
          
            <div class="card border border-2 border-primary rounded mb-8">
                <div class="card-body py-6 px-9">
                    <div class="d-flex align-items-center">
                        <img src="resources/Jae/assets/images/shop/product-info-fire.jpg" alt="hot">
                        <p class="fs-4 text-body-emphasis fw-semibold mb-0 ms-4 ps-2">응찰 마감시간까지</p>
                    </div>
                    <p class="card-text mb-3">\${vo2.p_viewcount} 조회</p>
                    
                	
                    <div class="countdown d-flex flex-wrap align-items-center text-primary fw-semibold mb-2 pb-4" data-countdown="true" data-countdown-end="\${formattedEndDate}">
                    <p class="fs-4 text-body-emphasis fw-semibold mb-0 ms-4 ps-2">경매가 종료되었습니다</p>
                </div>
                
                
                <div class="progress mb-4 bg-border-color box-shadow-none" style="height: 8px;">
                <div id="ProgressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>

            </div>
                </div>
            </div>            
            
            <form class="pb-8" id="bidForm" action="b_insertOK.do" method="post" onsubmit="return PriceTerm(startPriceValue)" enctype="multipart/form-data">
            <div class="col-sm-8 pt-9 mt-2 mt-sm-0 pt-sm-0">
                <input type="hidden" id="p_num" name="p_num">
                <div class="form-group">
                
                    <label for="price">현재 최고응찰자: \${vo2.buyer}</label>                
                    <input id="price" name="price" class="form-control" placeholder="입찰희망가">

                </div>
                <input type="hidden" id="buyer" name="buyer" value="${user_id}">
                <button type="submit" class="btn-hover-bg-primary btn-hover-border-primary btn btn-lg btn-dark w-100" id="submitButton">응찰하기</button>
            </div>
        </form>
        
        <p class="fs-15px">제품설명: \${vo2.p_info}</p>
            
            
            <nav class="d-flex mt-13 pt-3 justify-content-center" aria-label="pagination">
            </nav>
        </div>
    </div>
			`;
 		const user_id = "${user_id}"; // user_id 값의 변수명을 확인해주세요
    	if (!user_id) {
        tag_vo2 = tag_vo2.replace('id="submitButton"', 'disabled id="submitButton"');
        tag_vo2 = tag_vo2.replace('응찰하기', '로그인이 필요합니다');
    	}
			
				$("#product").html(tag_vo2);
	            
	            var countdownElement = document.querySelector(".countdown");
	            var countdownEnd = countdownElement.getAttribute("data-countdown-end");
	            
	            // countdownEnd 값을 적절한 형식으로 변환하여 countdown 함수를 호출하도록 설정해야합니다.
	            countdown(countdownElement, countdownEnd);
	            
	            startPriceValue = vo2.start_price;
	            checkDate(vo2.dead_line);
	            
	            
	            seller = vo2.seller;
	            low = vo2.low;
	            delete_item();
	            check_id_edit();

	            $("#p_num").val(vo2.p_num);
	            $("#seller").val(vo2.p_num);
	            $("#p_viewcount").text(vo2.p_viewcount);


				let ProgressBar = document.getElementById("ProgressBar");
				ProgressBar.style.width = value2 * 100 + "%";
	            
				
			
				highPriceValue = vo2.price;
				console.log('여기~');
				console.log(vo2.price);
				console.log(highPriceValue);
				
	            buyer = vo2.buyer;

	            $("#currentHighPrice").text(highPriceValue); 
	            
	            updateTimer(dline, seller, buyer, highPriceValue, low);
	            
	            setInterval(function() {
	                updateTimer(deadline);
	            }, 1000);
	        },
	        error:function(xhr, status, error) {
	            highPriceValue = "no"; 
	            console.log(highPriceValue);
	            console.log('xhr.status:', xhr.status);
	            updateTimer(dline, seller, 'nobuyeryet',price, low);
	        }
	    });	    
		    
});
	
	   function PriceTerm(startPriceValue){
	        var inputPriceInput = document.getElementById("price");
	        var inputPrice = inputPriceInput.value;
	        
	        var now = new Date();
	        	       
	        var dline3 = new Date(dline);
	        
	        
	        let start2 = startPriceValue
	       	     
	        if(seller == '${user_id}'){
	        	alert('자신이 올린 물건은 응찰할 수 없습니다.');
	        	return false;
	        }
	        
	        
	        if (highPriceValue < 50000) {
	            if (inputPrice % 1000 !== 0) {
	                alert("천원 단위로 입찰해야 합니다");
	                return false;
	            }
	        } else if (50000 <= highPriceValue && highPriceValue < 100000) {
	            if (inputPrice % 5000 !== 0) {
	                alert("5천원 단위로 입찰해야 합니다");
	                return false;	            
	            }
	        } else if (100000 <= highPriceValue && highPriceValue < 1000000) {
	            if (inputPrice % 10000 !== 0) {
	                alert("만 단위로 입찰해야 합니다");
	                return false;
	            }
	      	  } else if (highPriceValue >= 1000000) {
	            if (inputPrice % 10000 !== 0) {
	                alert("만 단위로 입찰해야 합니다");
	                return false;
	            }
	            
	      	  }
		        
	        if (inputPrice < start2 || inputPrice <= highPriceValue) {
	            if (inputPrice < start2) {
	                alert("경매시작가보다 같거나 큰 값을 입력해야 합니다.");
	            } else if (inputPrice <= highPriceValue) {
	                alert("경매시작가 혹은 현재 최고가보다 더 높은 금액을 입력하셔야 합니다.");
	            }
	            return false; // 함수 종료
	        } else if (now > dline3) {
	            alert("경매 마감 시간을 넘겼습니다. 더 이상 입찰이 불가능합니다.");
	            return false; // 함수 종료
	        } else {
	            alert("요청하신 금액이 성공적으로 등록되었습니다.");
	        }
	    }
			
	

function checkDate(deadlineString2) {
	var currentTime = new Date(); // 현재 시간을 가져옴
	console.log('checkaDate')
	console.log(deadlineString2)
	

	var deadline = new Date(deadlineString2); // deadlineString을 Date 객체로 변환하여 가져옴
	
	
	if (currentTime.getTime() > deadline.getTime()) {
		var submitButton = document.getElementById("submitButton");
		submitButton.disabled = true;
		submitButton.value = "입찰시간이 끝난 상품입니다.";
		alert("이미 입찰 제한시간이 지난 상품입니다.");
	}
}

function goToEditPage(price2) {
	
    var pNum = $("#p_num").val();
    if(startPriceValue == price2){
    	location.href = "p_update.do?p_num=" + pNum;
    }else{
    	alert("입찰이 1회 이상된 상품은 수정이 불가합니다.")
	  }
}

function goToDeletePage() {
    var pNum = $("#p_num").val();
  
    // 사용자에게 확인 알림 표시
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = "p_deleteOK.do?p_num=" + pNum;
        alert("상품이 삭제되었습니다");
    }
}



function goFinalDicision(Pnum) {
    var pNum = Pnum; 

    if(seller == '${user_id}'){
    	openPopup("final_sell_decision.do?p_num=" + pNum);
    }else{
    	openPopup("final_buy_decision.do?p_num=" + pNum);	
    }
}

function reportProduct() {
    var pNum = $("#p_num").val();
    location.href = "r_insert.do?p_num=" + pNum;
}

function updateTimer(dline, seller, buyer, price, low) {
    console.log('updateTimer ready');
    console.log(dline, seller, buyer);
    console.log(price, low);
    var currentDate = new Date();
    var deadline = new Date(dline);

    var timeDiff = deadline.getTime() - currentDate.getTime();
    var days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
    var hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);
    console.log(timeDiff);
   
    // 타이머 종료시
    if(low >= price && timeDiff <= 0 && seller === '${user_id}') {
    	 var newButtonElement = document.getElementById("FinalButton");
    	newButtonElement.textContent = "경매 중단(사유:최저금액 만족 X)";
        newButtonElement.style.backgroundColor = "gray";
        newButtonElement.style.display = "block";
        newButtonElement.disabled = true;
    } else if(timeDiff <= 0 && (seller === '${user_id}' || '${user_id}' === buyer)) {
      var newButtonElement = document.getElementById("FinalButton");
      newButtonElement.style.display = "block"; // 버튼을 보이게 함
      newButtonElement.style.backgroundColor = "red"; // 버튼 배경색을 빨간색으로 변경
      newButtonElement.disabled = false; // 버튼 활성화
    } else if(timeDiff >= 0 && seller === '${user_id}') {
        var newButtonElement = document.getElementById("FinalButton");
        newButtonElement.style.backgroundColor = "gray"; 
        newButtonElement.style.display = "block"; 
        newButtonElement.disabled = true;
    } else {
        var newButtonElement = document.getElementById("FinalButton");
        newButtonElement.style.display = "none"; // 버튼을 숨김
    }

}

//타이머 업데이트 간격 설정 (1초마다 업데이트)
/* setInterval(everysecond, 1000); */


function check_id_edit() {
	  var button = document.getElementById('editPage');
	  if (seller === '${user_id}' || '${role}' === 'ADMIN') {
	    button.style.display = 'block'; // 버튼을 표시
	  } else {
	    button.style.display = 'none'; // 버튼을 숨김
	  }
	}
	
	
function delete_item() {
	  var button = document.getElementById('deletePage');
			  
	  if (seller === '${user_id}'|| '${role}' === 'ADMIN') {
	    button.style.display = 'block'; // 버튼을 표시
	  } else {
	    button.style.display = 'none'; // 버튼을 숨김
	  }
	}
	
/* $(document).on("submit", "form", function(event) {
    event.preventDefault();
    
    // 폼 데이터 가져오기
    var formData = new FormData(this);
    
    // Ajax 요청 보내기
    $.ajax({
        url: "b_insertOK.do",
        method: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            // 요청이 성공한 경우의 처리 로직 작성
        },
        error: function(xhr, status, error) {
            // 요청이 실패한 경우의 처리 로직 작성
        }
    });
}); */

function countdown(element, endTime) {
    var end = new Date(endTime);
    var timerInterval;

    function updateTimer() {
        var current = new Date();
        var diff = end - current;

        if (diff < 0) {
            // 타이머 종료
            clearInterval(timerInterval);
            return;
        }

        var days = Math.floor(diff / (1000 * 60 * 60 * 24));
        var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((diff % (1000 * 60)) / 1000);

        // 타이머 업데이트
        element.innerHTML = "남은 시간: " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
    }

    // 최초 타이머 업데이트 호출
    updateTimer();

    // 1초마다 타이머 업데이트 함수 호출
    timerInterval = setInterval(updateTimer, 1000);
}

function formatDate(date) {
    var months = [
        "January", "February", "March", "April", "May", "June", "July",
        "August", "September", "October", "November", "December"
    ];
    var month = months[date.getMonth()];
    var day = date.getDate();
    var year = date.getFullYear();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();

    var formattedDate = month + " " + day + ", " + year + " " + hours + ":" + minutes + ":" + seconds;
    return formattedDate;
}


function openPopup(url) {
	  // 작은 팝업 창을 열기 위한 윈도우 옵션 설정
	  var width = 400; // 팝업 창의 너비
	  var height = 400; // 팝업 창의 높이
	  var left = (window.innerWidth - width) / 2; // 화면 가운데로 위치
	  var top = (window.innerHeight - height) / 2; // 화면 가운데로 위치
	  var options = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;

	  // 팝업 창 열기
	  window.open(url, '_blank', options);
	}
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>


</html>
