<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/sidebar.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar_ajax.js"></script> --%>
    <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/footer.css"> --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js" integrity="sha512-57oZ/vW8ANMjR/KQ6Be9v/+/h6bq9/l3f0Oc7vn6qMqyhvPd1cvKBRWWpzu0QoneImqr2SkmO4MSqU+RpHom3Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>사이드바2</title>
</head>
<body>
    <!--화면영역-->
	<div id="sidebar2_page">
    	<button class="openbtn2" onclick="openMenu(this.className)">
    	☰ 
   		</button>  
	</div>
 	<!--사이드 메뉴 영역-->
	<div class="sidebar2">
		<div class="sidebar2_header">
	    	<a class="closebtn2" onclick="closeMenu(this.className)">X</a>
		</div>
		<div class = "sidebar2_content">
          	<div class = "search_Keyword">
          		검색어를 입력하세요
          		<input placeholder="검색어를 입력하세요">
          	</div>
          	<div class = "search_result">
          	</div>
			 <%@ include file="../calendar/monthly.jsp" %>
	    </div>
 			
	</div>
	      
 </body>
 </html>