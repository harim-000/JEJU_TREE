<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사이드바</title>
    <style>
      .location img {
    	max-width: 70%;
    	height: auto;
	}
    </style>
</head>
<body>
    <div id="sidebar" >
        <div class="location" data-lat="33.4588" data-lng="126.9423">
            <img src="<%=request.getContextPath()%>/resources/images/markerbackground/jeju1.jpg" alt="제주도1">
            <p>제주도 관광지 1</p>
        </div>
        <div class="location" data-lat="33.489011" data-lng="126.498302">
            <img src="<%=request.getContextPath()%>/resources/images/markerbackground/jeju2.jpg" alt="제주도2">
            <p>제주도 관광지 2</p>
        </div>
        <!-- More locations can be added here -->
    </div>
</body>
</html>