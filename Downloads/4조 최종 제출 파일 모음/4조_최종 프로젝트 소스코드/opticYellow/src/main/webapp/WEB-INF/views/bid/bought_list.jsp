<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응찰목록</title>
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
        url: "json_b_bought_list.do",
        data: { user_id: user_id },
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
        	
        	
        	
            let tag_vo2 = ""; // tag_vo2 변수를 반복문 외부에서 미리 선언
            if (vo2.length === 0) {
                tag_vo2 = "<div class='text-center'>응찰내역이 없습니다.</div>" +
                          "<div class='text-center'><img width='350px' src='resources/Jae/images/empty_box.png'></div>";
            } else {
            
            for (let i = 0; i < vo2.length; i++) {
                tag_vo2 += `                
                	<main class="container">	
            		<div class="mx-auto p-3 bg-body rounded shadow-sm list-item" id="list-base">
            			<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center">
            				<img src="resources/uploadimg/\${vo2[i].p_pic1}" id="imgSrc" class="my-auto">            				
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">물품명: \${vo2[i].p_name}</a>
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">입찰일자: \${vo2[i].bid_time}</a>
            					<a href="p_selectOne.do?p_num=\${vo2[i].p_num}" class="p-2" style="flex: 1; text-align: center;">입찰 가격: \${vo2[i].price}</a>
            				</div>            				
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
</script>
</head>
<body>
<h3>나의 구매 목록</h3>
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
