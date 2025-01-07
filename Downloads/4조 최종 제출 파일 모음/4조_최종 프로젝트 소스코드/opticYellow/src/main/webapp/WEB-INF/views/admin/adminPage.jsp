<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/admin/list-groups.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Optic Yellow</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-start justify-content-center" style="height:600px;">
		<div class="list-group list-group-checkable d-grid gap-2 border-0">
			
			<div class="text-align-center">
				<img src="resources/uploadimg/${m_img}" style="width:80px;border-radius:50%;">
			</div>
			<div class="text-align-center mb-2">
				<span class="fs-5"><strong>관리자 ${user_id}</strong></span>
			</div>
			
			<input class="list-group-item-check pe-none" type="radio" name="listGroupCheckableRadios" id="listGroupCheckableRadios1" value="">
			<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios1" onclick="location.href='memberList.do'"> 회원 관리 </label>			
		
		</div>

		<div class="list-group list-group-checkable d-grid gap-2 border-0">

			<input class="list-group-item-check pe-none" type="radio" name="listGroupCheckableRadios" id="listGroupCheckableRadios2" value="">
			<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios2" onclick="location.href='q_selectAll.do'"> FAQ 관리 </label>

			<input class="list-group-item-check pe-none" type="radio" name="listGroupCheckableRadios" id="listGroupCheckableRadios3" value="">
			<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios3" onclick="location.href='n_selectAll.do'"> 공지사항 관리 </label>

			<input class="list-group-item-check pe-none" type="radio" name="listGroupCheckableRadios" id="listGroupCheckableRadios4" value="">
			<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios4" onclick="location.href='qna_selectAllAdmin.do'"> 1:1 문의 관리 </label>

			<input class="list-group-item-check pe-none" type="radio" name="listGroupCheckableRadios" id="listGroupCheckableRadios5" value="">
			<label class="list-group-item rounded-3 py-3" for="listGroupCheckableRadios5" onclick="location.href='fac_manSelectAll.do'"> 테니스장 관리 </label>

		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	
</body>
</html>