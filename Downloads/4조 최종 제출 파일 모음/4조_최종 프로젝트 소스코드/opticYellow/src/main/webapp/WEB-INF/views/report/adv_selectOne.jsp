<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css" rel="stylesheet">
<link href="resources/Jae/css/bootstrap.css.map" rel="stylesheet">
<link rel="stylesheet" href="resources/Jae/css/Normal.css" />	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    console.log("onload...");
    $.ajax({
        url : "json_r_selectOne.do",
        data: {r_num: ${param.r_num}},
        method: 'GET',
        dataType: 'json', 
        success : function(vo2) {
			console.log('ajax...success:', vo2);
			$('#r_name').text(vo2.r_name);
			$('#r_info').val(vo2.r_info);
			$('#r_reporter').val(vo2.r_reporter);
			$('#r_reason').val(vo2.r_reason);
			$('#p_num').val(vo2.p_num);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});
});
</script>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
		<main class="form-signin w-50 m-auto">
			<div class="py-5 text-center">
				<h1>신고 답변<br></h1>
			</div>	
				<form name="frm" action="adv_r_insertOK.do" method="post"
					onsubmit="return fn_action()" enctype="multipart/form-data">
				<div class="mb-3 row">
						<span class="notice">신고사유</span>
						<div class="col">
							<input type="text" class="form-control" id="r_reason" name="r_reason" value="" disabled>
						</div>				
						</div>									
					<br>
					<div class="mb-3 row">
						<span class="notice">신고제목</span>
						<div class="col">
							<textarea class="form-control" placeholder="신고제목" id="r_name" name="r_name" style="height: 50px" disabled></textarea>
						</div>				
					</div>
					<div class="form-floating">
						<span class="notice">신고내용</span>
						<textarea class="form-control" placeholder="신고내용" id="r_info" name="r_info" style="height: 100px" disabled></textarea>
					</div>
					<br>
					<div class="form-floating">
						<span class="notice">신고답변</span>
						<textarea class="form-control" placeholder="신고답변" id="r_answer" name="r_answer" style="height: 100px"></textarea>
					</div>																					
					<div>
						<label for="r_num"></label>
						<input id="r_num" name="r_num" type="hidden" value="${param.r_num}">											
					</div>
					<br>
					<input class="btn btn-primary w-100 py-2" type="submit" value="신고 답변" style="margin-bottom:10%">																																									
				</form>
				</main>
</body>


</html>
