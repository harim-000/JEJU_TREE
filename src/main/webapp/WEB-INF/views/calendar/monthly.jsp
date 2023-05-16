<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- datepicker -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->
<title>Insert title here</title>
</head>
 <body>
    
<label for="from">From</label>
<div id="from" ></div>
<input type="hidden" id="from" name="from">
<label for="to">to</label>
<div id="to" ></div>
<input type="hidden" id="to" name="to">
 
 
<!-- 

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->


<script>
if(typeof $.datepicker.regional == 'object') {
	$.datepicker.regional['kr'] = {
	    closeText: '닫기', // 닫기 버튼 텍스트 변경
	    currentText: '오늘', // 오늘 텍스트 변경
	    changeYear: true,
	    changeMonth: false,
	    monthNames: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
	    monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'], // 개월 텍스트 설정
	    dayNames: ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'], // 요일 텍스트 설정
	    dayNamesShort: ['월','화','수','목','금','토','일'], // 요일 텍스트 축약 설정   
	    dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
	    dateFormat: 'dd/mm/yy' // 날짜 포맷 설정
	};

	// Seeting up default language, Korean
	$.datepicker.setDefaults($.datepicker.regional['kr']);
}
   $(document).ready(function() {
	   console.log(1111);
		  
	    var dateFormat = "mm/dd/yy",
	      from = $( "#from" ).datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
   });
  
  </script>
    
</body>
</html>