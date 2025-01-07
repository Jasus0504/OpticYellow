<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>예약 완료</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<br><br><br><br><br>
	<p class="text-center fs-1 align-middle mb-5">코트 예약에 성공하였습니다.</p>
	<br><br>
	<p class="text-center fs-1 align-middle mb-5">이 페이지는 잠시 후에 닫힙니다</p>
	<br><br><br>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		window.onload = function() {
			setTimeout(function() {
				window.close();
			}, 2000);
		}
	</script>
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>
