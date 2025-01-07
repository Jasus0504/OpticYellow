<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
#pic {
	width: 300px;
	height: 200px;
}
.form-select {
	width:10%;
	border-top-right-radius:0;
	border-bottom-right-radius:0;
}

.form-control {
	border-top-left-radius:0;
	border-bottom-left-radius:0;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script type="text/javascript">
    $(function(){
		$.ajax({
			url : "json_searchResultSearchList.do",
			data:{
				searchWord:'${param.searchWord}'
			},
			method:'GET',
			dataType:'json',
			success : function(arr) {
				console.log('ajax...success:', arr);
				
	 			let tag_vos = '';
	 			let counter = 0;

                $.each(arr, function (index, vo) {
                    if (counter % 3 === 0) {
                        tag_vos += `<div class="row mb-5">`;
                    }

                    tag_vos += `
                        <div class="col-sm-12 col-md-4">
                            <div class="card mb-2" style="width: 18rem;">
                                <img id="pic" src="resources/images/court_image/\${vo.court_pic1}" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title mb-2">\${vo.fac_name}</h5>
                                <a href="courtSelectOne.do?fac_id=\${vo.fac_id}" class="btn btn-primary">상세정보</a>
                            </div>
                        </div>
                    `;

                    counter++;

                    if (counter % 3 === 0) {
                        tag_vos += `</div>`;
                    }
                });

                if (counter % 3 !== 0) {
                    tag_vos += `</div>`;
                }	

                $("#vos").html(tag_vos);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
    }); // end onload()...
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="py-5 text-center">
		<h2>검색 결과</h2>
	</div>
<div id="vos" class="container text-center">
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>
