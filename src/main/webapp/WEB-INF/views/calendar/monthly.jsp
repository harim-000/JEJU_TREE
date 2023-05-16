<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<title>Insert title here</title>
</head>
<body>
 <body>
    
    
    <input type='text' class="form-control linkedCalendars" placeholder="날짜 선택"/>
<span class="input-group-text calendar-icon">
<i data-feather="calendar" class="feather-sm"></i>
</span>
    
    <script type="text/javascript">
    
    $('.linkedCalendars').daterangepicker({
    	linkedCalendars: false,
    	"locale":{
    	"format": "YYYY-MM-DD",
    	"separator": " ~ ",
    	"applyLabel": "적용",
    	"cancelLabel": "취소",
    	"fromLabel": "From",
    	"toLabel": "To",
    	"customRangeLabel": "Custom",
    	"daysOfWeek": ["일","월", "화", "수", "목", "금", "토"],
    	"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"] },
    	}, function (start, end, label) {
    	console.log('선택된 날짜: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    	});

    	 
</script>
    
    </body>
</body>
</html>