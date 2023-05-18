<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	
    <title>사이드바1</title>
</head>
<body>
<!--화면영역-->
 <div id="sidebar1_page">
     <button class="openbtn1" onclick="openMenu(this.className)">
     	☰ 
     </button>  
 </div>
    <!--사이드 메뉴 영역-->
 <div class="sidebar1">
 	<!--닫기 버튼  -->
 	<div class="sidebar1_header">
 		<a class="closebtn1" onclick="closeMenu(this.className)">X</a>
 	</div>
 	<div class = "sidebar1_content">
     	<div class = "search_Keyword">
     	 
        

     		<form id = "sidebar_search_form" method = "post"  action="/model/search_insertok.go">
			        <input type="hidden" name="kakao" value="">
			        <input type="hidden" name="normal" value="hong">
	     		<input onclick="getSearchCont()" class = "search_keyword" name="search_keyword" placeholder="검색어를 입력하세요">

	     		&nbsp;&nbsp;<input type="submit" value ="검색">
     		</form>
     	</div>
     	<div class="search_result1">
		    <ul id="searchList"></ul>
		</div>
     	
  		 
     </div>
 </div>
<script type="text/javascript">

 </script>
</body>
</html>