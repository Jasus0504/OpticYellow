<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<script type="text/javascript">
	function on(cash){
		var value = document.getElementById('cashTotal');
		var formattedCash = cash.toLocaleString();
		value.textContent = "결제금액: " + formattedCash + "원";
	}
</script>
</head>
<body onload="on(${cash.amount_total})">
	<h1>결제가 완료되었습니다.</h1>
	
	<div>
		<ul>
			<li id="cashTotal">결제 금액: 원</li>
			<li>상품명: ${cash.item_name}</li>
			<li>결제일시: ${cash.approved_at}</li>
		</ul>
	</div>
	
	<a href="kakao_cash_ready.do">충전 내역</a>
	
</body>
</html>