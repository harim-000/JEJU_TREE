<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value = "<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/navbar.css">    
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/include/sidebar.css"> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar_ajax.js"></script>   --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/include/sidebar.js"></script> --%>
</head>
<body>
    <nav class="navbar">
    <div class="left">
        <a href="<%=request.getContextPath()%>/MainPage.go"><img src="<%=request.getContextPath() %>/resources/images/title.png"></a>
    </div>
        <div class="right">
        <c:set var = "kakao_session" value="${Kakao_info}"/>
        <c:set var = "normal_session" value="${user_id}"/>
           <c:if test="${!empty user_id}">
           <a href="PlanBoardList.go" class="nav_mypage"><font size="4">COMMUNITY</font></a>&nbsp;&nbsp;&nbsp;
           <a href="mypage.go" class="nav_mypage"><font size="4">MYPAGE</font></a>&nbsp;&nbsp;&nbsp;
              <a href="normal_logout.go"  class="logout"><font size="4">LOGOUT</font></a>
           </c:if>
           <c:if test="${!empty kakao_session}">
           <c:set var="kakaoInfo" value="${sessionScope.Kakao_info}" />
         <c:set var="kakao_id" value="${kakaoInfo['kakao_id']}"/>
         <c:set var="kakao_token" value="${kakaoInfo['kakao_token']}"/>
         <c:set var="kakao_nickname" value="${kakaoInfo['kakao_nickname']}"/>
         <c:set var="user_join" value="${kakaoInfo['user_join']}"/>
           <!--둘중 하나가 세션에 있으면 로그아웃 창으로 변경 
           1.세션명이 user_id 면 일반회원 로그아웃 태그 제공
           2.두번쨰 로그아웃은 둘중하나는 세션이 있는 상태 이지만 세션이 유저아이디가 아닌경우 이기 떄문에 카카오 로그아웃 경로로 제공 -->
              <%-- ${kakao_nickname}님 안녕하세요
              ${user_join} --%>
              <a href="PlanBoardList.go" class="nav_mypage"><font size="4">COMMUNITY</font></a>&nbsp;&nbsp;&nbsp;
              <a href="mypage.go" class="nav_mypage"><font size="4">MYPAGE</font></a>&nbsp;&nbsp;&nbsp;
              <!--카카오 계정과 함께 로그아웃-->
              <a href="https://kauth.kakao.com/oauth/logout?client_id=b1b9f0baef115c1e6588625cf198429b&logout_redirect_uri=http://localhost:8585/model/logout.go"  class="logout"><font size="4">LOGOUT</font></a> 
           	  <!--배포주소 요청 경로  -->
             <!--  <a href="https://kauth.kakao.com/oauth/logout?client_id=b1b9f0baef115c1e6588625cf198429b&logout_redirect_uri=http://13.209.236.56:8080/jeju_tree/logout.go"  class="logout"><font size="4">LOGOUT</font></a> -->
           </c:if>
        <c:if test="${empty kakao_session and empty normal_session}">
        <!--어느 계정으로도 로그인 되지 않은 경우  -->
            <a href="login_page.go"  class="login"><font size="4">LOGIN</font></a>
        </c:if>
            </div>
    </nav>
</body>
</html>