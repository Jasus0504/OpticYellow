<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매목록</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/List.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    console.log("onload...");
    var user_id = '<%= session.getAttribute("user_id") %>';
    console.log(user_id);
    $.ajax({
        url: "json_b_sell_list.do",
        data: { user_id: user_id },
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
            let tag_vo2 = ""; // tag_vo2 변수를 반복문 외부에서 미리 선언
            let currentDate = new Date();
            	   if (vo2.length === 0) {
            	        tag_vo2 = "<div class='text-center'>판매물품이 없습니다.</div>" +
            	                  "<div class='text-center'><img width='350px' src='resources/Jae/images/empty_box.png'></div>" +
            	                  "<div class='text-center'><button onclick='goInsert()' class='myButton'>용품 판매하기</button></div>";
            	    }else {
            
            for (let i = 0; i < vo2.length; i++) {            	
            	let deadLine = new Date(vo2[i].dead_line); // 마감 시간을 Date 객체로 변환
                
            /* 	console.log(currentDate, deadLine);
            	console.log(vo2[i].low, vo2[i].price); */
            	let buttonDisabled = (deadLine > currentDate || vo2[i].low > vo2[i].price) ? 'disabled' : '';
	
                tag_vo2 += `
                
                	<main class="container">	
            		<div class="mx-auto p-3 bg-body rounded shadow-sm list-item" id="list-base">
            			<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
            				<img src="resources/uploadimg/\${vo2[i].p_pic1}" id="imgSrc" class="my-auto">
            				<div class="flex-wrap p-2 fs-6 justify-content-center" style="width:20%; text-align:center;">
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="text-gray-dark"><strong> 제목: \${vo2[i].p_name}</strong></a>
            				</div>
            			
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 3; text-align: center;">경매시작 <br> \${vo2[i].fp_insert_time}</a>        
            					<br><br>
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 3; text-align: center;">경매마감 시간 <br> \${vo2[i].fdead_line}</a>            				
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 3; text-align: center;">최저거래 금액 <br> \${vo2[i].low}</a>            				
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 3; text-align: center;">현재최고가 <br> \${vo2[i].price}</a>
            					<button \${buttonDisabled} onclick="openPopup('final_sell_decision.do?p_num=\${vo2[i].p_num}')"style="width: 120px; height: 60px;">판매확정 가기</button>
            					<button \${buttonDisabled} onclick= "BuyerInfo(\${vo2[i].p_num}, '\${vo2[i].s_granted}')" style="width: 120px; height: 60px;">구매자정보 확인</button>
                                </tr> 
            			           				
            			</div>
            		</div>
            	</main>
            	<br>
            	
                `;
            }
            
            }
            
            $("#vo2").html(tag_vo2); // 반복문 내부에서 테이블에 추가
            
        },
        error: function(xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
});

function BuyerInfo(p_num, s_granted) {
if (s_granted !== "Ok") {
	 alert("판매자 정보를 확인하시기 위해서는 먼저 최종판매를 확정 하셔야 합니다.");
	 console.log(p_num,s_granted);	
	return; // 경고 메시지 표시
	 } else {
		 openPopup('cs_selectOne.do?p_num='+ p_num);
}
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
	
	
function goInsert() {
    	location.href = "p_insert.do";
}
</script>
</head>
<body>
<h3>나의 판매 목록</h3>
<br>

        <div id="vo2">
        </div>
           
</body>
<style>
h3 {
  text-align: center;
}
</style>
</html>
