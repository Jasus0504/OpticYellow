<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
  .good img,
        .moderate img,
        .bad img,
        .very-bad img {
            display: block;
            max-width: 100px;
            height: auto;
        }
  .hide {
    display: none;
  }
</style>

</head>
<body>
<form>
  <select name="searchKey" id="searchKey">
    <option value="강남구">강남구</option>
    <option value="서초구">서초구</option>
    <option value="중구">중구</option>
    <option value="서대문구">서대문구</option>
    <option value="동대문구">동대문구</option>					
  </select>
  <input type="submit" value="검색">
</form>

<div id="result"></div>
  
<div class="good hide">
  <img src="resources/images/good.jpg" alt="Good Image">
</div>

<div class="moderate hide">
  <img src="resources/images/moderate.jpg" alt="Moderate Image">
</div>

<div class="bad hide">
  <img src="resources/images/bad.jpg" alt="Bad Image">
</div>

<div class="very-bad hide">
  <img src="resources/images/very-bad.jpg" alt="Very Bad Image">
</div>

<script>
  // li 요소 클릭 시 해당 지역의 미세먼지 수치를 가져오는 함수
  function getAirQualityData(stationName) {
    $.ajax({
      url: "AirQualityServlet",
      dataType: "json",
      success: function(response) {
        console.log(response);
        var filteredData = response.response.body.items.filter(function(data) {
          return data.stationName === stationName;
        });
        if (filteredData.length > 0) {
          var pm10Value = filteredData[0].pm10Value;
          var khaiValue = filteredData[0].khaiValue;
          var $result = $("#result");

          if (pm10Value <= 30) {
            $result.text("미세먼지: " + pm10Value + ", 통합대기환경지수: " + khaiValue);
            $result.removeClass().addClass("good");
            $(".good").removeClass("hide");
            $(".moderate").addClass("hide");
            $(".bad").addClass("hide");
            $(".very-bad").addClass("hide");
          } else if (pm10Value > 30 && pm10Value <= 80) {
            $result.text("미세먼지: " + pm10Value + ", 통합대기환경지수: " + khaiValue);
            $result.removeClass().addClass("moderate");
            $(".moderate").removeClass("hide");
            $(".good").addClass("hide");
            $(".bad").addClass("hide");
            $(".very-bad").addClass("hide");
          } else if (pm10Value > 80 && pm10Value <= 150) {
            $result.text("미세먼지: " + pm10Value + ", 통합대기환경지수: " + khaiValue);
            $result.removeClass().addClass("bad");
            $(".bad").removeClass("hide");
            $(".good").addClass("hide");
            $(".moderate").addClass("hide");
            $(".very-bad").addClass("hide");
          } else {
            $result.text("미세먼지: " + pm10Value + ", 통합대기환경지수: " + khaiValue);
            $result.removeClass().addClass("very-bad");
            $(".very-bad").removeClass("hide");
            $(".good").addClass("hide");
            $(".moderate").addClass("hide");
            $(".bad").addClass("hide");
          }
        } else {
          $("#result").text("선택한 지역에 대한 데이터가 없습니다.");
          $(".good").addClass("hide");
          $(".moderate").addClass("hide");
          $(".bad").addClass("hide");
          $(".very-bad").addClass("hide");
        }
      },
      error: function() {
        console.log("데이터를 가져오는 데 실패했습니다.");
        $(".good").addClass("hide");
        $(".moderate").addClass("hide");
        $(".bad").addClass("hide");
        $(".very-bad").addClass("hide");
      }
    });
  }

  $(document).ready(function() {
    $("form").submit(function(e) {
      e.preventDefault(); // Prevent the form from submitting normally

      var selectedOption = $("#searchKey").val(); // Get the selected option value
      getAirQualityData(selectedOption);
    });
  });
</script>

</body>
</html>
