<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>수정 완료</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<br><br><br><br><br><br><br>
	<p class="text-center fs-1 align-middle mb-5">테니스장 정보가 수정되었습니다.</p>
	<div class="d-grid col-2 mx-auto">
  <a href="index.do" class="btn btn-primary" role="button">홈으로</a>
</div>
<br><br><br><br>
<jsp:include page="../footer.jsp"></jsp:include>
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>