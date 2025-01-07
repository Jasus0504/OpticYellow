<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/notice/noticeList.css" />

<style>
.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: 0px;
	margin-bottom: 20px;
	margin-top: 20px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function on() {
		window.onpageshow = function(event) {
			/* 페이지가 뒤로 이동한 경우에만 실행 > 조회수,댓글수,추천수, update
			event.persisted 속성은 페이지가 뒤로 이동되어
			이전 페이지의 캐시에서 로드된 경우 true */
			if (event.persisted) {
				location.reload();
			}
		};

		// USER > ADMIN > 비회원 
		if ('${role}' === 'ADMIN') {
			$('#n_in').show();
		} else {
			$('#n_in').hide();
		}

		let searchWord = '${param.searchWord}'

		if (searchWord !== '') {
			$('#paginationBox').html('');
		}
	}

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "n_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_prev()......

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "n_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_pagination()......

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "n_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	} // end fn_next()......
</script>
</head>
<body onload="on()">
	<jsp:include page="../top_menu.jsp"></jsp:include>

	<div class="bg-body-tertiary">
		<br>
		<main class="container">

			<div>
				<nav aria-label="breadcrumb" class="breadcrumb-container">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
						<li class="breadcrumb-item active" aria-current="page">공지사항</li>
					</ol>
				</nav>
			</div>
			<form id="frm" action="n_searchList.do">
				<div class="d-flex flex-row mb-3">
					<div class="input-group" style="width: 20%;">
						<input class="form-control" type="text" name="searchWord"
							id="searchWord" value="" placeholder="제목"
							style="border-top-left-radius: 6px; border-bottom-left-radius: 6px;">
						<input class="btn btn-primary" id="button-addon2" type="submit"
							value="검색">
					</div>
				</div>
			</form>

			<table class="table">
				<thead>
					<c:forEach var="vo" items="${vos}">
						<tr>
							<td scope="col" class="col-1-w"><img
								src="resources/uploadimg/${vo.m_img}" id="imgSrc"
								class="my-auto"></td>
							<td scope="col" class="col-2-w">${vo.n_writer}</td>
							<td scope="col" class="col-3-w" style="text-align: left;">
								<div class="w-100 p-2">
									<a href="n_selectOne.do?n_num=${vo.n_num}"> <span
										class="text-gray-dark">${vo.n_title}</span> <span
										class="d-block small lh-base">${vo.formatted_n_date}</span>
									</a>
								</div>
							</td>
							<td scope="col" class="col-6-w"><div class="content">
									<img src="resources/images/commu/eye.svg"><span>&nbsp;&nbsp;${vo.n_vcount}</span>
								</div></td>
						</tr>
					</c:forEach>
				</thead>
			</table>

			<div class="d-flex justify-content-end mb-3">
				<button id="n_in" class="btn btn-primary btn-xs" type="button"
					onclick="location.href='n_insert.do'">공지사항 등록</button>
			</div>

			<!-- pagination{s} -->

			<div id="paginationBox">
				<ul class="pagination d-flex justify-content-center">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}','${pagination.range}','${pagination.rangeSize}')">Previous</a></li>
					</c:if>

					<c:forEach begin="${pagination.startPage}"
						end="${pagination.endPage}" var="idx">
						<li
							class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
							class="page-link" href="#"
							onClick="fn_pagination('${idx}','${pagination.range}','${pagination.rangeSize}')">
								${idx} </a></li>
					</c:forEach>

					<c:if test="${pagination.next}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_next('${pagination.range}','${pagination.range}','${pagination.rangeSize}')">Next</a></li>
					</c:if>
				</ul>
			</div>

			<!-- pagination{e} -->
		</main>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>