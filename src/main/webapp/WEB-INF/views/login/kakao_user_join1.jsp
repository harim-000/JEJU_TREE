<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(일반)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/user/kakao_join.js"></script>
</head>
<body>
<c:set var = "share_id" value="${param.share_id}"/>
<c:if test="${!empty share_id}">
<input type = "hidden" value="${share_id}">
<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/invitedKakao_join_ok.go?share_id=${share_id}" onsubmit="return joinFormCheck()">
</c:if>
<c:if test="${empty share_id}">
<form method="post" name="joinForm" id="joinForm" action="<%=request.getContextPath()%>/kakao_join_ok.go" onsubmit="return joinFormCheck()">
</c:if>	
	<table>
		<h1>카카오 계정 연동 회원가입</h1>
		<tr>
			<th>아이디(카카오 연동이메일)</th>
			<td>
				<input readonly type="text" name = "user_id" id = "user_id" value = "${param.user_email}">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력해주세요." onkeyup="pwdKorCheck(this)" onchange="pwdInput()">
				<br>
				<span id="pwdcheck"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="user_repwd" id="user_repwd" placeholder="비밀번호를 확인해주세요." onchange="pwdInput()">
				<br>
				<span id="repwdcheck"></span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="user_name" id="user_name" placeholder="홍길동">
				<br>
				<span id="namecheck"></span>
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="user_nickname" id="user_nickname" placeholder="홍길동">
				<br>
				<span id="user_nicknamecheck"></span>
			</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>
				<input type="text" name="user_phone" id="user_phone"  maxlength="11" placeholder="010-0000-0000">
				<span id="phonecheck"></span>
			</td>
		</tr>
		<tr>
			<th>이메일(카카오 이메일)</th>
			<td>
				<input type="text" readonly name="user_email" id="user_email" value = "${param.user_email}">
			</td>
		</tr>
		<tr>
			<td colspan="2" align = "center">
			<input type = "submit" value = "회원가입">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>