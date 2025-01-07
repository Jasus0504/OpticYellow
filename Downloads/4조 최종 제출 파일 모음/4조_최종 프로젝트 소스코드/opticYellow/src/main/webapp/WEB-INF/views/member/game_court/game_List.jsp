<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Optic Yellow</title>
<link href="resources/mypage/list2.css" rel="stylesheet" type="text/css">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#calendarWrapper {
	width: 33%; /* 페이지의 2/3을 차지하도록 너비 설정 */
	float: left; /* 오른쪽 정렬 */
}

#calendar {
	width: 400px !important; /* 달력의 너비를 300px로 고정 */
	height: 400px; /* 달력의 높이를 300px로 고정 */
}

.current-date {
	background-color: #e6e6e6; /* 현재 날짜의 배경색 */
	font-weight: bold; /* 현재 날짜의 텍스트 굵게 표시 */
	border-radius: 50%;
}

.selected-date {
	background-color: #e6e6e6; /* 선택한 날짜의 배경색 */
	border-radius: 50%;
}

#list-base {
	margin-bottom: 1.5%;
}

#calendar {
	font-size: 18px;
}

body {
	background-color: #F8F9FA !important;
}

.breadcrumb-container {
	display: flex;
	justify-content: flex-end;
	margin-right: -120px;
	margin-top: 30px;
	margin-bottom: 20px;
}

</style>

<script type="text/javascript">
  
  var dateString = "2023-06-30 12:00";
  var date = new Date(dateString);
  var today = new Date();
  var clickedYMD = ""; // 선택한 날짜를 저장하는 변수
  var matchRecords = []; // 매치 기록을 저장하는 배열

  function buildCalendar() {
    var row = null;
    var cnt = 0;
    var calendarTable = document.getElementById("calendar");
    var calendarTableTitle = document.getElementById("calendarTitle");
    calendarTableTitle.innerHTML =
      today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

    var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    while (calendarTable.rows.length > 2) {
      calendarTable.deleteRow(calendarTable.rows.length - 1);
    }

    row = calendarTable.insertRow();

    // 달력의 각 날짜 셀 생성
    for (i = 1; i <= lastDate.getDate() + firstDate.getDay(); i++) {
      if (cnt % 7 == 0) {
        row = calendarTable.insertRow(); // 새로운 행 생성
      }

      cell = row.insertCell(); // 날짜 셀 생성
      cnt += 1;

      if (i > firstDate.getDay()) {
        var date = i - firstDate.getDay();
        cell.setAttribute("id", date); // 셀의 id 속성 설정
        cell.innerHTML = date; // 셀에 날짜 텍스트 표시
        cell.align = "center";
        cell.style.cursor = "pointer"; // 손가락 모양으로 변경

        if (cnt % 7 == 1) {
          cell.innerHTML = "<font color=red>" + date + "</font>"; // 일요일은 빨간색으로 표시
        }

        if (cnt % 7 == 0) {
          cell.innerHTML = "<font color=blue>" + date + "</font>"; // 토요일은 파란색으로 표시
        }

        cell.onclick = function () {
          clickedYear = today.getFullYear();
          clickedMonth = 1 + today.getMonth();
          clickedDate = this.getAttribute("id");

          clickedDate = clickedDate >= 10 ? clickedDate : "0" + clickedDate;
          clickedMonth = clickedMonth >= 10 ? clickedMonth : "0" + clickedMonth;
          clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

          showMatchRecords(clickedYMD); // 선택한 날짜의 매치 기록 표시
        };

        if (cnt % 7 == 1) {
          cell.innerHTML = "<font color=red>" + date + "</font>"; // 일요일은 빨간색으로 표시
        }

        if (cnt % 7 == 0) {
          cell.innerHTML = "<font color=blue>" + date + "</font>"; // 토요일은 파란색으로 표시
        }
      }
    }

    // 남은 빈 셀 채우기
    if (cnt % 7 != 0) {
      for (i = 0; i < 7 - (cnt % 7); i++) {
        cell = row.insertCell(); // 빈 셀 생성
      }
    }
    // 현재 날짜 표시
    var currentDate = today.getDate(); // 현재 날짜
    var currentCell = document.getElementById(currentDate);
    if (currentCell) {
      currentCell.classList.add("current-date");
      
    }
   

    // 현재 날짜에 매치 내역이 있는지 확인
    var matchRecord = matchRecords.find(function (record) {
    	
      return record.date === clickedYMD;
      
    });

    if (matchRecord) {
      // 매치가 있는 날짜를 강조하기 위해 클래스를 추가
      currentCell.classList.add("match-date");
      // 매치 이름을 데이터 속성으로 추가합니다.
      currentCell.setAttribute("data-match", matchRecord.match);
    }
    

  }

  function prevCalendar() {
    today = new Date(
      today.getFullYear(),
      today.getMonth() - 1,
      today.getDate()
    ); // 이전 달로 변경
    buildCalendar(); // 달력 다시 생성
  }

  function nextCalendar() {
    today = new Date(
      today.getFullYear(),
      today.getMonth() + 1,
      today.getDate()
    ); // 다음 달로 변경
    buildCalendar(); // 달력 다시 생성
  }

  function showMatchRecords(date) {
    console.log("Selected date:", date); // 선택한 날짜를 콘솔 창에 출력

    var matchList = document.getElementById("matchList");
    while (matchList.firstChild) {
      matchList.removeChild(matchList.firstChild);
    }

    // 해당 날짜에 매치 기록이 있는지 확인하고 리스트에 추가
    var matchedRecords = matchRecords.filter(function (record) {
      var recordDate = record.date.split(" ")[0]; // 날짜만 추출하여 비교
      return recordDate === date;
    });

    if (matchedRecords.length > 0) {
      matchedRecords.forEach(function (record, index) {
        
        var matchItem = document.createElement("tr");
        matchItem.innerHTML = `
        	<main style="flex: 7; width: 700px;">
			<div class="mx-auto p-3 bg-body rounded shadow-sm" id="list-base">
				<div class="d-flex flex-row text-body-secondary justify-content-between align-items-center"  style="height: 45px !important;">
					<div class="flex-wrap p-2 fs-6 justify-content-center" style="width: 20%; text-align: center;">
						<a href="g_selectOne.do?g_num=\${record.num}" class="text-gray-dark">
							<strong>\${record.startDate}</strong>
						</a>
					</div>
					<div class="p-2 fs-6 justify-content-between" style="width: 55%; display: flex; justify-content: center; flex-wrap: wrap;">
						<div class="p-2 text-dark" style="width: 100%; text-align: left; font-size: 14px;">
							<a href="g_selectOne.do?g_num=\${record.num}">🚩 \${record.fac}</a>
						</div>

						<!-- 두 번째 행 -->
						<div class="p-2 text-gray-dark" style="flex: 1; font-size: 14px; display: flex; align-items: center;">🎾ntrp \${record.ntrp}▲ | 🥎\${record.gameMethod} </div>
					</div>
					<div class="p-2 justify-content-center" style="width: 25%; text-align: center;">
						<button type="button" class="btn btn-primary state" onclick="location.href='g_selectOne.do?g_num=\${record.num}'" style="font-color: balck !important;">매치 보러가기</button>

					</div>
				</div>
			</div>
		</main>
          `;
          matchList.appendChild(matchItem);
        console.log("record.match:", record.match);
      });
		
      var noMatchItem_2 = document.createElement("tr");
      noMatchItem_2.innerHTML =
    	  "<td colspan='7' ><button type='button' class='btn btn-primary state' onclick=\"location.href='g_selectAll.do'\"  style='background-color:transparent !important; border:none; font-size:20px; color: black !important; margin-left: 250px !important; margin-top: 5%;'>더 많은 매치 보러가기</button></td>";
           matchList.appendChild(noMatchItem_2);
      // 콘솔 창에 매치 기록 데이터 출력
      console.log("Match Records:", matchedRecords);
    } else {
      var noMatchItem_1 = document.createElement("tr");
      noMatchItem_1.innerHTML =
        "<td colspan='7' ><p style='margin-left:250px; margin-top: 20%'>해당 날짜에 매치 기록이 없습니다.</p></td>";
      var noMatchItem_2 = document.createElement("tr");
      noMatchItem_2.innerHTML =
    	  "<td colspan='7' style='text-align: center;'><button type='button' class='btn btn-primary state' onclick=\"location.href='g_selectAll.do'\" style='background-color:transparent !important; border:none; font-size:20px; color: black !important; margin-left: 250px;'>더 많은 매치 보러가기</button></td>";
      
      matchList.appendChild(noMatchItem_1);
      matchList.appendChild(noMatchItem_2);
      // 콘솔 창에 매치 기록이 없음을 출력
      console.log("해당 날짜에 매치 기록이 없습니다.");
    }
 
  }
 

  function game_mylist() {
    console.log("game_mylist()....");
    var g_joiner = "${user_id}";

    var todayDate = new Date();
    var clickedYMD =
    	todayDate.getFullYear() +
        "-" +
        ("0" + (todayDate.getMonth() + 1)).slice(-2) +
        "-" +
        ("0" + todayDate.getDate()).slice(-2);

    $.ajax({
      url: "json_game_list.do",
      data: {
        g_joiner: g_joiner,
      },
      method: "GET",
      dataType: "json",
      success: function (arr) {
        console.log("ajax...success:", arr);
        today = new Date();
        console.log("today: ", today);
        
        matchRecords = arr.map(function (vo) {
          return {
        	num: vo.g_num,
            date: vo.g_start_dt,
            match: vo.g_name,
            schedule: vo.g_start_dt + " ~ " + vo.g_end_dt,
            participants: vo.g_amount,
            applicationAmount: vo.g_bill,
            gameMethod: vo.g_method,
            ntrp: vo.g_ntrp,
            info:vo.g_info,
            fac:vo.fac_name,
            startDate:vo.g_start_dt,
  
          };
        });

        buildCalendar(); 
        showMatchRecords(clickedYMD);
      },
      error: function (xhr, status, error) {
        console.log("xhr.status:", xhr.status);
      },
    }); //end $.ajax()...
    
  }
  

</script>


</head>
<body onload="game_mylist()">

	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="myPage.do">마이페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">신청내역(매치)</li>
			</ol>
		</nav>
	</div>
	<div style="justify-content: center; margin-left: 16%; margin-bottom:10rem;">
		<div style="flex: 0;">
			<!-- 왼쪽 공백 -->
		</div>
		<div style="flex: 3;">
			<div id="calendarWrapper">
				<table id="calendar" style="width: 100%;">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀
						</label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶
						</label></td>
					</tr>
					<tr>
						<td align="center"><font color="red">일</td>
						<!-- 일요일 표시 -->
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color="blue">토</td>
						<!-- 토요일 표시 -->
					</tr>
				</table>
			</div>
		</div>
		<div style="flex: 0.5;">
			<!-- 가운데 공백 -->
		</div>
		<div style="flex: 7;">
			<jsp:include page="gamecourt_top_menu.jsp"></jsp:include>


			<div id="matchList"></div>

		</div>
		<div style="flex: 0.7;">
			<!-- 오른쪽 공백 -->
		</div>

	</div>

	<jsp:include page="../../footer.jsp"></jsp:include>

</body>