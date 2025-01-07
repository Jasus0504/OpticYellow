<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품목록</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload...");
	
	$.ajax({
		url: "json_b_selectAll.do",
		method: 'GET',
		dataType: 'json', 
		success: function(data) {
			console.log(data);
			let tag_vo2 = "";
			for (let i = 0; i < data.length; i++) {
				let vo2 = data[i];
				tag_vo2 += `
					<tr>
						<td><a href="p_selectOne.do?p_num=\${vo2.p_num}">\${vo2.p_num}</td>
						<td>\${vo2.p_name}</td>
						<td>\${vo2.seller}</td>
						<td>\${vo2.buyer}</td>
						<td>\${vo2.price}</td>
						<td>\${vo2.bid_time}</td>
						<td>
							<img width="35px" src="resources/uploadimg/thumb_\${vo2.p_pic1}">
						</td>
					</tr>
				`;
			}
			
			$("#vo2").html(tag_vo2);
		},
		error: function(xhr, status, error) {
			console.log('xhr.status:', xhr.status);
		}
	});
});

</script>


</head>
<body>
	<h1>전체 상품 목록</h1>
	<table id="memberList">
		<thead>
			<tr>
				<th>경매물품번호</th>
				<th>물품이름</th>
				<th>판매자</th>
				<th>응찰자</th>
				<th>응찰가격</th>
				<th>응찰시간</th>
				<th>사진</th> 
				
			</tr>
		</thead>
		<tbody id="vo2">
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>	
	</table>
	
</body>
</html>
