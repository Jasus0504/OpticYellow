// 달력 요일
var calendarDays = ["일", "월", "화", "수", "목", "금", "토"];

// 달력 요일 HTML
function calendarWeekHTML(options) {
   var html = "<thead><tr>";
   for (var index = 0; index < calendarDays.length; index++) {
      html += "<th";
      if (index == 0) {
         html += " class=\"sunday\"";
      } else if (index == 6) {
         html += " class=\"saturday\"";
      }
      html += ">" + calendarDays[index];
      if (options.showFullDayName) {
         html += "요일";
      }
      html += "</th>";
   }
   html += "</tr></thead>";
   return html;
}

// 달력 공휴일
var hashmapCalendarHoliday = [];
hashmapCalendarHoliday["1-1"] = {"title" : "새해"};
hashmapCalendarHoliday["3-1"] = {"title" : "삼일절"};
hashmapCalendarHoliday["5-5"] = {"title" : "어린이날"};
hashmapCalendarHoliday["6-6"] = {"title" : "현충일"};
hashmapCalendarHoliday["8-15"] = {"title" : "광복절"};
hashmapCalendarHoliday["10-3"] = {"title" : "개천절"};
hashmapCalendarHoliday["10-9"] = {"title" : "한글날"};
hashmapCalendarHoliday["12-25"] = {"title" : "성탄절"};

// 달력 공휴일 함수
function getCalendarHoliday(calendarYear, calendarMonth, calendarDay) {
   if (Object.keys(hashmapCalendarHoliday).length == 0) {
      return null;
   }
   
   // 공휴일(임시 공휴일 포함)
   var holidayInfo = hashmapCalendarHoliday[calendarYear + "-" + calendarMonth + "-" + calendarDay];
   if (holidayInfo == undefined || holidayInfo == null) {
      holidayInfo = hashmapCalendarHoliday[calendarMonth + "-" + calendarDay];
   }
   return holidayInfo ;
}

// 기본값 처리
function setCalendarOptions(options) {
   // 기본값 처리
   if (options.showDay == undefined || options.showDay == null || typeof options.showDay != "boolean") {
      options.showDay = true;
   }
   if (options.showFullDayName == undefined || options.showFullDayName == null || typeof options.showFullDayName != "boolean") {
      options.showFullDayName = false;
   }
   if (options.showToday == undefined || options.showToday == null || typeof options.showToday != "boolean") {
      options.showToday = true;
   }
   
   // 공휴일 처리
   if (options.arHoliday != undefined && options.arHoliday != null && Array.isArray(options.arHoliday)) {
      Object.assign(hashmapCalendarHoliday, options.arHoliday);
   }
}

// 월간 달력 생성 함수
function calendarHTML(date, options) {
   // 데이터 검증
   if (date == undefined || date == null || typeof date != "object" || !date instanceof Date) {
      return "";
   }
   
   setCalendarOptions(options);
   
   // 달력 연도
   var calendarYear = date.getFullYear();
   // 달력 월
   var calendarMonth = date.getMonth() + 1;
   // 달력 일
   var calendarToday = date.getDate();
   
   var monthLastDate = new Date(calendarYear, calendarMonth, 0);
   // 달력 월의 마지막 일
   var calendarMonthLastDate = monthLastDate.getDate();
   
   var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
   // 달력 월의 시작 요일
   var calendarMonthStartDay = monthStartDay.getDay();
   
   // 주 카운트
   var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
   
   // 오늘
   var today = new Date();
   
   var html = "";
   html += "<table>";
   if (options.showDay) {
      html += calendarWeekHTML(options);
   }
   html += "<tbody>";
   // 위치
   var calendarPos = 0;
   // 날짜
   var calendarDay = 0;
   for (var index1 = 0; index1 < calendarWeekCount; index1++) {
      html += "<tr>";
      for (var index2 = 0; index2 < 7; index2++) {
         html += "<td";
         if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
            calendarDay++;
            html += " data-date=\"" + calendarYear + "-" + (calendarMonth < 10 ? "0" : "") + calendarMonth + "-" + (calendarDay < 10 ? "0" : "") + calendarDay +  "\">";
            html += "<span";
            if (options.showToday && calendarYear == today.getFullYear() && calendarMonth == today.getMonth() + 1
               && calendarDay == today.getDate()) {
               html += " class=\"today\"";
            } else {
               var holiday = false;
               var holidayInfo = getCalendarHoliday(calendarYear, calendarMonth, calendarDay);
               if (holidayInfo != undefined && holidayInfo != null) {
                  html += " class=\"holiday\"";
                  holiday = true;
               }
               if (!holiday) {
                  if (index2 == 0) {
                     html += " class=\"sunday\"";
                  } else if (index2 == 6) {
                     html += " class=\"saturday\"";
                  }
               }
            }
            var holidayInfo = getCalendarHoliday(calendarYear, calendarMonth, calendarDay);
            if (holidayInfo != undefined && holidayInfo != null) {
               html += " title=\"" + holidayInfo.title + "\"";
            }
            html += ">" + calendarDay + "</span>";
         } else {
            html += ">";
         }
         html += "</td>";
         calendarPos++;
      }
      html += "</tr>";
   }
   html += "</tbody>";
   html += "</table>";
   return html;
}

// 주간 달력 생성 함수
function weekHTML(date, options) {
   // 데이터 검증
   if (date == undefined || date == null || typeof date != "object" || !date instanceof Date) {
      return "";
   }
   
   setCalendarOptions(options);
   
   // 달력 연도
   var calendarYear = date.getFullYear();
   // 달력 월
   var calendarMonth = date.getMonth() + 1;
   // 달력 일
   var calendarToday = date.getDate();
   
   // 달력 현재 요일
   var calendarMonthTodayDay = date.getDay();
   
   // 주간 날짜 배열
   var arWeek = [null, null, null, null, null, null, null];
   
   var addDay = 0;
   for (var index = calendarMonthTodayDay; index < 7; index++) {
      arWeek[index] = new Date(calendarYear, calendarMonth - 1, calendarToday + addDay);
      addDay++;
   }

   var addDay = 0;
   for (var index = calendarMonthTodayDay - 1; index >= 0; index--) {
      --addDay;
      arWeek[index] = new Date(calendarYear, calendarMonth - 1, calendarToday + addDay);
   }
   
   // 오늘
   var today = new Date();
   
   var html = "";
   html += "<table>";
   if (options.showDay) {
      html += calendarWeekHTML(options);
   }
   html += "<tbody>";
   html += "<tr>";
   for (var index = 0; index < 7; index++) {
      var year = arWeek[index].getFullYear();
      var month = arWeek[index].getMonth() + 1;
      var day = arWeek[index].getDate();
      html += "<td data-date=\"" + year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day +  "\">";
      html += "<span";
      if (options.showToday && year == today.getFullYear() && month == today.getMonth() + 1
         && day == today.getDate()) {
         html += " class=\"today\"";
      } else {
         var holiday = false;
         var holidayInfo = getCalendarHoliday(year, month, day);
         if (holidayInfo != undefined && holidayInfo != null) {
            html += " class=\"holiday\"";
            holiday = true;
         }
         if (!holiday) {
            if (index == 0) {
               html += " class=\"sunday\"";
            } else if (index == 6) {
               html += " class=\"saturday\"";
            }
         }
      }
      var holidayInfo = getCalendarHoliday(year, month, day);
      if (holidayInfo != undefined && holidayInfo != null) {
         html += " title=\"" + holidayInfo.title + "\"";
      }
      html += ">" + day + "</span>";
      html += "</td>";
   }
   html += "</tbody>";
   html += "</table>";
   return html;
}
//주간 달력 함수
function calendarWeek(date) {
   $(".calendar").removeClass("month").removeClass("year");
   $(".calendar").addClass("week");

   
   var options = {
      showDay : true,
      showFullDayName : true,
      showToday : true,
      arHoliday : hashmapTemporaryHoliday
   };
   
   var html = weekHTML(date, options);
   $("#calendar").attr("data-date", date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
   $("#calendar").html(html);
}

function calendarMonth(date) {
   $(".calendar").removeClass("year").removeClass("week");
   $(".calendar").addClass("month");
   // 년월
   $(".calendar-yearmonth").html(date.getFullYear() + "년 " + (date.getMonth() + 1) + "월");
   
   var options = {
      showDay : true,
      showFullDayName : true,
      showToday : true,
      arHoliday : hashmapTemporaryHoliday
   };
   
   var html = calendarHTML(date, options);
   $("#calendar").attr("data-date", date.getFullYear() + "-" + (date.getMonth() + 1));
   $("#calendar").html(html);
}

function calendarYear(date) {
   $(".calendar").removeClass("month").removeClass("week");
   $(".calendar").addClass("year");
   // 년
   $(".calendar-yearmonth").html(date.getFullYear() + "년");
   
   var options = {
      showDay : true,
      showToday : true,
      arHoliday : hashmapTemporaryHoliday
   };
   
   var html = "";
   html += "<table>";
   html += "<tbody>";
   for (var index1 = 0; index1 < 4; index1++) {
      html += "<tr>";
      for (var index2 = 0; index2 < 3; index2++) {
         html += "<td>";
         html += "<div class=\"calendar-month\">" + (index1 * 3 + index2 + 1) + "월</div>";
         html += calendarHTML(new Date(date.getFullYear(), (index1 * 3 + index2), 1), options);
         html += "</td>";
      }
      html += "</tr>";
   }
   html += "</tbody>";
   html += "</table>";
   
   $("#calendar").attr("data-date", date.getFullYear());
   $("#calendar").html(html);
}

function calendar(date) {
   // 달력 연도
   var calendarYear = date.getFullYear();
   // 달력 월
   var calendarMonth = date.getMonth() + 1;
   // 달력 일
   var calendarToday = date.getDate();
   
   var monthLastDate = new Date(calendarYear, calendarMonth, 0);
   // 달력 월의 마지막 일
   var calendarMonthLastDate = monthLastDate.getDate();
   
   var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
   // 달력 월의 시작 요일
   var calendarMonthStartDay = monthStartDay.getDay();
   
   // 주 카운트   
   var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
   
   // 년월
   $(".calendar-yearmonth").html(calendarYear + "." + calendarMonth);
   
   // 오늘
   var today = new Date();
   
   var html = "";
   html += "<table>";
   html += "<thead>";
   html += "<tr>";
   html += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
   html += "</tr>";
   html += "</thead>";
   html += "<tbody>";
   // 위치
   var calendarPos = 0;
   // 날짜
   var calendarDay = 0;
   for (var index1 = 0; index1 < calendarWeekCount; index1++) {
      html += "<tr>";
      for (var index2 = 0; index2 < 7; index2++) {
         html += "<td>";
         if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
            calendarDay++;
            html += "<span";
            if (calendarYear == today.getFullYear() && calendarMonth == today.getMonth() + 1
               && calendarDay == today.getDate()) {
               html += " class=\"today\"";
            }
            html += ">" + calendarDay + "</span>";
         }
         html += "</td>";
         calendarPos++;
      }
      html += "</tr>";
   }
   html += "</tbody>";
   html += "</table>";
   $("#calendar").html(html);
}
