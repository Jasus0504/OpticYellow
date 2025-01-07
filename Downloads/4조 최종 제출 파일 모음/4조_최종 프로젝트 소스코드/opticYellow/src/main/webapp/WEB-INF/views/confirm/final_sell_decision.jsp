<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 정보</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
	rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/Normal.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    console.log("onload...");
    console.log(${param.p_num});
    $.ajax({
        url: "json_b_high.do",
        data: { p_num: ${param.p_num} },
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
        console.log('확인좀');
            let tag_vo2 =  `            										
					<br>
            	<div class="py-5 text-center">
				<h1>물품 정보<br></h1>
			</div>	
					<div class="mb-3 row">
						<span class="notice">물품 정보</span>
						<div class="col">
						<textarea class="form-control" placeholder="신고내용" style="height: 100px" disabled>\${vo2.p_name}</textarea>
						</div>				
					</div>
					<div class="form-floating">
					<span class="notice">구매자</span>
						<textarea class="form-control" placeholder="신고내용" id="r_info" name="r_info" style="height: 100px" disabled>\${vo2.buyer}</textarea>
					</div>
					<br>	
					
					<div class="form-floating">
					<span class="notice">최종가격</span>	
				    <textarea class="form-control" id="r_answer" name="r_answer" style="height: 80px" disabled>\${vo2.price}원</textarea>
				</div>


					<div>
						<label for="p_num"></label>
						<input id="p_num" name="p_num" type="hidden" value="${param.p_num}">											
					</div><div>
						<input id="r_reporter" name="r_reporter" value="${user_id}" type="hidden">
					</div>
					<br>																						
                `;
        
            
            $("#vo2").html(tag_vo2); // 반복문 내부에서 테이블에 추가
            
            let tag_vo3 =  `
                    <tr>
                        <td colspan = "4" >\${vo2.r_answer}</td>
                    </tr>     
                `;
             $("#vo3").html(tag_vo3); 	
             
             AlreadyConfirm(vo2.s_granted);
            
        },
        error: function(xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
});


function goFinalDicision() {
    var pNum = $("#p_num").val();
    
    if (confirm("상품판매를 확정하시겠습니까?!")) {
    	location.href = "s_p_finalOK.do?p_num=" + pNum;
        alert("상품판매가 확정되었습니다.");
        window.close();
    }
}


function RedButton() {
	  // ...

	  // 파이널 버튼에 대한 스타일 적용
	  var buttonElement = document.getElementById("FinalButton");
	  buttonElement.style.backgroundColor = "red"; // 버튼 배경색을 빨간색으로 변경
	  buttonElement.style.color = "#ffffff"; // 글꼴 색상을 흰색으로 변경
	  buttonElement.style.fontFamily = "Arial"; // 글꼴을 Arial로 변경
	  buttonElement.style.fontSize = "16px"; // 글꼴 크기를 16px로 변경
	  buttonElement.style.padding = "10px 20px"; // 내부 여백을 10px 위아래, 20px 좌우로 설정
	  buttonElement.style.border = "none"; // 테두리 없음
	  buttonElement.style.borderRadius = "5px"; // 테두리 모서리를 5px로 설정
	  buttonElement.style.boxShadow = "0px 2px 4px rgba(0, 0, 0, 0.2)"; // 그림자 설정
	  buttonElement.style.cursor = "pointer"; // 커서를 포인터로 변경

	  // ...
	}
	
function AlreadyConfirm(s_confirm){
	console.log(s_confirm)
	var button = document.getElementById('FinalButton');
	if(s_confirm === 'Ok'){
		button.disabled = true;
		button.textContent = "이미 최종구매가 승인된 제품입니다";
	  }else{
		  RedButton();
	  }
		
	}
</script>
</head>
<body>

	<div id="vo2"></div>
	
	<h6>최종확인 시 취소가 불가능하며,구매자가 동의하였을 경우 나의 거랙목록 페이지에서 주소 및 전화번호를 확인할 수 있습니다.</h6>
	<input id="p_num" name="p_num" type="hidden">
	<button onclick="goFinalDicision()" class="FinalButton" id="FinalButton">최종확인하기</button>
</body>
</html>