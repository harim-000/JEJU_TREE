<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--  <script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script> -->
<!-- <script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script> -->
<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.ie11.min.js"></script>
<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script> <!-- Latest Version -->
<!-- 폰트어썸 cdn링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" /> -->
 </head>
 <body>

        <nav class="navbar">
          <button class="button is-rounded today" id="nowBtn">Today</button>
          <button class="button is-rounded prev" id="prevBtn">
            <i class="fa-solid fa-angle-left"></i>
          </button>
          <button class="button is-rounded next" id="nextBtn">
           <i class="fa-solid fa-angle-right"></i>
          </button>
          <button id="createEvent">일정생성</button>
          <span class="navbar--range"></span>
        </nav>
      <main id="container"></main>

<script type="text/javascript">

$(document).ready(function(){

 var calendar = new tui.Calendar(document.getElementById('container'), {
  defaultView: 'week',
	 useCreationPopup: false,
     useDetailPopup: false,
      
  
 });
 
 calendar.setOptions({
	 week: {
	    showNowIndicator: false,
	    taskView: false,    // can be also ['milestone', 'task']
	    eventView: ['time'],
	    dayNames: ['월', '화', '수', '목', '금', '토', '일'],
	    
	  },
	});
 

 
 console.log(calendar);
 console.log(calendar);
 calendar.render();


 
//일정 추가 버튼 클릭 시
calendar.on('beforeCreateEvent', function(eventData) {
// 사용자 정의 팝업을 여기서 생성 및 표시
var scheduleData = {
    // 팝업에서 입력받은 일정 정보를 저장할 객체
    // ex) title: '', start: '', end: '', ...
  };

  // 팝업 생성
  var popup = window.open('popup.html', 'schedulePopup', 'width=400, height=400');

  // 팝업 페이지에서 일정 정보를 입력받은 후, 저장 버튼을 클릭하면 호출되는 콜백 함수
  window.receiveScheduleData = function(data) {
    scheduleData = data; // 팝업에서 입력받은 일정 정보를 저장
    popup.close(); // 팝업 닫기

    // 일정 생성
    calendar.createSchedules([scheduleData]);
  };

  // 팝업 페이지에 일정 정보 전달
  popup.postMessage(scheduleData, '*');
// 원하는 HTML, CSS, 이벤트 핸들러 등을 사용하여 팝업을 만들 수 있습니다.
});

//일정 클릭 시
calendar.on('clickEvent', function(eventData) {
// 사용자 정의 팝업을 여기서 생성 및 표시
// 원하는 HTML, CSS, 이벤트 핸들러 등을 사용하여 팝업을 만들 수 있습니다.
});

/* //일정 수정 시
calendar.on('beforeUpdateEvent', function(eventData) {
  // eventData.schedule: 수정할 일정 객체
  // 원하는 동작 수행 후 일정을 수정
  // ex) eventData.schedule.title = '새로운 제목';
  calendar.updateEvent(eventData.schedule.id, eventData.schedule.calendarId, eventData.schedule);
});
 */
//일정 삭제 시
calendar.on('beforeDeleteSchedule', function(eventData) {
// eventData.schedule: 삭제할 일정 객체
// 원하는 동작 수행 후 일정을 삭제
calendar.deleteSchedule(eventData.schedule.id, eventData.schedule.calendarId);
});

 calendar.createEvents([
    {
        id: '1',
        calendarId: '1',
        backgroundColor: 'blue',
        dragBackgroundColor: 'green',
        title: 'Bank IT Center',
        category: 'time',
        isVisible: true,
        dueDateClass: '',
        start: '2023-05-15T09:00:00+09:00',
        end: '2023-05-15T18:00:00+09:00',
        isReadOnly: true    // schedule is read-only
    },
 {
        id: '2',
        calendarId: '2',
        title: 'AirShow Seoul 2018',
        isReadOnly :false,
        backgroundColor: 'blue',
        dragBackgroundColor: 'green',
        category: 'time',
        dueDateClass: '',
        start: '2023-05-17T09:00:00+10:00',
        end: '2023-05-17T09:00:00+13:00'
    },
 {
        id: '3',
        calendarId: '3',
        title: 'Block Chain Seoul 2018',
        category: 'time',
        dueDateClass: '',
        start: '2023-05-18T13:30:00+09:00',
        end: '2023-05-18T09:00:00+12:00'
    },
    {
        id: '4',
        calendarId: '4',
        title: '${title }',
        category: 'time',
        dueDateClass: '',
        start: '2023-05-19T13:30:00+09:00',
        end: '2023-05-19T13:00:00+16:00'
    }


]);

 /* 이동 및 뷰 타입 버튼 이벤트 핸들러 */
 nextBtn.addEventListener('click', () => {
   calendar.next();                          // 현재 뷰 기준으로 다음 뷰로 이동
 });

 prevBtn.addEventListener('click', () => {
   calendar.prev();                          // 현재 뷰 기준으로 이전 뷰로 이동
 });
 nowBtn.addEventListener('click', () => {
	 calendar.today();                         // 현재 뷰 기준으로 이전 뷰로 이동
});

 calendar.on('beforeUpdateEvent', function ({ event, changes }) {
        const { id, calendarId } = event;
     
        calendar.updateEvent(id, calendarId, changes);
        
      });
 
//여러 속성을 바꾸는 경우
calendar.updateEvent('3', '3', {
title: 'Going vacation',
state: 'Free',
start: '2023-05-19T00:00:00',
end: '2023-05-19T23:59:59',
});


calendar.deleteEvent('1', '1');



 
 });


 </script>

 </body>
</html>

