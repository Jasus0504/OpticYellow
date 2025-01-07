<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/qna/qnaOne.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function on(){
		let q_writer = '${vo2.q_writer}';
		
		if('${user_id}'===q_writer){
			$("#q_up_del").show();
		} else if('${user_id}'!==q_writer){
			$("#q_up_del").hide();
		}
		
	}

</script>
</head>
<body onload="on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<br>

	<main class="container">
		<div class="d-flex justify-content-between">
		<span class="fs-2 align-self-center"><strong>${vo2.q_title}</strong></span>
		<span class="small align-self-center"><a href="qna_selectAll.do">목록보기</a></span>
		</div>
		
		<table style="width:100%">
			<tr>
				<td style="width:7%;"><img src="resources/uploadimg/${vo2.m_img}" id="imgSrc" class="my-auto"></td>
				<td style="width:73%;">
					<div class="w-100 p-2">
						<span class="text-gray-dark fs-4">${vo2.q_writer}</span>
						<span class="d-block small lh-base">${vo2.formatted_q_date}</span>
					</div>						
				</td>
			</tr>
		</table>
		<hr>
		<br>
		
		<p>${vo2.q_content}</p>
		
		<div class="d-flex flex-row-reverse mx-2">
			<div id="q_up_del">
				<a href="qna_update.do?q_num=${param.q_num}" style="color:#777777;">글수정</a>
				<a href="qna_deleteOK.do?q_num=${param.q_num}" style="color:#777777;">글삭제</a>
			</div>
		</div>		
		<hr>
		<br>
		
		<c:forEach var="answer" items="${answer}">
			<div class="card mb-3">
				<div class="card-header">
					<strong>1:1 문의 답변</strong>
				</div>
				<div class="card-body">
					<table style="width:100%">
						<tr>
							<td>
								<div class="w-100">
									<span class="text-gray-dark fs-5">${answer.qa_writer}</span>
									<span class="d-block small lh-base">${answer.formatted_qa_date}</span>
								</div>						
							</td>
						</tr>
					</table>
					<hr>				
					<p class="card-text">${answer.qa_content}</p>
				</div>
			</div>			
		</c:forEach>
		<br>			
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</body>
</html>