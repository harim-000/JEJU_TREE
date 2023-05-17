<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/navbar.css">    
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/sidebar.css"> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar_ajax.js"></script>   --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar.js"></script> --%>
</head>
<body>
    <div class="navbar">
        <a href="<%=request.getContextPath()%>/MainPage.go"> <font size="6">MY</font> <font size="4">JEJU</font> </a>
        <c:set var = "kakao_session" value="${KakaoInfo}"/>
        <c:set var = "normal_session" value="${user_id}"/>
        <c:if test="${not empty KakaoInfo or not empty user_id}">
        	<c:if test="${!empty user_id}">
        		${user_id}
        		<a href="normal_logout.go"><font size="5">LOGOUT</font></a>
        	</c:if>
        	<c:if test="${empty user_id}">
        		<a href="logout.go"><font size="5">LOGOUT</font></a>
        	</c:if>
        </c:if>
        <c:if test="${empty KakaoInfo and empty user_id}">
         	<a href="login_page.go"><font size="5">LOGIN</font></a>
        </c:if>
>>>>>>> 8bb81b4cd9827ab65a35d7cc265c38afe4c091e1
    </div>
</body>
</html>
