<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.peachmarket.opticyellow.game.model.GameVO"%>

<%
String facId = null;
String floorType = null;
String inOrOut = null;
String conv = null;
String courtPic1 = null;
String courtPic2 = null;
String courtPic3 = null;

GameVO vo2 = (GameVO) request.getAttribute("vo2");

if (vo2 != null) {
	String facName = vo2.getFac_name();

	// facility 테이블에서 정보를 찾는 코드
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		// 데이터베이스 연결 설정
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@database-1.cmz58cmdxttl.ap-northeast-2.rds.amazonaws.com:1521:ORACLE", "admin", "hi123456");

		// 쿼리 실행
		String query = "SELECT * FROM facility WHERE fac_name = ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, facName);
		rs = pstmt.executeQuery();

		// 검색 결과를 사용하여 작업 수행
		if (rs.next()) {
	// 검색 결과에서 필요한 정보 추출
	facId = rs.getString("fac_id");
	floorType = rs.getString("floor_type");
	inOrOut = rs.getString("in_or_out");
	conv = rs.getString("conv");
	courtPic1 = rs.getString("court_pic1");
	courtPic2 = rs.getString("court_pic2");
	courtPic3 = rs.getString("court_pic3");
		}
	} catch (Exception e) {
		// 예외 처리
		e.printStackTrace();
	} finally {
		// 리소스 해제
		if (rs != null) {
	try {
		rs.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
		if (pstmt != null) {
	try {
		pstmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
		if (conn != null) {
	try {
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
	}
}
%>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>selectOne</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">


<script>
	function showConfirmation() {
		alert("신청이 완료되었습니다.");
		// 신청하기 버튼 누른 뒤에 비활성화
		// 		document.getElementById("applyButton").disabled = true;
	}
	document.addEventListener('DOMContentLoaded', function() {
		var myForm = document.getElementById("myForm");
		myForm.addEventListener("submit", function(event) {
			event.preventDefault();

			// 원하는 함수 실행
			kakaoPayReady(this);
		});

		function kakaoPayReady(form) {
			var g_name = $("#g_name").text();
			var g_bill = $("#g_bill").text();

			$.ajax({
				url : "game_kakaoPayReady.do",
				data : {
					item_name : g_name,
					total_amount : g_bill
				},
				method : "POST",
				dataType : "json",
				success : function(data) {
					// 전달받은 data의 결제준비 요청 페이지 링크로 새창 열기
					window.open(data.next_redirect_pc_url);

					// j_insertOK로 폼 전송
					form.action = "j_insertOK.do";
					form.method = "GET";
					form.submit();
				},
				error : function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
	})
</script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
</head>
<body>



	<main class="container">
		<div id="carouselExampleInterval" class="carousel slide"
			data-bs-ride="carousel" data-bs-interval="3000"
			style="position: relative; margin-bottom: 20px; margin-top: 20px; height: 350px;">
			<div class="carousel-inner">
				<%
				if (courtPic1 != null && courtPic2 != null && courtPic3 != null) {
				%>
				<div class="carousel-item active">
					<img src="resources/images/court_image/<%=courtPic1%>"
						class="d-block w-100" alt="Image 1"
						style="height: 100%; border-radius: 20px;">
				</div>
				<div class="carousel-item">
					<img src="resources/images/court_image/<%=courtPic2%>"
						class="d-block w-100" alt="Image 2"
						style="height: 100%; border-radius: 20px;">
				</div>
				<div class="carousel-item">
					<img src="resources/images/court_image/<%=courtPic3%>"
						class="d-block w-100" alt="Image 3"
						style="height: 100%; border-radius: 20px;">
				</div>
				<%
				} else if (courtPic1 != null || courtPic2 != null || courtPic3 != null) {
				%>
				<%
				if (courtPic1 != null) {
				%>
				<div class="carousel-item active">
					<img src="resources/images/court_image/<%=courtPic1%>"
						class="d-block w-100" alt="Image 1"
						style="height: 100%; border-radius: 20px;">
				</div>
				<%
				}
				%>
				<%
				if (courtPic2 != null) {
				%>
				<div class="carousel-item">
					<img src="resources/images/court_image/<%=courtPic2%>"
						class="d-block w-100" alt="Image 2"
						style="height: 100%; border-radius: 20px;">
				</div>
				<%
				}
				%>
				<%
				if (courtPic3 != null) {
				%>
				<div class="carousel-item">
					<img src="resources/images/court_image/<%=courtPic3%>"
						class="d-block w-100" alt="Image 3"
						style="height: 100%; border-radius: 20px;">
				</div>
				<%
				}
				%>
				<%
				} else {
				%>
				<div class="carousel-item active">
					<img src="resources/images/court_image/f_default.jpg"
						class="d-block w-100" alt="Default Image"
						style="height: 100%; border-radius: 20px;">
				</div>
				<%
				}
				%>
			</div>
			<%
			if ((courtPic1 != null && courtPic2 != null && courtPic3 != null)
					|| (courtPic1 != null || courtPic2 != null || courtPic3 != null)) {
			%>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
			<%
			}
			%>
		</div>




		<div class="row g-1">
			<div class="col-md-7">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<!-- Row 1 - Level and Gender -->
						<div class="row mb-3">
							<!-- Box 1 - Level -->
							<div class="col">
								<i class="bi bi-trophy" style="font-size: 1.5rem;"></i> <strong
									class="d-inline-block mb-3 text-dark" style="font-size: 1rem;">
									&nbsp;&nbsp;NTRP ${vo2.g_ntrp}이상 </strong>
							</div>

							<!-- Box 2 - Gender -->
							<div class="col">
								<i class="bi bi-gender-male" style="font-size: 1.5rem;"></i><i
									class="bi bi-gender-female" style="font-size: 1.5rem;"></i> <strong
									class="d-inline-block mb-3 text-dark" style="font-size: 1rem;">
									&nbsp;&nbsp;${vo2.g_method} </strong>
							</div>
						</div>
						<!-- Row 2 - Floor Type and Indoor/Outdoor -->
						<div class="row mb-1">
							<!-- Box 3 - Floor Type -->
							<div class="col">
								<i class="bi bi-water" style="font-size: 1.5rem;"></i> <strong
									class="d-inline-block mb-3 text-dark" style="font-size: 1rem;">
									&nbsp;&nbsp;바닥 <%=floorType%>
								</strong>
							</div>

							<!-- Box 4 - Indoor/Outdoor -->
							<div class="col">
								&nbsp;&nbsp; <i class="bi bi-umbrella"
									style="font-size: 1.5rem;"></i> <strong
									class="d-inline-block mb-3 text-dark" style="font-size: 1rem;">&nbsp;&nbsp;&nbsp;&nbsp;<%=inOrOut%>
								</strong>
							</div>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<!-- Row 3 - Conv -->
						<div class="row mb-1">
							<!-- Box 5 - Conv -->
							<div class="col" style="display: inline-block;">
								<p style="font-size: 2rem; display: inline-block;">🎾</p>
								<p class="d-inline-block mb-2 text-dark"
									style="font-size: 1rem; display: inline-block;"><%=conv%>
									시설이 있습니다.
								</p>
							</div>
						</div>

						<hr style="border-top: 1px solid #ccc;">
						<!-- Row 4 - Creater -->
						<div class="row mb-1">
							<!-- Box 6 - Creater -->
							<div class="col" style="display: inline-block;">
								<p style="font-size: 2rem; display: inline-block;">🤸</p>
								<p class="d-inline-block mb-2 text-dark"
									style="font-size: 1rem; display: inline-block;">${vo2.g_creater}님이
									만든 매치입니다.</p>
							</div>
						</div>

						<!-- The rest of your content here... -->
					</div>
				</div>

				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">

					<div class="col p-4 d-flex flex-column position-static">
						<div class="row mb-1">
							<strong class="d-inline-block mb-3 text-dark"
								style="font-size: 1.0rem;"><span id="g_name">${vo2.g_name}</span></strong>
							<p class="d-inline-block mb-3 text-dark" style="font-size: 1rem;">${vo2.g_info}</p>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<div class="row mb-1">
							<strong class="d-inline-block mb-3 text-dark"
								style="font-size: 1.0rem;">매치 참가자</strong>
							<c:if test="${empty joins}">
								<div
									style="display: flex; flex-direction: column; align-items: center; text-align: center;">
									<i class="bi bi-file-lock2" style="font-size: 2.5rem;"></i>
									<p class="d-inline-block mb-3 text-dark"
										style="font-size: 1rem;">매치 신청자와 참가자만 신청자 목록을 볼 수 있습니다.</p>
								</div>


							</c:if>
							<div style="white-space: nowrap; overflow: auto;">
								<c:forEach var="join" items="${joins}">
									<p class="d-inline-block mb-3 text-dark"
										style="font-size: 1rem;">${join.g_joiner}</p>
								</c:forEach>
							</div>

						</div>


					</div>
				</div>



			</div>
			<!-- 오른쪽 신청 박스 -->

			<div class="col-md-5">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-1 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-dark">${vo2.g_start_dt}
							<br>
						</strong>
						<p class="mb-1" style="font-size: 1.7rem;">
							<a href="courtSelectOne.do?fac_id=<%=facId%>">${vo2.fac_name}</a>
							${vo2.c_id}
						</p>

						<div class="mb-1 text-muted">${vo2.g_address}</div>
						<hr style="border-top: 1px solid #ccc;">
						<div>
							<strong class="d-inline-block mb-2 text-dark"
								style="font-size: 1.3rem;"><span id="g_bill">${vo2.g_bill}</span>원</strong>
							<div class="mb=0">${vo2.g_start_dt}~${vo2.g_end_dt}</div>
							<div class="mb-1 text-muted" style="font-size: 0.8rem;">(매치
								작성자가 설정한 시간과 비용입니다.)</div>
						</div>
						<hr style="border-top: 1px solid #ccc;">
						<div class="mb-1 text-muted" style="font-size: 1rem;">모집인원
							${vo2.g_amount}명 중 ${vo2.g_remaining}자리 남았습니다.</div>
						<c:choose>
							<c:when test="${vo2.g_open == 'N'}">
								<p style="color: red; text-align: center;"><br>신청 마감</p>
							</c:when>
							<c:otherwise>



								<c:if
									test="${user_id ne null and (param.error eq null or param.error ne 'already_applied')}">
									<c:set var="isJoined" value="false" />
									<c:forEach var="join" items="${joins}">
										<c:if test="${join.g_joiner eq user_id}">
											<p style="color: red; text-align: center;"><br>이미 신청한 매치입니다.</p>
											<c:set var="isJoined" value="true" />
										</c:if>
									</c:forEach>
									<c:if test="${isJoined eq 'false'}">
										<form id="myForm" action="j_insertOK.do" method="GET">
											<input type="hidden" name="g_num" value="${param.g_num}" />
											<input type="hidden" id="g_joiner" name="g_joiner"
												value="${user_id}" />
											<c:if test="${user_id eq null}">
												<button type="button" class="btn btn-primary p-3"
													style="display: flex; align-items: center; text-align: center; justify-content: center; font-size: 16px; width: 100%;"
													class="myButton" onclick="alert('로그인해주세요.');">신청하기</button>
											</c:if>
											<c:if test="${user_id ne null and user_id ne vo2.g_creater}">
												<button type="submit" class="btn btn-primary p-3"
													style="display: flex; align-items: center; text-align: center; justify-content: center; font-size: 16px; width: 100%;"
													class="myButton" id="myButton" onclick="kakaoPayReady()">
													<span style="flex: 1; text-align: center;">신청하기</span>
												</button>
											</c:if>
										</form>
									</c:if>

								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<c:if test="${user_id eq vo2.g_creater}">
					<div
						class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
						<div class="col p-4 d-flex flex-column position-static">
							<div class="d-flex justify-content-between">
								<div class="col p-4 d-flex flex-column position-static">
									<div class="d-flex justify-content-between">
										<a class="btn btn-primary flex-grow-1 me-2"
											href="g_update.do?g_num=${param.g_num}">매치수정</a> <a
											class="btn btn-danger flex-grow-1"
											href="g_deleteOK.do?g_num=${param.g_num}">매치삭제</a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</c:if>


			</div>
		</div>
	</main>
	<!-- 전체  -->

	<jsp:include page="../footer.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<script>
		function showConfirmation() {
			alert("신청이 완료되었습니다.");
			// 신청하기 버튼 누른 뒤에 비활성화
			// 		document.getElementById("applyButton").disabled = true;
		}
	</script>
</body>
</html>



