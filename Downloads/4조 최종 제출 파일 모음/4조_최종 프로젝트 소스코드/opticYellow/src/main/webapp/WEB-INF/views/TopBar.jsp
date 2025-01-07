<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<h1>Optical 거래소</h1>
	<div style="padding:5px">
		<form action="p_searchList.do">
			<select name="searchKey" id="searchKey">
				<option value="AllProduct">전체</option>
						<option value="racket">라켓</option>
						<option value="racket_bag">라켓 가방</option>
						<option value="sports_bag">스포츠 가방</option>
						<option value="tshirt">티셔츠</option>
						<option value="pants">바지</option>
						<option value="shoes">신발</option>
						<option value="accessory">액세서리</option>
						<option value="ball">테니스 공</option>
						<option value="etc">기타</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="">
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>