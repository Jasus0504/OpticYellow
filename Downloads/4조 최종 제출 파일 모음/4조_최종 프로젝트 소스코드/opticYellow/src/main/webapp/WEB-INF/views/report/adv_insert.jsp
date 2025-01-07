<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
</head>
<body onload="on()" class="d-flex align-items-center py-4 bg-body-tertiary">
		<main class="form-signin w-50 m-auto">
			<div class="py-5 text-center">
				<h1>신고페이지<br></h1>
			</div>	
				<form name="frm" action="adv_r_insertOK.do" method="post"
					onsubmit="return fn_action()" enctype="multipart/form-data">
				<div class="mb-3 row">
						<span class="notice">신고사유</span>
						<select id="r_reason" name="r_reason" class="form-select" aria-label="Default select example">
							<option value="사기의심">사기 의심</option>
						<option value="부적합한 물건">부적합한 물건</option>
						<option value="도배">도배</option>
						</select>	
						</div>									
					<br>
					<div class="mb-3 row">
						<span class="notice">제목</span>
						<div class="col">
							<input type="text" class="form-control" id="r_name" name="r_name" value="">
						</div>				
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="신고내용" id="r_info" name="r_info" style="height: 100px"></textarea>
						<label for="floatingTextarea2">신고내용</label>
					</div>
					<br>																
					<div>
						<label for="p_num"></label>
						<input id="p_num" name="p_num" type="hidden" value="${param.p_num}">											
					</div><div>
						<input id="r_reporter" name="r_reporter" value="${user_id}" type="hidden">
					</div>
					<br>
					<input class="btn btn-primary w-100 py-2" type="submit" value="회원 가입" style="margin-bottom:10%">																																									
				</form>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    console.log("onload...");
    $.ajax({
        url : "json_r_selectOne.do",
        data: {p_num: ${param.p_num}},
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
</html>
