<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="TopBar.jsp"></jsp:include>
	
	<P> The time on the server is ${m_id}. </P>
	<h5><a href ="betaHome.do">가즈</a></h5>
	<h5><a href ="json_r_mylist.do?r_reporter=${user_id}">jsp</a></h5>
	<h5><a href ="json_aq_selectAll.do">AirQualityAPI</a></h5>
	<h5><a href ="SeoulAirQuality.do">SeoulAirQualityAPI</a></h5>
</body>
</html>