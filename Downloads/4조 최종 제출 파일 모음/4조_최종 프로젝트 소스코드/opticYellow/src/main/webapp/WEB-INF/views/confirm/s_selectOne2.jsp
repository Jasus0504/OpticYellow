<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>

<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

    console.log("onload...");
    $.ajax({
        url : "C_SELECTLIST_SELLER_INFO.do",
        data:{p_num:${param.p_num}},
        method:'GET',
        dataType:'json', 
        success : function(vo2) {
            console.log(vo2);
            console.log(vo2.b_granted,vo2.buyer);
            if(vo2.b_granted == 'Ok'){
            	let tableRow = `
                <tr>
                <td>\${vo2.buyer}</td>
                    <td>\${vo2.tel}</td>
                    <td>\${vo2.addr}</td>
                </tr>        
         
            `;
            
            $("#vo2").html(tableRow);
               
            }else {
                let tableRow = `
                    <tr>
                	<td colspan="3">구매자가 아직 최종거래에 동의하지 않았습니다</td>
                    </tr>
                `;
                $("#vo2").html(tableRow);
            }

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });

 
});

</script>
</head>
<body>
	<h1>구매자 정보</h1>

	<table id="memberList">
		<thead>
			<tr>
				<th>구매자_id</th>
				<th>구매자 전화번호</th>
				<th>구매자 집 주소</th>
			</tr>
		</thead>
		<tbody id="vo2">
		</tbody>
	</table>
</body>
</html>
