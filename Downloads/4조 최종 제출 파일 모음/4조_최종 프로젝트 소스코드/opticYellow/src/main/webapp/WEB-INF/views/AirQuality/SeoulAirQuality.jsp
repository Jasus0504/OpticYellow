<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
.container {
            display: flex;
            gap: 20px;
        }
  
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
<div class="container">
  
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
  <div id="result"></div>
</div>

  <script>
    // 모든 지역의 평균 미세먼지 수치를 가져오는 함수
    function getAllAveragePm10() {
      $.ajax({
        url: "AirQualityServlet",
        dataType: "json",
        success: function(response) {
          console.log(response);
          var allData = response.response.body.items;
          if (allData.length > 0) {
            var averagePm10 = calculateAveragePm10(allData);
            var $result = $("#result");

            if (averagePm10 <= 30) {
              $result.text("현재 서울 평균 미세먼지: " + averagePm10.toFixed(2));
              $result.removeClass().addClass("good");
              $(".good").removeClass("hide");
              $(".moderate").addClass("hide");
              $(".bad").addClass("hide");
              $(".very-bad").addClass("hide");
            } else if (averagePm10 > 30 && averagePm10 <= 80) {
              $result.text("현재 서울 평균 미세먼지: " + averagePm10.toFixed(2));
              $result.removeClass().addClass("moderate");
              $(".moderate").removeClass("hide");
              $(".good").addClass("hide");
              $(".bad").addClass("hide");
              $(".very-bad").addClass("hide");
            } else if (averagePm10 > 80 && averagePm10 <= 150) {
              $result.text("현재 서울 평균 미세먼지: " + averagePm10.toFixed(2));
              $result.removeClass().addClass("bad");
              $(".bad").removeClass("hide");
              $(".good").addClass("hide");
              $(".moderate").addClass("hide");
              $(".very-bad").addClass("hide");
            } else {
              $result.text("현재 서울 평균 미세먼지: " + averagePm10.toFixed(2));
              $result.removeClass().addClass("very-bad");
              $(".very-bad").removeClass("hide");
              $(".good").addClass("hide");
              $(".moderate").addClass("hide");
              $(".bad").addClass("hide");ㄴ
            }
          } else {
            $("#result").text("데이터가 없습니다.");
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

    // 평균 미세먼지 량 계산 함수
    function calculateAveragePm10(data) {
    	console.log(data);
      var sumPm10 = 0;
    
      
      for (var i = 0; i < data.length; i++) {
    	  var pm10Value = parseInt(data[i].pm10Value);

    	  if (!isNaN(pm10Value)) {
    	    sumPm10 += pm10Value;
    	  } else {
    	    sumPm10 += 0;
    	  }
    	}

      var averagePm10 = sumPm10 / data.length;
      console.log(sumPm10);
      return averagePm10;
    }

    $(document).ready(function() {
      getAllAveragePm10(); // 페이지 로딩 시 전체 평균 미세먼지 수치 표시
    });

  </script>
</body>
</html>
