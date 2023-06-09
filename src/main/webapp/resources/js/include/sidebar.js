/**
 * 
 */
 	
  function getSearchCont() {

     $.ajax({
         url: 'recent_search_list.go',
         type: "POST",
         dataType: "json",
         contentType: "application/json; charset=utf-8;",
         success: function (data) {
              var dataList = data.key; // 데이터 리스트.
			  var $searchList = $('#searchList'); // 리스트를 표시할 요소.
			
			  $searchList.empty(); // 기존 리스트를 초기화합니다.
			  
			    
			    $.each(dataList, function (index, element) {
			    var keyword = element.search_term;
			    var $li = $('<li>').text(keyword); // 각 항목을 <li> 태그로 생성.
			    $searchList.append($li); // 리스트에 추가.
                 var $icon = $('<i>').addClass("fa-solid fa-square-xmark");
                $li.append($icon); // 버튼을 리스트 항목에 추가합니다.
                 });
			  
			  
           
            console.log(data);
         },
         error :function (jqXHR, textStatus, errorThrown){
            
             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
         }
     });
 }	
 
// 초기화 함수 호출
initializeSidebar();
 
function openMenu(openbtn_className) {
  if (openbtn_className == 'openbtn1') {
    document.getElementById("sidebar1_page").style.marginLeft = "0px";
    document.querySelector('.sidebar1').style.width = "0px";
    document.querySelector('.openbtn1').style.display = 'none';
  } else {
    document.getElementById("sidebar2_page").style.marginRight = "44px";
    document.querySelector('.sidebar2').style.width = "250px";
    document.querySelector('.openbtn2').style.display = 'none';
    document.querySelector('.sidebar2').style.border = '1px solid #6a6a6a'; // 테두리 추가
  }
}

function closeMenu(closebtn_className) {
  if (closebtn_className == 'closebtn1') {
    document.getElementById("sidebar1_page").style.marginLeft = "0";
    document.querySelector('.sidebar1').style.width = "0";
    document.querySelector('.openbtn1').style.display = 'block';
  } else {
    document.getElementById("sidebar2_page").style.marginRight = "0";
    document.querySelector('.sidebar2').style.width = "0";
    document.querySelector('.openbtn2').style.display = 'block';
    document.querySelector('.sidebar2').style.border = 'none'; // 테두리 제거
  }
  
  // 닫혀있을 때만 테두리를 제거합니다.
    if (document.querySelector('.sidebar2').style.width === "0px") {
      document.querySelector('.sidebar2').style.border = 'none'; // 테두리 제거
    }
}

function initializeSidebar() {
  // 페이지 로드 시 초기화
  document.querySelector('.sidebar2').style.border = 'none';
}

// 초기화 함수 호출
initializeSidebar();



