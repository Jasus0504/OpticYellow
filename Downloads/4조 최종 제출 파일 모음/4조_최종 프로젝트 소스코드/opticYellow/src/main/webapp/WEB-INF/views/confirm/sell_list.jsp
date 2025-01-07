<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/List.css" />


<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    console.log("onload...");
    var user_id = '<%= session.getAttribute("user_id") %>';
    console.log(user_id);
    $.ajax({
        url: "json_searchSeller.do",
        data: { seller: '${param.seller}' },: '${param.buyer}' },
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
            let tag_vo2 = ""; // tag_vo2 변수를 반복문 외부에서 미리 선언
            let currentDate = new Date();
            
            for (let i = 0; i < vo2.length; i++) {
let 	deadLine = new Date(vo2[i].dead_line); // 마감 시간을 Date 객체로 변환
                
                let buttonDisabled = deadLine < currentDate ? '' : 'disabled'; // 현재 시간과 마감 시간 비교하여 버튼의 disabled 속성 값 설정
                
                tag_vo2 += `
                
                	<main class="container">	
            		<div class="mx-auto p-3 bg-body rounded shadow-sm list-item" id="list-base">
            			<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
            				<img src="resources/uploadimg/\${vo2[i].p_pic1}" id="imgSrc" class="my-auto">
            				<div class="flex-wrap p-2 fs-6 justify-content-center" style="width:20%; text-align:center;">
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="text-gray-dark"><strong> \${vo2[i].p_num}</strong></a>
            				</div>
            				<div class="p-2 fs-6 justify-content-between" style="width:47%; display:flex; justify-content:center;">
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">물품명: \${vo2[i].p_name}</a>
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">입찰일자: \${vo2[i].bid_time}</a>
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">입찰 가격: \${vo2[i].price}</a>
            					<button \${buttonDisabled} onclick="window.location.href='final_buy_decision.do?p_num=\${vo2[i].p_num}'">입찰확정하러 가기</button>
            				</div>            				
            			</div>
            		</div>
            	</main>
            	<br>
            	
                `;
            }
            
            $("#vo2").html(tag_vo2); // 반복문 내부에서 테이블에 추가
            
        },
        error: function(xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
});
</script>
</head>
<body>
<h3>나의 입찰 목록</h3>
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
