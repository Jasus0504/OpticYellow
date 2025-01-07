<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<jsp:include page="css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<section class="app">
		<aside class="sidebar">
			<header> Menu </header>
			<nav class="sidebar-nav">
				<ul>
					<li><a href="MainHome.do"><i class="ion-bag"></i> <span>중고
								장터</span></a></li>
					<li><a href="#"><i class="ion-ios-settings"></i> <span
							class="">물품 카테고리</span></a>
						<ul class="nav-flyout">
							<li><a href="p_searchList.do?searchKey=racket"><i
									class="ion-ios-alarm-outline"></i>라켓</a></li>
							<li><a href="p_searchList.do?searchKey=racket_bag"><i
									class="ion-ios-camera-outline"></i>라켓 가방</a></li>
							<li><a href="p_searchList.do?searchKey=sports_bag"><i
									class="ion-ios-camera-outline"></i>스포츠 가방</a></li>
							<li><a href="p_searchList.do?searchKey=tshirt"><i
									class="ion-ios-chatboxes-outline"></i>티셔츠</a></li>
							<li><a href="p_searchList.do?searchKey=pants"><i
									class="ion-ios-cog-outline"></i>바지</a></li>
							<li><a href="p_searchList.do?searchKey=shoes"><i
									class="ion-ios-cog-outline"></i>신발</a></li>
							<li><a href="p_searchList.do?searchKey=accessory"><i
									class="ion-ios-cog-outline"></i>액세서리</a></li>
							<li><a href="p_searchList.do?searchKey=ball"><i
									class="ion-ios-cog-outline"></i>테니스</a></li>
							<li><a href="p_searchList.do?searchKey=etc"><i
									class="ion-ios-cog-outline"></i>기타</a></li>
						</ul></li>
					<li><a href="p_insert.do"><i
							class="ion-ios-briefcase-outline"></i> <span class="">나의
								물건판매하기</span></a></li>
					<li id="admin"><a href="adv_p_selectAll.do"><i
							class="ion-ios-analytics-outline"></i> <span class="">전체
								거래목록</span></a>
					<li><a href="#"><i class="ion-ios-analytics-outline"></i>
							<span class="">나의 거래목록</span></a>
						<ul class="nav-flyout">
							<li><a href="b_buy_list.do"><i
									class="ion-ios-timer-outline"></i>나의 응찰 목록</a></li>
							<li><a href="b_sell_list.do"><i
									class="ion-arrow-graph-down-left"></i>나의 판매 목록</a></li>
						</ul></li>
					<li><a href="#"><i class="ion-ios-paper-outline"></i> <span
							class="">거래확정 및 완료</span></a>
						<ul class="nav-flyout">
							<li><a href="confirm_buy_menu.do?buyer=${user_id}"><i
									class="ion-ios-filing-outline"></i>구매 승인하기</a></li>
							<li><a href="confirm_sell_menu.do?seller=${user_id}"><i
									class="ion-ios-information-outline"></i>판매 승인하기</a></li>
							<li><a href="json_searchSeller.do?seller=${user_id}"><i
									class="ion-ios-information-outline"></i>판매 대기jsp</a></li>
						</ul></li>
					<li><a href="r_mylist.do"><i
							class="ion-ios-navigate-outline"></i> <span class="">나의
								신고내역</span></a>
						</li>
					<li id="admin1"><a href="#"><i
							class="ion-ios-navigate-outline"></i> <span class="">신고</span></a>
						<ul class="nav-flyout">
							<li><a href="r_selectAll.do"><i
									class="ion-ios-locked-outline"></i>모든신고 목록</a></li>
							<li><a href="adv_r_insert.do"><i
									class="ion-ios-navigate-outline"></i>신고 답변하기</a></li>
						</ul>
						<li><jsp:include page="AirQuality/SeoulAirQuality.jsp"></jsp:include></li>
				</ul>
			</nav>
		</aside>
	</section>

	<script type="text/javascript">
		$(function() {
			console.log("onload...");
			$
					.ajax({
						url : "json_r_unread.do",
						method : 'GET',
						dataType : 'json',
						success : function(vo2) {
							console.log(vo2);
							let tag_vo2 = ``;

							if (vo2.length > 0) {
								tag_vo2 += `<span class="new-label" style="color: red;"> New</span>`;
							}

							$("a[href='r_selectAll.do']").append(tag_vo2);

						},
						error : function(xhr, status, error) {
							console.log('xhr.status:', xhr.status);
						}
					});
			adminOnly();
			adminOnly1();
		});

		function adminOnly() {
			console.log('${role}');
			var Element = document.getElementById("admin")

			if ('${role}' === 'USER')
				Element.style.display = "none";
		}

		function adminOnly1() {
			console.log('${role}');
			var Element = document.getElementById("admin1")

			if ('${role}' === 'USER')
				Element.style.display = "none";
		}
	</script>
</body>
</html>