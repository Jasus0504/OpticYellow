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
    $.ajax({
        url: "C_SELECTLIST_SELLER_INFO.do",
        data:{p_num:${param.p_num}},
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
        console.log(vo2.b_granted,vo2.buyer);
        
        if(vo2.b_granted == 'Ok'){
            let tag_vo2 =  `            										
					<br>
            	<div class="py-5 text-center">
				<h1>구매자 정보<br></h1>
			</div>	
					<div class="mb-3 row">
						<span class="notice">구매자 ID</span>
						<div class="col">
						<textarea class="form-control" placeholder="신고내용" style="height: 100px" disabled>\${vo2.buyer}</textarea>
						</div>				
					</div>
					<div class="form-floating">
					<span class="notice">전화번호</span>
						<textarea class="form-control" placeholder="신고내용" id="r_info" name="r_info" style="height: 100px" disabled>\${vo2.tel}</textarea>
					</div>
					<br>	
					
					<div class="form-floating">
					<span class="notice">배송주소</span>	
				    <textarea class="form-control" id="r_answer" name="r_answer" style="height: 80px" disabled>\${vo2.addr}</textarea>
				</div>																					
                `;
        
            
            $("#vo2").html(tag_vo2); // 반복문 내부에서 테이블에 추가
        }else{
        	 let tag_vo2 =  `            										
					<br>
         	<div class="py-5 text-center">
				<h1>물품 정보<br></h1>
			</div>	
					<div class="mb-3 row">
						<span class="notice">구매자 정보</span>
						<div class="col">
						<textarea class="form-control" placeholder="신고내용" style="height: 100px" disabled>구매자가 아직 최종거래에 동의하지 않았습니다.</textarea>
						</div>				
					</div>
					 `;
				 $("#vo2").html(tag_vo2);
        	
        }
            
            
        },
        error: function(xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
});



</script>
</head>
<body>

	<div id="vo2"></div>
</body>
</html>