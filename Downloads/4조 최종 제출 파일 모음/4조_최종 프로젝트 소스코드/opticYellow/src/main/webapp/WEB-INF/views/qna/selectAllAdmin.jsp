<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/qna/qnaList.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function on(){
		window.onpageshow = function(event) {
			  /* 페이지가 뒤로 이동한 경우에만 실행 > 조회수,댓글수,추천수, update
			  event.persisted 속성은 페이지가 뒤로 이동되어
			  이전 페이지의 캐시에서 로드된 경우 true */
			  if (event.persisted) {
			    location.reload();
			  }
		};
	}
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
	
		var url = "qna_selectAllAdmin.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......
	
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
	
		var url = "qna_selectAllAdmin.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	} // end fn_pagination()......
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
	
		var url = "qna_selectAllAdmin.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
</script>
</head>
<body onload="on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div style="height:1000px;">
	<br>
	<main class="container">	
		<div class="d-flex justify-content-end mb-3">
			<span class="small align-self-center"><a href="qna_selectAllAdmin.do">1:1 문의 관리</a></span>
		</div>
	
		<table class="table">
			<thead>
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td scope="col" class="col-1-w"><img src="resources/uploadimg/${vo.m_img}" id="imgSrc" class="my-auto"></td>
						<td scope="col" class="col-2-w">${vo.q_writer}</td>
						<td scope="col" class="col-3-w" style="text-align: left;">
							<div class="w-100 p-2">
								<a href="qna_selectOneAdmin.do?q_num=${vo.q_num}">
									<span class="text-gray-dark">${vo.q_title}</span>
									<span class="d-block small lh-base">${vo.formatted_q_date}</span>
								</a>
							</div>						
						</td>
					</tr>
				</c:forEach>				
			</thead>
		</table>	
	
		<!-- pagination{s} -->
	
		<div id="paginationBox">
			<ul class="pagination d-flex justify-content-center">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" role="button" onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">Previous</a></li>
				</c:if>
	
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}')"> ${idx} </a></li>
				</c:forEach>
	
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" role="button" onClick="fn_next('${pagination.range}','${pagination.range}','${pagination.rangeSize}')" >Next</a></li>
				</c:if>
			</ul>
		</div>
	
		<!-- pagination{e} -->	
	</main>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>