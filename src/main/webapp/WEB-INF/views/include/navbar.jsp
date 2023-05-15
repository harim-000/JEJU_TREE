<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/navbar.css">    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/sidebar.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar_ajax.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar.js"></script>
</head>
<body>
    <div class="navbar">
        <a href="#"> <font size="6">MY</font> <font size="4">JEJU</font> </a>
        <a href="login_page.go"><font size="5">LOGIN</font></a>
    </div>
</body>
</html>
