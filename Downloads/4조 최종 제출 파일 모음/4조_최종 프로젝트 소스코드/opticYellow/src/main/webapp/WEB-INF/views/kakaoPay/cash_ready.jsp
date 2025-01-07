<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	// onload
	function on(cash){
		var value = document.getElementById('nowCash');
		var formattedCash = cash.toLocaleString();
		value.textContent = "보유 캐시: " + formattedCash + "원";
		
		$.ajax({
			url: "json_cashList.do",
			method: "POST",
			dataType: "json",
			success:function(vos){
				let tag_vos = ``;
				
	 			$.each(vos,function(index,vo){
	 				var value = vo.amount_total;
	 				// JavaScript의 Number 객체의 toLocaleString() 메서드를 사용
	 				// 지역화된 숫자 형식 적용 가능
	 				var formattedValue = value.toLocaleString();
	 				
	 				tag_vos += `
		 				<tr>
		 					<td>\${vo.item_name}</td>
		 					<td>\${vo.quantity}</td>
		 					<td>\${formattedValue}원</td>
		 					<td>\${vo.approved_at}</td>
		 				</tr>
	 				`;
	 			});
	 			
	 			$("#cashList").html(tag_vos);
				
			},
			error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
			}
		}) // end ajax
	} // end onload......

	function kakaoPayReady(){
		var selectValue = document.getElementById("selectCash").value;
		
		$.ajax({
			url: "rest_kakaoPayReady.do",
			data: {total_cash : selectValue},
			method: "POST",
			dataType: "json",
			success:function(data){
				// 전달받은 data의 결제준비 요청 페이지 링크로 새창 열기
				window.open(data.next_redirect_pc_url);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
			}
		}) // end ajax
		
	} // end kakaoPayReady()
</script>
</head>
<body onload="on(${cash.cash})">
	<h1>충전 내역</h1>
	
	<table>
		<tr>
			<td id="nowCash"></td>
		</tr>
		<tr>
			<td>
				<select id="selectCash">
					<option value="10000">￦10,000</option>
					<option value="30000">￦30,000</option>
					<option value="50000">￦50,000</option>
					<option value="70000">￦70,000</option>
					<option value="100000">￦100,000</option>
					<option value="150000">￦150,000</option>
					<option value="200000">￦200,000</option>
				</select>
				<button onclick="kakaoPayReady()">캐시충전</button>
			</td>
		</tr>
		
	</table>
	
	<h4>충전 히스토리</h4>
	
	<table>
		<thead>
			<tr>
				<td>상품명</td>
				<td>수량</td>
				<td>결제금액</td>
				<td>결제 승인시각</td>
			</tr>
		</thead>
		<tbody id="cashList">
		
		</tbody>		
	</table>
	
</body>
</html>