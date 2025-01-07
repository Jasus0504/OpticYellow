<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내용</title>
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
        url: "json_r_selectOne.do",
        data: { r_num: '${param.r_num}' },
        method: 'GET',
        dataType: 'json',
        success: function(vo2) {
        console.log(vo2);
        console.log('확인좀');
            let tag_vo2 =  `            										
					<br>
            	<div class="py-5 text-center">
				<h1>나의 신고<br></h1>
			</div>	
					<div class="mb-3 row">
						<span class="notice">신고 제목</span>
						<div class="col">
						<textarea class="form-control" placeholder="신고내용" style="height: 100px" disabled>\${vo2.r_name}</textarea>
						</div>				
					</div>
					<div class="form-floating">
					<span class="notice">신고 내용</span>
						<textarea class="form-control" placeholder="신고내용" id="r_info" name="r_info" style="height: 100px" disabled>\${vo2.r_info}</textarea>
			
					</div>
					<br>	
					
					<div class="form-floating">
					<span class="notice">신고 답변</span>
				    <textarea class="form-control" id="r_answer" name="r_answer" style="height: 200px" disabled>\${vo2.r_answer}</textarea>
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