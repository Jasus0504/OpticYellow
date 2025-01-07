<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>

<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    //.............
    
    console.log("onload...");
    $.ajax({
        url : "json_b_high.do",
        data:{p_num:${param.p_num}},
        method:'GET',
        dataType:'json', 
        success : function(vo2) {
            // console.log('ajax...success:', vo2);//[{},{}]
            console.log(vo2.p_num,vo2.start_price);
            
            var BuyerInfoLink = document.getElementById("buyerInfoLink");
            BuyerInfoLink.href = "cs_selectOne.do?p_num=" + vo2.p_num;
            BuyerInfoLink.innerText = "구매자 정보 확인하기"
            
            let tag_vo2 =  `
                <tr>
                <td>\${vo2.p_name}</td>
                    <td>\${vo2.cat}</td>
                    <td>\${vo2.seller}</td>
                    <td>\${vo2.buyer}</td>
                    <td>\${vo2.price}</td>
                    <td>
                        <img width="35px" src="resources/uploadimg/thumb_\${vo2.p_pic1}">
                    </td>
                </tr>            
            `;
            
            $("#vo2").html(tag_vo2);
               
            
            $("#p_num").val(vo2.p_num);
            
            AlreadyConfirm(vo2.s_granted);
           
        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });

 
});


function goFinalDicision() {
    var pNum = $("#p_num").val();
    
    if (confirm("상품판매를 확정하시겠습니까?!")) {
    	location.href = "s_p_finalOK.do?p_num=" + pNum;
        alert("상품판매가 확정되었습니다. 구매자의 확정현황은 ~에서 확인하실 수 있습니다.");
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
	<h1>최종판매</h1>

	<table id="memberList">
		<thead>
			<tr>
				<th>이름</th>
				<th>카테고리</th>
				<th>판매자</th>	
				<th>구매자</th>
				<th>최종가격</th>
				<th>사진</th>
			</tr>
		</thead>
		<tbody id="vo2">
		</tbody>
	</table>
	
<h6>최종확인 시 취소가 불가능하며,구매자가 동의하였을 경우 나의 거랙목록 페이지에서 주소 및 전화번호를 확인할 수 있습니다.</h6>
<td><input id="p_num" name="p_num" type="hidden"></td>
	<button onclick="goFinalDicision()" class="FinalButton" id="FinalButton">최종확인하기</button>
	<h5><a id="buyerInfoLink" href="#">구매자 정보 확인하기</a></h5>
</body>
</html>
